<#
.SYNOPSIS
    Audit Active Directory password and lockout policy, Fine Grained Password Policy and stale / never-expire accounts. Requires the ActiveDirectory module.

.DESCRIPTION
    Part of the Dargslan Windows Admin Tools collection.
    Free Cheat Sheet: https://dargslan.com/cheat-sheets/ad-password-policy-audit-2026
    Full Guide:       https://dargslan.com/blog/ad-password-policy-audit-powershell-2026
    More tools:       https://dargslan.com

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

$script:Banner = @"
+----------------------------------------------------------+
|  Dargslan AD Password Policy Audit                      
|  https://dargslan.com - Free cheat sheets & eBooks       |
+----------------------------------------------------------+
"@

function Get-DargslanAdPasswordPolicy {
    <#
    .SYNOPSIS
        Return the default domain password and lockout policy.
    #>
    [CmdletBinding()]
    param()
    if (-not (Get-Module -ListAvailable -Name ActiveDirectory)) {
        throw 'ActiveDirectory module is required (RSAT-AD-PowerShell).'
    }
    Import-Module ActiveDirectory -ErrorAction Stop
    $p = Get-ADDefaultDomainPasswordPolicy
    [pscustomobject]@{
        Domain                  = (Get-ADDomain).DNSRoot
        MinLength               = $p.MinPasswordLength
        Complexity              = $p.ComplexityEnabled
        MaxAgeDays              = $p.MaxPasswordAge.Days
        MinAgeDays              = $p.MinPasswordAge.Days
        HistoryCount            = $p.PasswordHistoryCount
        ReversibleEncryption    = $p.ReversibleEncryptionEnabled
        LockoutThreshold        = $p.LockoutThreshold
        LockoutDurationMinutes  = $p.LockoutDuration.TotalMinutes
        LockoutWindowMinutes    = $p.LockoutObservationWindow.TotalMinutes
    }
}

function Get-DargslanAdFineGrainedPolicies {
    <#
    .SYNOPSIS
        Return Fine Grained Password Policies (PSO) and the accounts they apply to.
    #>
    [CmdletBinding()]
    param()
    Import-Module ActiveDirectory -ErrorAction Stop
    Get-ADFineGrainedPasswordPolicy -Filter * | ForEach-Object {
        [pscustomobject]@{
            Name           = $_.Name
            Precedence     = $_.Precedence
            MinLength      = $_.MinPasswordLength
            Complexity     = $_.ComplexityEnabled
            MaxAgeDays     = $_.MaxPasswordAge.Days
            HistoryCount   = $_.PasswordHistoryCount
            AppliesTo      = ($_.AppliesTo -join ', ')
        }
    }
}

function Get-DargslanAdStaleAccounts {
    <#
    .SYNOPSIS
        Find enabled accounts with no logon for N days (default 90).
    #>
    [CmdletBinding()]
    param([int]$Days = 90)
    Import-Module ActiveDirectory -ErrorAction Stop
    $cutoff = (Get-Date).AddDays(-$Days)
    Get-ADUser -Filter {Enabled -eq $true} -Properties LastLogonDate, PasswordLastSet, PasswordNeverExpires |
        Where-Object { $_.LastLogonDate -lt $cutoff } |
        Select SamAccountName, LastLogonDate, PasswordLastSet, PasswordNeverExpires
}

function Get-DargslanAdPasswordAuditReport {
    <#
    .SYNOPSIS
        Combined report with PASS / WARN / FAIL verdict.
    #>
    [CmdletBinding()]
    param([int]$StaleDays = 90)
    $pol   = Get-DargslanAdPasswordPolicy
    $fgpp  = @(Get-DargslanAdFineGrainedPolicies)
    $stale = @(Get-DargslanAdStaleAccounts -Days $StaleDays)
    Import-Module ActiveDirectory -ErrorAction Stop
    $never = @(Get-ADUser -Filter {Enabled -eq $true -and PasswordNeverExpires -eq $true} -Properties PasswordLastSet)
    $score = 0
    if ($pol.MinLength -ge 14)             { $score++ }
    if ($pol.Complexity)                     { $score++ }
    if ($pol.LockoutThreshold -gt 0 -and $pol.LockoutThreshold -le 10) { $score++ }
    if (-not $pol.ReversibleEncryption)      { $score++ }
    if ($never.Count -le 3)                 { $score++ }
    $verdict = if ($score -ge 4) { 'PASS' } elseif ($score -ge 2) { 'WARN' } else { 'FAIL' }
    [pscustomobject]@{
        Policy          = $pol
        FineGrained     = $fgpp
        StaleAccounts   = $stale
        NeverExpire     = $never | Select SamAccountName, PasswordLastSet
        StaleCount      = $stale.Count
        NeverExpireCount= $never.Count
        Score           = $score
        Verdict         = $verdict
        TimeStamp       = (Get-Date).ToString('s')
    }
}

function Export-DargslanAdPasswordAuditReport {
    <#
    .SYNOPSIS
        Export the AD password audit to HTML and JSON.
    #>
    [CmdletBinding()]
    param([int]$StaleDays = 90, [string]$OutDir = (Join-Path $env:TEMP 'DargslanAdAudit'))
    if (-not (Test-Path $OutDir)) { New-Item -Type Directory -Path $OutDir | Out-Null }
    $r = Get-DargslanAdPasswordAuditReport -StaleDays $StaleDays
    $json = Join-Path $OutDir 'ad-password-audit.json'
    $html = Join-Path $OutDir 'ad-password-audit.html'
    $r | ConvertTo-Json -Depth 6 | Set-Content $json -Encoding UTF8
    $body  = "<h1>AD Password Audit - $($r.Policy.Domain)</h1>"
    $body += "<p>Verdict: <b>$($r.Verdict)</b> ($($r.Score)/5)</p>"
    $body += '<h2>Default Policy</h2>' + ($r.Policy | ConvertTo-Html -Fragment)
    $body += '<h2>FGPP</h2>'           + ($r.FineGrained | ConvertTo-Html -Fragment)
    $body += '<h2>Never-expire accounts</h2>' + ($r.NeverExpire | ConvertTo-Html -Fragment)
    $body += "<h2>Stale ($StaleDays+ days) </h2>" + ($r.StaleAccounts | ConvertTo-Html -Fragment)
    ConvertTo-Html -Body $body -Title 'AD Password Audit' | Set-Content $html -Encoding UTF8
    [pscustomobject]@{ Json = $json; Html = $html; Verdict = $r.Verdict }
}


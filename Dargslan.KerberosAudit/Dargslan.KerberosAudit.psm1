<#
.SYNOPSIS
    Audit Kerberos posture in Active Directory: unconstrained delegation, duplicate SPNs and AS-REP roastable accounts.

.DESCRIPTION
    Part of the Dargslan Windows Admin Tools collection.
    Free Cheat Sheet: https://dargslan.com/cheat-sheets/kerberos-delegation-audit-2026
    Full Guide:       https://dargslan.com/blog/kerberos-delegation-audit-powershell-2026
    More tools:       https://dargslan.com

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

$script:Banner = @"
+----------------------------------------------------------+
|  Dargslan AD Kerberos Audit                             
|  https://dargslan.com - Free cheat sheets & eBooks       |
+----------------------------------------------------------+
"@

function Get-DargslanUnconstrainedDelegation {
    <#
    .SYNOPSIS
        Find user / computer accounts with TRUSTED_FOR_DELEGATION (unconstrained).
    #>
    [CmdletBinding()]
    param()
    Import-Module ActiveDirectory -ErrorAction Stop
    $users = Get-ADUser -LDAPFilter '(userAccountControl:1.2.840.113556.1.4.803:=524288)' -Properties userAccountControl |
        Select SamAccountName, @{N='Type';E={'User'}}
    $comps = Get-ADComputer -LDAPFilter '(userAccountControl:1.2.840.113556.1.4.803:=524288)' -Properties userAccountControl, OperatingSystem |
        Select Name, OperatingSystem, @{N='Type';E={'Computer'}}, @{N='SamAccountName';E={$_.Name + '$'}}
    $users + $comps
}

function Get-DargslanConstrainedDelegation {
    <#
    .SYNOPSIS
        Find accounts with constrained / Resource-Based delegation.
    #>
    [CmdletBinding()]
    param()
    Import-Module ActiveDirectory -ErrorAction Stop
    Get-ADObject -LDAPFilter '(|(msDS-AllowedToDelegateTo=*)(msDS-AllowedToActOnBehalfOfOtherIdentity=*))' -Properties msDS-AllowedToDelegateTo, msDS-AllowedToActOnBehalfOfOtherIdentity, sAMAccountName, objectClass |
        Select sAMAccountName, objectClass,
            @{N='AllowedToDelegateTo';E={($_.'msDS-AllowedToDelegateTo' -join ', ')}},
            @{N='RBCD';E={[bool]$_.'msDS-AllowedToActOnBehalfOfOtherIdentity'}}
}

function Get-DargslanDuplicateSpns {
    <#
    .SYNOPSIS
        Find duplicate Service Principal Names across all accounts.
    #>
    [CmdletBinding()]
    param()
    Import-Module ActiveDirectory -ErrorAction Stop
    $all = Get-ADObject -LDAPFilter '(servicePrincipalName=*)' -Properties servicePrincipalName, sAMAccountName |
        ForEach-Object {
            $name = $_.sAMAccountName
            $_.servicePrincipalName | ForEach-Object {
                [pscustomobject]@{ SPN = $_; Account = $name }
            }
        }
    $all | Group-Object SPN | Where-Object Count -gt 1 |
        Select-Object Name, Count, @{N='Accounts';E={($_.Group.Account -join ', ')}}
}

function Get-DargslanAsRepRoastable {
    <#
    .SYNOPSIS
        Find accounts with DONT_REQ_PREAUTH (AS-REP roastable).
    #>
    [CmdletBinding()]
    param()
    Import-Module ActiveDirectory -ErrorAction Stop
    Get-ADUser -LDAPFilter '(userAccountControl:1.2.840.113556.1.4.803:=4194304)' -Properties userAccountControl, PasswordLastSet |
        Select SamAccountName, Enabled, PasswordLastSet
}

function Get-DargslanKerberosAuditReport {
    <#
    .SYNOPSIS
        Combined Kerberos audit with PASS / WARN / FAIL verdict.
    #>
    [CmdletBinding()]
    param()
    $un  = @(Get-DargslanUnconstrainedDelegation)
    $cn  = @(Get-DargslanConstrainedDelegation)
    $dup = @(Get-DargslanDuplicateSpns)
    $asr = @(Get-DargslanAsRepRoastable)
    $score = 0
    if ($un.Count -le 1)   { $score++ }
    if ($dup.Count -eq 0)  { $score++ }
    if ($asr.Count -eq 0)  { $score++ }
    $verdict = if ($score -eq 3) { 'PASS' } elseif ($score -ge 1) { 'WARN' } else { 'FAIL' }
    [pscustomobject]@{
        Unconstrained         = $un
        Constrained           = $cn
        DuplicateSpns         = $dup
        AsRepRoastable        = $asr
        UnconstrainedCount    = $un.Count
        DuplicateSpnCount     = $dup.Count
        AsRepRoastableCount   = $asr.Count
        Score                 = $score
        Verdict               = $verdict
        TimeStamp             = (Get-Date).ToString('s')
    }
}

function Export-DargslanKerberosAuditReport {
    <#
    .SYNOPSIS
        Export the Kerberos audit to HTML and JSON.
    #>
    [CmdletBinding()]
    param([string]$OutDir = (Join-Path $env:TEMP 'DargslanKerberosAudit'))
    if (-not (Test-Path $OutDir)) { New-Item -Type Directory -Path $OutDir | Out-Null }
    $r = Get-DargslanKerberosAuditReport
    $json = Join-Path $OutDir 'kerberos-audit.json'
    $html = Join-Path $OutDir 'kerberos-audit.html'
    $r | ConvertTo-Json -Depth 6 | Set-Content $json -Encoding UTF8
    $body  = '<h1>Kerberos Audit</h1>'
    $body += "<p>Verdict: <b>$($r.Verdict)</b> ($($r.Score)/3)</p>"
    $body += '<h2>Unconstrained delegation</h2>' + ($r.Unconstrained | ConvertTo-Html -Fragment)
    $body += '<h2>Constrained / RBCD</h2>' + ($r.Constrained | ConvertTo-Html -Fragment)
    $body += '<h2>Duplicate SPNs</h2>'  + ($r.DuplicateSpns | ConvertTo-Html -Fragment)
    $body += '<h2>AS-REP roastable</h2>' + ($r.AsRepRoastable | ConvertTo-Html -Fragment)
    ConvertTo-Html -Body $body -Title 'Kerberos Audit' | Set-Content $html -Encoding UTF8
    [pscustomobject]@{ Json = $json; Html = $html; Verdict = $r.Verdict }
}


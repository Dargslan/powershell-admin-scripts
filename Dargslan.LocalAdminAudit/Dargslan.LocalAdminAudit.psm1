<#
.SYNOPSIS
    Audit Windows local users and the Administrators group: members, dormant accounts, Guest state, unknown SIDs.

.DESCRIPTION
    Part of the Dargslan Windows Admin Tools collection.
    Free Cheat Sheet: https://dargslan.com/cheat-sheets/windows-local-admin-audit-2026
    Full Guide:       https://dargslan.com/blog/windows-local-admin-audit-powershell-2026
    More tools:       https://dargslan.com

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

$script:Banner = @"
+----------------------------------------------------------+
|  Dargslan Local Admin + User Audit                      
|  https://dargslan.com - Free cheat sheets & eBooks       |
+----------------------------------------------------------+
"@

function Get-DargslanLocalAdmins {
    <#
    .SYNOPSIS
        Return the members of the local Administrators group with SID and source.
    #>
    [CmdletBinding()]
    param()
    try {
        $members = Get-LocalGroupMember -Group 'Administrators' -ErrorAction Stop
    } catch {
        $members = ([ADSI]'WinNT://./Administrators,group').Invoke('Members') | ForEach-Object {
            [pscustomobject]@{ Name = ([ADSI]$_).Path.Replace('WinNT://',''); ObjectClass = 'Unknown'; PrincipalSource = 'ADSI' }
        }
    }
    $members | ForEach-Object {
        [pscustomobject]@{
            ComputerName    = $env:COMPUTERNAME
            Name            = $_.Name
            ObjectClass     = $_.ObjectClass
            PrincipalSource = $_.PrincipalSource
            SID             = $_.SID
        }
    }
}

function Get-DargslanLocalUsers {
    <#
    .SYNOPSIS
        Enumerate every local user with enabled state and last logon.
    #>
    [CmdletBinding()]
    param()
    Get-LocalUser | Select Name, Enabled, LastLogon, PasswordRequired, PasswordLastSet, PasswordExpires, Description, SID
}

function Get-DargslanInactiveLocalAccounts {
    <#
    .SYNOPSIS
        Find enabled local users with no logon for N days (default 90).
    #>
    [CmdletBinding()]
    param([int]$Days = 90)
    $cut = (Get-Date).AddDays(-$Days)
    Get-LocalUser | Where-Object { $_.Enabled -and $_.LastLogon -and $_.LastLogon -lt $cut } |
        Select Name, LastLogon, Description
}

function Get-DargslanLocalAdminAuditReport {
    <#
    .SYNOPSIS
        Combined report with PASS / WARN / FAIL verdict.
    #>
    [CmdletBinding()]
    param([int]$InactiveDays = 90)
    $adm   = @(Get-DargslanLocalAdmins)
    $users = @(Get-DargslanLocalUsers)
    $inact = @(Get-DargslanInactiveLocalAccounts -Days $InactiveDays)
    $guest = ($users | Where-Object Name -eq 'Guest')
    $unknownSid = ($adm | Where-Object { $_.Name -match '^S-1-5-' }).Count
    $score = 0
    if ($adm.Count -le 5)            { $score++ }
    if ((-not $guest) -or -not $guest.Enabled) { $score++ }
    if ($unknownSid -eq 0)           { $score++ }
    if ($inact.Count -eq 0)          { $score++ }
    $verdict = if ($score -eq 4) { 'PASS' } elseif ($score -ge 2) { 'WARN' } else { 'FAIL' }
    [pscustomobject]@{
        ComputerName  = $env:COMPUTERNAME
        Admins        = $adm
        Users         = $users
        Inactive      = $inact
        AdminCount    = $adm.Count
        InactiveCount = $inact.Count
        UnknownSidAdmins = $unknownSid
        GuestEnabled  = [bool]$guest.Enabled
        Score         = $score
        Verdict       = $verdict
        TimeStamp     = (Get-Date).ToString('s')
    }
}

function Export-DargslanLocalAdminAuditReport {
    <#
    .SYNOPSIS
        Export the report to HTML and JSON.
    #>
    [CmdletBinding()]
    param([int]$InactiveDays = 90, [string]$OutDir = (Join-Path $env:TEMP 'DargslanLocalAdminAudit'))
    if (-not (Test-Path $OutDir)) { New-Item -Type Directory -Path $OutDir | Out-Null }
    $r = Get-DargslanLocalAdminAuditReport -InactiveDays $InactiveDays
    $json = Join-Path $OutDir ('localadmin-' + $env:COMPUTERNAME + '.json')
    $html = Join-Path $OutDir ('localadmin-' + $env:COMPUTERNAME + '.html')
    $r | ConvertTo-Json -Depth 6 | Set-Content $json -Encoding UTF8
    $body  = "<h1>Local Admin Audit - $($r.ComputerName)</h1>"
    $body += "<p>Verdict: <b>$($r.Verdict)</b> ($($r.Score)/4)</p>"
    $body += '<h2>Administrators</h2>' + ($r.Admins | ConvertTo-Html -Fragment)
    $body += '<h2>Local Users</h2>'    + ($r.Users  | ConvertTo-Html -Fragment)
    $body += '<h2>Inactive</h2>'        + ($r.Inactive | ConvertTo-Html -Fragment)
    ConvertTo-Html -Body $body -Title 'Local Admin Audit' | Set-Content $html -Encoding UTF8
    [pscustomobject]@{ Json = $json; Html = $html; Verdict = $r.Verdict }
}


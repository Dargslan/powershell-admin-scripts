<#
.SYNOPSIS
    Audit Windows services for unquoted paths, weak ACLs and risky service accounts. JSON / HTML report.

.DESCRIPTION
    Part of the Dargslan Windows Admin Tools collection.
    Free Cheat Sheet: https://dargslan.com/cheat-sheets/windows-service-security-audit-2026
    Full Guide:       https://dargslan.com/blog/windows-service-security-audit-powershell-2026
    More tools:       https://dargslan.com

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

$script:Banner = @"
+----------------------------------------------------------+
|  Dargslan Windows Service Security Audit                
|  https://dargslan.com - Free cheat sheets & eBooks       |
+----------------------------------------------------------+
"@

function Get-DargslanServiceInventory {
    <#
    .SYNOPSIS
        Return every service with start mode, run-as account and binary path.
    #>
    [CmdletBinding()]
    param()
    Get-CimInstance Win32_Service | Select-Object @{N='Computer';E={$env:COMPUTERNAME}}, Name, DisplayName, State, StartMode, StartName, PathName
}

function Get-DargslanUnquotedServicePaths {
    <#
    .SYNOPSIS
        Detect unquoted service paths that contain spaces (classic priv-esc vector).
    #>
    [CmdletBinding()]
    param()
    Get-CimInstance Win32_Service | Where-Object {
        $_.PathName -and
        $_.PathName -notmatch '^"' -and
        $_.PathName -match ' ' -and
        $_.PathName -notmatch '^[A-Za-z]:\\Windows\\'
    } | Select-Object Name, StartName, StartMode, PathName
}

function Get-DargslanRiskyServiceAccounts {
    <#
    .SYNOPSIS
        Find services running as LocalSystem from a user-writable directory.
    #>
    [CmdletBinding()]
    param()
    $risky = @()
    foreach ($svc in Get-CimInstance Win32_Service) {
        if ($svc.StartName -notin 'LocalSystem','NT AUTHORITY\\LocalService','NT AUTHORITY\\NetworkService') { continue }
        $bin = ($svc.PathName -split '"')[1]
        if (-not $bin) { $bin = ($svc.PathName -split ' ')[0] }
        if (-not (Test-Path $bin)) { continue }
        $dir = Split-Path $bin -Parent
        try {
            $acl = Get-Acl $dir -ErrorAction Stop
            $writable = $acl.Access | Where-Object {
                $_.IdentityReference -match 'Users|Authenticated Users|Everyone|INTERACTIVE' -and
                $_.FileSystemRights -match 'Write|Modify|FullControl' -and
                $_.AccessControlType -eq 'Allow'
            }
            if ($writable) {
                $risky += [pscustomobject]@{
                    Service   = $svc.Name
                    StartName = $svc.StartName
                    Binary    = $bin
                    Folder    = $dir
                    Writable  = ($writable.IdentityReference -join ',')
                }
            }
        } catch {}
    }
    $risky
}

function Get-DargslanServiceAuditReport {
    <#
    .SYNOPSIS
        Combined report with PASS / WARN / FAIL verdict.
    #>
    [CmdletBinding()]
    param()
    $inv     = @(Get-DargslanServiceInventory)
    $unq     = @(Get-DargslanUnquotedServicePaths)
    $risky   = @(Get-DargslanRiskyServiceAccounts)
    $score = 0
    if ($unq.Count -eq 0)   { $score++ }
    if ($risky.Count -eq 0) { $score++ }
    $autoStarts = ($inv | Where-Object StartMode -eq 'Auto').Count
    if ($autoStarts -gt 0)  { $score++ }
    $verdict = if ($score -eq 3) { 'PASS' } elseif ($score -ge 1) { 'WARN' } else { 'FAIL' }
    [pscustomobject]@{
        ComputerName    = $env:COMPUTERNAME
        ServiceCount    = $inv.Count
        UnquotedCount   = $unq.Count
        RiskyAcctCount  = $risky.Count
        Score           = $score
        Verdict         = $verdict
        Unquoted        = $unq
        Risky           = $risky
        TimeStamp       = (Get-Date).ToString('s')
    }
}

function Export-DargslanServiceAuditReport {
    <#
    .SYNOPSIS
        Export the service audit to HTML and JSON.
    #>
    [CmdletBinding()]
    param([string]$OutDir = (Join-Path $env:TEMP 'DargslanServiceAudit'))
    if (-not (Test-Path $OutDir)) { New-Item -Type Directory -Path $OutDir | Out-Null }
    $r = Get-DargslanServiceAuditReport
    $json = Join-Path $OutDir ('services-' + $env:COMPUTERNAME + '.json')
    $html = Join-Path $OutDir ('services-' + $env:COMPUTERNAME + '.html')
    $r | ConvertTo-Json -Depth 6 | Set-Content $json -Encoding UTF8
    $body  = "<h1>Service Audit - $($r.ComputerName)</h1>"
    $body += "<p>Verdict: <b>$($r.Verdict)</b> ($($r.Score)/3)</p>"
    $body += '<h2>Unquoted paths</h2>' + ($r.Unquoted | ConvertTo-Html -Fragment)
    $body += '<h2>Risky service accounts</h2>' + ($r.Risky | ConvertTo-Html -Fragment)
    ConvertTo-Html -Body $body -Title 'Service Audit' | Set-Content $html -Encoding UTF8
    [pscustomobject]@{ Json = $json; Html = $html; Verdict = $r.Verdict }
}


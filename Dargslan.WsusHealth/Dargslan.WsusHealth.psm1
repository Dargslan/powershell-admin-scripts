<#
.SYNOPSIS
    Audit WSUS server health: client compliance, missing critical updates, sync state. JSON / HTML report.

.DESCRIPTION
    Part of the Dargslan Windows Admin Tools collection.
    Free Cheat Sheet: https://dargslan.com/cheat-sheets/wsus-server-health-audit-2026
    Full Guide:       https://dargslan.com/blog/wsus-server-health-audit-powershell-2026
    More tools:       https://dargslan.com

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

$script:Banner = @"
+----------------------------------------------------------+
|  Dargslan WSUS Health Audit                             
|  https://dargslan.com - Free cheat sheets & eBooks       |
+----------------------------------------------------------+
"@

function Get-DargslanWsusServerStatus {
    <#
    .SYNOPSIS
        Connect to WSUS and return basic server status + last sync.
    #>
    [CmdletBinding()]
    param([string]$Server = $env:COMPUTERNAME, [int]$Port = 8530, [bool]$UseSsl = $false)
    [void][reflection.assembly]::LoadWithPartialName('Microsoft.UpdateServices.Administration')
    $wsus = [Microsoft.UpdateServices.Administration.AdminProxy]::GetUpdateServer($Server, $UseSsl, $Port)
    $st   = $wsus.GetStatus()
    $sync = $wsus.GetSubscription()
    [pscustomobject]@{
        Server                  = $Server
        Computers               = $st.ComputerTargetCount
        UpdateCount             = $st.UpdateCount
        DeclinedCount           = $st.DeclinedUpdateCount
        ApprovedCount           = $st.ApprovedUpdateCount
        UpdatesNeedingFiles     = $st.UpdatesWithStaleUpdateApprovalsCount
        LastSync                = $sync.GetLastSynchronizationInfo().StartTime
        LastSyncResult          = $sync.GetLastSynchronizationInfo().Result
    }
}

function Get-DargslanWsusClientCompliance {
    <#
    .SYNOPSIS
        Bucket clients by status (UpToDate, NeedingUpdates, Failed, Unknown).
    #>
    [CmdletBinding()]
    param([string]$Server = $env:COMPUTERNAME, [int]$Port = 8530, [bool]$UseSsl = $false)
    [void][reflection.assembly]::LoadWithPartialName('Microsoft.UpdateServices.Administration')
    $wsus = [Microsoft.UpdateServices.Administration.AdminProxy]::GetUpdateServer($Server, $UseSsl, $Port)
    $summary = $wsus.GetSummariesPerComputerTarget(
        (New-Object Microsoft.UpdateServices.Administration.UpdateScope),
        (New-Object Microsoft.UpdateServices.Administration.ComputerTargetScope))
    $buckets = [pscustomobject]@{
        Server         = $Server
        UpToDate       = ($summary | Where-Object { $_.NotInstalledCount + $_.DownloadedCount + $_.FailedCount -eq 0 }).Count
        NeedingUpdates = ($summary | Where-Object { $_.NotInstalledCount + $_.DownloadedCount -gt 0 -and $_.FailedCount -eq 0 }).Count
        Failed         = ($summary | Where-Object FailedCount -gt 0).Count
        Unknown        = ($summary | Where-Object UnknownCount -gt 0).Count
        Total          = $summary.Count
    }
    $buckets
}

function Get-DargslanWsusMissingCritical {
    <#
    .SYNOPSIS
        Return needed critical / security updates per client.
    #>
    [CmdletBinding()]
    param([string]$Server = $env:COMPUTERNAME, [int]$Port = 8530, [bool]$UseSsl = $false, [int]$Top = 50)
    [void][reflection.assembly]::LoadWithPartialName('Microsoft.UpdateServices.Administration')
    $wsus  = [Microsoft.UpdateServices.Administration.AdminProxy]::GetUpdateServer($Server, $UseSsl, $Port)
    $scope = New-Object Microsoft.UpdateServices.Administration.UpdateScope
    $scope.Classifications.Add(($wsus.GetUpdateClassifications() | Where-Object Title -in 'Critical Updates','Security Updates')) | Out-Null
    $scope.IncludedInstallationStates = 'NotInstalled'
    $wsus.GetSummariesPerComputerTarget($scope, (New-Object Microsoft.UpdateServices.Administration.ComputerTargetScope)) |
        Where-Object NotInstalledCount -gt 0 |
        Sort-Object NotInstalledCount -Descending |
        Select-Object -First $Top -Property @{N='Computer';E={($wsus.GetComputerTarget($_.ComputerTargetId)).FullDomainName}}, NotInstalledCount, DownloadedCount, FailedCount
}

function Get-DargslanWsusHealthReport {
    <#
    .SYNOPSIS
        Combined WSUS health report with PASS / WARN / FAIL verdict.
    #>
    [CmdletBinding()]
    param([string]$Server = $env:COMPUTERNAME, [int]$Port = 8530, [bool]$UseSsl = $false)
    $st  = Get-DargslanWsusServerStatus -Server $Server -Port $Port -UseSsl $UseSsl
    $cli = Get-DargslanWsusClientCompliance -Server $Server -Port $Port -UseSsl $UseSsl
    $pct = if ($cli.Total) { [math]::Round(($cli.UpToDate / $cli.Total) * 100, 1) } else { 0 }
    $score = 0
    if ($st.LastSync -gt (Get-Date).AddDays(-2))     { $score++ }
    if ($st.LastSyncResult -eq 'Succeeded')           { $score++ }
    if ($pct -ge 90)                                  { $score++ }
    if ($cli.Failed -le [math]::Max(1, $cli.Total * 0.05)) { $score++ }
    $verdict = if ($score -ge 4) { 'PASS' } elseif ($score -ge 2) { 'WARN' } else { 'FAIL' }
    [pscustomobject]@{
        Server      = $Server
        Status      = $st
        Compliance  = $cli
        UpToDatePct = $pct
        Score       = $score
        Verdict     = $verdict
        TimeStamp   = (Get-Date).ToString('s')
    }
}

function Export-DargslanWsusHealthReport {
    <#
    .SYNOPSIS
        Export the WSUS audit to HTML and JSON.
    #>
    [CmdletBinding()]
    param([string]$Server = $env:COMPUTERNAME, [int]$Port = 8530, [bool]$UseSsl = $false, [string]$OutDir = (Join-Path $env:TEMP 'DargslanWsusAudit'))
    if (-not (Test-Path $OutDir)) { New-Item -Type Directory -Path $OutDir | Out-Null }
    $r = Get-DargslanWsusHealthReport -Server $Server -Port $Port -UseSsl $UseSsl
    $json = Join-Path $OutDir ('wsus-' + $Server + '.json')
    $html = Join-Path $OutDir ('wsus-' + $Server + '.html')
    $r | ConvertTo-Json -Depth 6 | Set-Content $json -Encoding UTF8
    $body  = "<h1>WSUS Health - $($r.Server)</h1>"
    $body += "<p>Verdict: <b>$($r.Verdict)</b> ($($r.Score)/4) - $($r.UpToDatePct)% up to date</p>"
    $body += '<h2>Status</h2>'     + ($r.Status     | ConvertTo-Html -Fragment)
    $body += '<h2>Compliance</h2>' + ($r.Compliance | ConvertTo-Html -Fragment)
    ConvertTo-Html -Body $body -Title 'WSUS Health' | Set-Content $html -Encoding UTF8
    [pscustomobject]@{ Json = $json; Html = $html; Verdict = $r.Verdict }
}


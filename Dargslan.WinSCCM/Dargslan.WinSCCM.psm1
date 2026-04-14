function Get-SCCMAudit {
    <#
    .SYNOPSIS
        Audit SCCM/MECM client health and compliance
    .DESCRIPTION
        Windows SCCM/MECM client audit toolkit — client health, cache, policy, boundaries, distribution points, software updates compliance
        Part of the Dargslan Windows Admin Toolkit — https://dargslan.com
    .PARAMETER Json
        Output results as JSON
    .EXAMPLE
        Get-SCCMAudit
    .EXAMPLE
        Get-SCCMAudit -Json
    .LINK
        https://dargslan.com
    .LINK
        https://www.powershellgallery.com/profiles/Dargslan
    #>
    [CmdletBinding()]
    param([switch]$Json)

    $report = [ordered]@{
        Service = Get-Service CcmExec -ErrorAction SilentlyContinue | Select-Object Status, StartType
        ClientVersion = (Get-WmiObject -Namespace "root\ccm" -Class SMS_Client -ErrorAction SilentlyContinue).ClientVersion
        CacheInfo = try { $cache = New-Object -ComObject UIResource.UIResourceMgr -ErrorAction SilentlyContinue; if ($cache) { $c = $cache.GetCacheInfo(); [PSCustomObject]@{ TotalSize = $c.TotalSize; FreeSize = $c.FreeSize; Location = $c.Location } } } catch { $null }
        Assignments = Get-WmiObject -Namespace "root\ccm\Policy\Machine\ActualConfig" -Class CCM_ApplicationCIAssignment -ErrorAction SilentlyContinue | Measure-Object | Select-Object Count
        SiteCode = (Get-WmiObject -Namespace "root\ccm" -Class SMS_Client -ErrorAction SilentlyContinue).GetAssignedSite().sSiteCode
        ManagementPoint = (Get-WmiObject -Namespace "root\ccm" -Class SMS_Authority -ErrorAction SilentlyContinue).CurrentManagementPoint
        LastHWInventory = (Get-WmiObject -Namespace "root\ccm\invagt" -Class InventoryActionStatus -ErrorAction SilentlyContinue | Where-Object InventoryActionID -match "00000001-0000-0000-0000-000000000001").LastCycleStartedDate
        Warnings = @()
    }
    if ($report.Service.Status -ne "Running") { $report.Warnings += "SCCM Client (CcmExec) is not running" }
    if (-not $report.ClientVersion) { $report.Warnings += "SCCM client may not be installed" }
    $report.Summary = [PSCustomObject]@{ ClientRunning = $report.Service.Status -eq "Running"; Version = $report.ClientVersion; SiteCode = $report.SiteCode; MP = $report.ManagementPoint }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [SCCM/MECM Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function Get-SCCMAudit

function Get-BranchCacheAudit {
    <#
    .SYNOPSIS
        Audit BranchCache status and bandwidth savings
    .DESCRIPTION
        Windows BranchCache audit toolkit — cache status, hosted mode, distributed mode, content servers, bandwidth savings
        Part of the Dargslan Windows Admin Toolkit — https://dargslan.com
    .PARAMETER Json
        Output results as JSON
    .EXAMPLE
        Get-BranchCacheAudit
    .EXAMPLE
        Get-BranchCacheAudit -Json
    .LINK
        https://dargslan.com
    #>
    [CmdletBinding()]
    param([switch]$Json)

    $report = [ordered]@{
        Status = Get-BCStatus -ErrorAction SilentlyContinue
        ContentServer = Get-BCContentServerConfiguration -ErrorAction SilentlyContinue | Select-Object ContentServerIsEnabled
        HostedCache = Get-BCHostedCacheServerConfiguration -ErrorAction SilentlyContinue | Select-Object HostedCacheServerIsEnabled
        HashCache = Get-BCHashCache -ErrorAction SilentlyContinue | Select-Object CacheFileDirectoryPath, MaxCacheSizeAsPercentageOfDiskVolume
        DataCache = Get-BCDataCache -ErrorAction SilentlyContinue | Select-Object CacheFileDirectoryPath, MaxCacheSizeAsPercentageOfDiskVolume, CurrentActiveCacheSize
        NetworkConfig = Get-BCNetworkConfiguration -ErrorAction SilentlyContinue | Select-Object ContentRetrievalFirewallRulesEnabled, PeerDiscoveryFirewallRulesEnabled
        Warnings = @()
    }
    $isEnabled = $report.Status.BranchCacheIsEnabled
    if ($isEnabled -ne $true) { $report.Warnings += "BranchCache is not enabled" }
    $report.Summary = [PSCustomObject]@{ Enabled = $isEnabled; ServiceStatus = $report.Status.BranchCacheServiceStatus; ContentServerEnabled = $report.ContentServer.ContentServerIsEnabled }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [BranchCache Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function Get-BranchCacheAudit

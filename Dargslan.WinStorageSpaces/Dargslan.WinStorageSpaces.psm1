function Get-StorageSpacesAudit {
    <#
    .SYNOPSIS
        Audit Storage Spaces pools and disk health
    .DESCRIPTION
        Windows Storage Spaces audit toolkit — pools, virtual disks, physical disks, tiers, resiliency, and health monitoring
        Part of the Dargslan Windows Admin Toolkit — https://dargslan.com
    .PARAMETER Json
        Output results as JSON
    .EXAMPLE
        Get-StorageSpacesAudit
    .EXAMPLE
        Get-StorageSpacesAudit -Json
    .LINK
        https://dargslan.com
    .LINK
        https://www.powershellgallery.com/profiles/Dargslan
    #>
    [CmdletBinding()]
    param([switch]$Json)

    $report = [ordered]@{
        Pools = Get-StoragePool -ErrorAction SilentlyContinue | Where-Object IsPrimordial -eq $false | Select-Object FriendlyName, OperationalStatus, HealthStatus, Size, AllocatedSize
        VirtualDisks = Get-VirtualDisk -ErrorAction SilentlyContinue | Select-Object FriendlyName, OperationalStatus, HealthStatus, ResiliencySettingName, Size, FootprintOnPool
        PhysicalDisks = Get-PhysicalDisk -ErrorAction SilentlyContinue | Select-Object FriendlyName, MediaType, OperationalStatus, HealthStatus, Size, Usage
        Tiers = Get-StorageTier -ErrorAction SilentlyContinue | Select-Object FriendlyName, MediaType, Size, ResiliencySettingName
        Warnings = @()
    }
    $report.PhysicalDisks | Where-Object { $_.HealthStatus -ne "Healthy" } | ForEach-Object { $report.Warnings += "Disk $($_.FriendlyName) health: $($_.HealthStatus)" }
    $report.Summary = [PSCustomObject]@{ PoolCount = ($report.Pools | Measure-Object).Count; VirtualDiskCount = ($report.VirtualDisks | Measure-Object).Count; PhysicalDiskCount = ($report.PhysicalDisks | Measure-Object).Count }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Storage Spaces Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.PhysicalDisks) { $report.PhysicalDisks | Format-Table -AutoSize }
    if ($report.VirtualDisks) { $report.VirtualDisks | Format-Table FriendlyName, HealthStatus, ResiliencySettingName, Size -AutoSize }
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function Get-StorageSpacesAudit

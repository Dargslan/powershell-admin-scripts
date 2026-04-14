<#
.SYNOPSIS
    Windows Storage Spaces and pool management toolkit — storage pool monitoring, virtual disk health, tiering status, and capacity planning

.DESCRIPTION
    Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-StorageReport {
    <#
    .SYNOPSIS
        Analyze Windows Storage Spaces and pools
    .DESCRIPTION
        Reports storage pool health, virtual disk status, physical disk allocation, and capacity utilization.
        Part of Dargslan.WinStorageMgr — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $report = [ordered]@{
        StoragePools = Get-StoragePool -ErrorAction SilentlyContinue | Where-Object IsPrimordial -eq $false | Select-Object FriendlyName, HealthStatus, OperationalStatus, @{N="SizeGB";E={[math]::Round($_.Size/1GB,1)}}, @{N="AllocatedGB";E={[math]::Round($_.AllocatedSize/1GB,1)}}, IsReadOnly
        VirtualDisks = Get-VirtualDisk -ErrorAction SilentlyContinue | Select-Object FriendlyName, HealthStatus, OperationalStatus, ResiliencySettingName, @{N="SizeGB";E={[math]::Round($_.Size/1GB,1)}}, @{N="FootprintGB";E={[math]::Round($_.FootprintOnPool/1GB,1)}}
        PhysicalDisks = Get-PhysicalDisk -ErrorAction SilentlyContinue | Select-Object FriendlyName, MediaType, @{N="SizeGB";E={[math]::Round($_.Size/1GB,1)}}, HealthStatus, OperationalStatus, Usage, BusType
        Volumes = Get-Volume | Where-Object { $_.DriveLetter -and $_.DriveType -eq "Fixed" } | Select-Object @{N="Drive";E={"$($_.DriveLetter):"}}, FileSystemLabel, FileSystem, @{N="SizeGB";E={[math]::Round($_.Size/1GB,1)}}, @{N="FreeGB";E={[math]::Round($_.SizeRemaining/1GB,1)}}, @{N="UsedPct";E={[math]::Round(($_.Size-$_.SizeRemaining)/$_.Size*100,1)}}, HealthStatus
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Storage Report]" -ForegroundColor Cyan
    if ($report.StoragePools) { Write-Host "  Storage Pools:" -ForegroundColor Yellow; $report.StoragePools | Format-Table -AutoSize }
    $report.PhysicalDisks | Format-Table -AutoSize
    $report.Volumes | Format-Table -AutoSize
    return $report
}

Export-ModuleMember -Function *

<#
.SYNOPSIS
    Monitor Storage Spaces and RAID array health

.DESCRIPTION
    Part of the Dargslan Windows Admin Tools collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
    Linux & DevOps Books: https://dargslan.com/books

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-RaidStatus {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Raid Monitor
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $pools = Get-StoragePool -ErrorAction SilentlyContinue | Where-Object IsPrimordial -eq $false; if ($pools) { foreach ($p in $pools) { $disks = $p | Get-PhysicalDisk; Write-Host "`n[Pool: $($p.FriendlyName)] Health: $($p.HealthStatus)" -ForegroundColor $(if($p.HealthStatus-eq"Healthy"){"Green"}else{"Red"}); $disks | Select-Object FriendlyName, MediaType, HealthStatus, OperationalStatus, @{N="SizeGB";E={[math]::Round($_.Size/1GB,1)}} | Format-Table -AutoSize } } else { Write-Host "No storage pools/RAID configured" -ForegroundColor Yellow }
}


Export-ModuleMember -Function *

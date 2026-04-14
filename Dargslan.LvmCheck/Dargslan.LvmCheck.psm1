<#
.SYNOPSIS
    Check Windows Storage Spaces and dynamic disk configuration

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

function Get-StorageReport {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Lvm Check
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $pools = Get-StoragePool -ErrorAction SilentlyContinue | Where-Object IsPrimordial -eq $false; if ($pools) { $pools | Select-Object FriendlyName, OperationalStatus, HealthStatus, @{N="SizeGB";E={[math]::Round($_.Size/1GB,1)}} | Format-Table -AutoSize } else { Write-Host "No storage pools" -ForegroundColor Yellow }; $vdisks = Get-VirtualDisk -ErrorAction SilentlyContinue; if ($vdisks) { Write-Host "`n[Virtual Disks]" -ForegroundColor Yellow; $vdisks | Select-Object FriendlyName, OperationalStatus, HealthStatus, ResiliencySettingName, @{N="SizeGB";E={[math]::Round($_.Size/1GB,1)}} | Format-Table -AutoSize }
}


Export-ModuleMember -Function *

<#
.SYNOPSIS
    Check ReFS and storage pool health on Windows

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

function Get-StoragePoolHealth {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Btrfs Check
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $pools = Get-StoragePool -ErrorAction SilentlyContinue | Where-Object IsPrimordial -eq $false; if ($pools) { $pools | Select-Object FriendlyName, OperationalStatus, HealthStatus, @{N="SizeGB";E={[math]::Round($_.Size/1GB,1)}}, @{N="AllocatedGB";E={[math]::Round($_.AllocatedSize/1GB,1)}} | Format-Table -AutoSize } else { Write-Host "No storage pools configured" -ForegroundColor Yellow }
}


Export-ModuleMember -Function *

<#
.SYNOPSIS
    Monitor volume mount points and drive mappings

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

function Get-MountPoints {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Mount Monitor
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $mounts = Get-Volume | Select-Object DriveLetter, FileSystemLabel, FileSystem, DriveType, HealthStatus, @{N="SizeGB";E={[math]::Round($_.Size/1GB,1)}}, @{N="FreeGB";E={[math]::Round($_.SizeRemaining/1GB,1)}}; $mapped = Get-PSDrive -PSProvider FileSystem | Where-Object { $_.Root -match "\\" } | Select-Object Name, Root, @{N="UsedGB";E={[math]::Round($_.Used/1GB,1)}}, @{N="FreeGB";E={[math]::Round($_.Free/1GB,1)}}; Write-Host "`n[Local Volumes]" -ForegroundColor Yellow; $mounts | Format-Table -AutoSize; if ($mapped) { Write-Host "[Network Drives]" -ForegroundColor Yellow; $mapped | Format-Table -AutoSize }
}


Export-ModuleMember -Function *

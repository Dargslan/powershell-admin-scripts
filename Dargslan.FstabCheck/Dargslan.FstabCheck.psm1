<#
.SYNOPSIS
    Check mounted volumes and drive mount configuration

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

function Get-MountReport {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Fstab Check
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $mounts = Get-Volume | Where-Object { $_.DriveLetter -or $_.Path } | Select-Object @{N="Mount";E={if($_.DriveLetter){"$($_.DriveLetter):"}else{$_.Path}}}, FileSystem, @{N="SizeGB";E={[math]::Round($_.Size/1GB,1)}}, HealthStatus, DriveType, FileSystemLabel; Write-Host "`n[Volumes & Mounts]" -ForegroundColor Yellow; if ($Json) { $mounts | ConvertTo-Json } else { $mounts | Format-Table -AutoSize }
}


Export-ModuleMember -Function *

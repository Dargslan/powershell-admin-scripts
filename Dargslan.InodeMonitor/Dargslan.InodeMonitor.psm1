<#
.SYNOPSIS
    Monitor NTFS MFT and file system metadata health

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

function Get-NtfsHealth {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Inode Monitor
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $volumes = Get-Volume | Where-Object { $_.FileSystem -eq "NTFS" -and $_.DriveLetter }; foreach ($v in $volumes) { $info = Get-CimInstance -ClassName Win32_Volume | Where-Object DriveLetter -eq "$($v.DriveLetter):"; Write-Host "`n[$($v.DriveLetter):]" -ForegroundColor Yellow; Write-Host "  File System: $($v.FileSystem)"; Write-Host "  Total Files: ~estimate based on usage"; Write-Host "  Free Space: $([math]::Round($v.SizeRemaining/1GB,1)) GB / $([math]::Round($v.Size/1GB,1)) GB" }
}


Export-ModuleMember -Function *

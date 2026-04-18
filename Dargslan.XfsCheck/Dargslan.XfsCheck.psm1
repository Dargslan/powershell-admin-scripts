<#
.SYNOPSIS
    Check ReFS file system health and configuration

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

function Get-FileSystemHealth {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Xfs Check
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $volumes = Get-Volume | Where-Object { $_.DriveLetter -and $_.DriveType -eq "Fixed" }; foreach ($v in $volumes) { $health = if ($v.HealthStatus -eq "Healthy") { "Green" } else { "Red" }; Write-Host "`n[$($v.DriveLetter):] $($v.FileSystem) - $($v.HealthStatus)" -ForegroundColor $health; Write-Host "  Size: $([math]::Round($v.Size/1GB,1)) GB | Free: $([math]::Round($v.SizeRemaining/1GB,1)) GB | Label: $($v.FileSystemLabel)" }
}


Export-ModuleMember -Function *

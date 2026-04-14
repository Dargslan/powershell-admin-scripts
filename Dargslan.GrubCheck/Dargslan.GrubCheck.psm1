<#
.SYNOPSIS
    Check Windows boot configuration and BCD settings

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

function Get-BootConfig {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Grub Check
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $bcd = bcdedit /enum 2>$null; Write-Host "`n[Boot Configuration]" -ForegroundColor Yellow; if ($bcd) { $bcd | ForEach-Object { Write-Host $_ } } else { Write-Host "Cannot read BCD (run as Administrator)" -ForegroundColor Red }
}


Export-ModuleMember -Function *

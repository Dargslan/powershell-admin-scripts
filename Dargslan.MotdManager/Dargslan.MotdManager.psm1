<#
.SYNOPSIS
    Manage Windows login banner and legal notice messages

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

function Get-LoginBanner {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Motd Manager
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"; $caption = (Get-ItemProperty $regPath -ErrorAction SilentlyContinue).legalnoticecaption; $text = (Get-ItemProperty $regPath -ErrorAction SilentlyContinue).legalnoticetext; Write-Host "`n[Login Banner]" -ForegroundColor Yellow; if ($caption -or $text) { Write-Host "  Caption: $caption"; Write-Host "  Text: $text" } else { Write-Host "  No login banner configured" -ForegroundColor Yellow }
}


Export-ModuleMember -Function *

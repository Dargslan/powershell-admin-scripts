<#
.SYNOPSIS
    Check time synchronization and NTP configuration

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

function Get-TimeSync {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Ntp Check
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $w32tm = w32tm /query /status 2>$null; Write-Host "`n[Time Sync Status]" -ForegroundColor Yellow; if ($w32tm) { $w32tm | ForEach-Object { Write-Host "  $_" } } else { Write-Host "  W32Time service not running" -ForegroundColor Red }; $tz = Get-TimeZone; Write-Host "`n[Timezone] $($tz.Id) (UTC$($tz.BaseUtcOffset))" -ForegroundColor Cyan
}


Export-ModuleMember -Function *

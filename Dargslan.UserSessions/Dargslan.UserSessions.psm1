<#
.SYNOPSIS
    Monitor active user sessions and remote connections

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

function Get-UserSessions {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan User Sessions
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $sessions = query user 2>$null; Write-Host "`n[User Sessions]" -ForegroundColor Yellow; if ($sessions) { $sessions | ForEach-Object { Write-Host "  $_" } } else { Write-Host "  No interactive sessions or query command unavailable" }; $rdp = Get-NetTCPConnection -LocalPort 3389 -State Established -ErrorAction SilentlyContinue; if ($rdp) { Write-Host "`n[RDP Connections] $($rdp.Count) active" -ForegroundColor Cyan }
}


Export-ModuleMember -Function *

<#
.SYNOPSIS
    Check Redis server health and performance metrics

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

function Test-RedisHealth {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Redis Health
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $redis = Get-Command redis-cli -ErrorAction SilentlyContinue; if (-not $redis) { Write-Host "Redis CLI not found" -ForegroundColor Red; return }; $ping = redis-cli ping 2>$null; Write-Host "`n[Redis] Ping: $ping" -ForegroundColor $(if($ping-eq"PONG"){"Green"}else{"Red"}); if ($ping -eq "PONG") { $info = redis-cli info server 2>$null; $info | Select-String "redis_version|uptime|connected" | ForEach-Object { Write-Host "  $_" } }
}


Export-ModuleMember -Function *

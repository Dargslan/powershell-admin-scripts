<#
.SYNOPSIS
    Check Windows process resource limits and quotas

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

function Get-ResourceLimits {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Ulimit Check
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $proc = Get-Process -Id $PID; Write-Host "`n[Process Limits]" -ForegroundColor Yellow; Write-Host "  Max Working Set: $([math]::Round($proc.MaxWorkingSet64/1MB,1)) MB" -ErrorAction SilentlyContinue; Write-Host "  Handle Count: $($proc.HandleCount)"; Write-Host "  Thread Count: $($proc.Threads.Count)"; $handles = Get-Process | Measure-Object HandleCount -Sum -Maximum; Write-Host "`n[System Handle Usage]" -ForegroundColor Yellow; Write-Host "  Total Handles: $($handles.Sum)"; Write-Host "  Max per Process: $($handles.Maximum)"
}


Export-ModuleMember -Function *

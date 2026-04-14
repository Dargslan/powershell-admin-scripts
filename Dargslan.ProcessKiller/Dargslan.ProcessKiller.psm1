<#
.SYNOPSIS
    Find and terminate processes by name, PID, or resource usage

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

function Stop-HighResourceProcess {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Process Killer
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    param([int]$MemoryThresholdMB = 1000) ; $procs = Get-Process | Where-Object { $_.WorkingSet64 -gt ($MemoryThresholdMB * 1MB) -and $_.ProcessName -notmatch "svchost|System|csrss|lsass" } | Select-Object ProcessName, Id, @{N="MemMB";E={[math]::Round($_.WorkingSet64/1MB,1)}}; Write-Host "`n[High Memory Processes] Over ${MemoryThresholdMB}MB:" -ForegroundColor Yellow; if ($procs) { $procs | Format-Table -AutoSize } else { Write-Host "No processes exceeding threshold" -ForegroundColor Green }
}


Export-ModuleMember -Function *

<#
.SYNOPSIS
    Find and terminate zombie, hung, and unresponsive processes

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

function Find-ZombieProcesses {
    [CmdletBinding()]
    param([switch]$Kill, [switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Zombie Process Finder                         ║
║  More tools: https://dargslan.com                       ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $procs = Get-Process | Where-Object { $_.Responding -eq $false -and $_.ProcessName -ne "Idle" }
    if ($procs.Count -eq 0) { Write-Host "`nNo unresponsive processes found." -ForegroundColor Green; return }
    $results = $procs | ForEach-Object { [PSCustomObject]@{ Name = $_.ProcessName; PID = $_.Id; "MemMB" = [math]::Round($_.WorkingSet64 / 1MB, 1); "CPU(s)" = [math]::Round($_.CPU, 1); StartTime = $(if ($_.StartTime) { $_.StartTime.ToString("yyyy-MM-dd HH:mm") } else { "N/A" }) } }
    Write-Host "`n[Zombie] Found $($procs.Count) unresponsive process(es):" -ForegroundColor Red
    $results | Format-Table -AutoSize
    if ($Kill) { $procs | ForEach-Object { Write-Host "Killing $($_.ProcessName) (PID: $($_.Id))..." -ForegroundColor Yellow; Stop-Process -Id $_.Id -Force -ErrorAction SilentlyContinue }; Write-Host "Done." -ForegroundColor Green }
}

Export-ModuleMember -Function *

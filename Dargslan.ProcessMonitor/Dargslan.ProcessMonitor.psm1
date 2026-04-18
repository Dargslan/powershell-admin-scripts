<#
.SYNOPSIS
    Monitor system processes, CPU and memory usage

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

function Get-ProcessReport {
    [CmdletBinding()]
    param([int]$Top = 20, [string]$SortBy = "CPU", [switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Process Monitor                               ║
║  More tools: https://dargslan.com                       ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $procs = Get-Process | Where-Object { $_.ProcessName -ne "Idle" } | ForEach-Object {
        [PSCustomObject]@{ Name = $_.ProcessName; PID = $_.Id; "CPU(s)" = [math]::Round($_.CPU, 1); "MemMB" = [math]::Round($_.WorkingSet64 / 1MB, 1); Handles = $_.HandleCount; Threads = $_.Threads.Count }
    }
    $sorted = if ($SortBy -eq "Memory") { $procs | Sort-Object MemMB -Descending } else { $procs | Sort-Object "CPU(s)" -Descending }
    Write-Host "`n[Processes] Total: $($procs.Count) | Top $Top by $SortBy" -ForegroundColor Yellow
    if ($Json) { $sorted | Select-Object -First $Top | ConvertTo-Json } else { $sorted | Select-Object -First $Top | Format-Table -AutoSize }
}

Export-ModuleMember -Function *

<#
.SYNOPSIS
    Monitor Windows services status and dependencies

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

function Get-ServiceReport {
    [CmdletBinding()]
    param([switch]$StoppedOnly, [switch]$AutoStartOnly, [switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Service Monitor                               ║
║  More tools: https://dargslan.com                       ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $services = Get-Service
    if ($StoppedOnly) { $services = $services | Where-Object Status -eq 'Stopped' }
    if ($AutoStartOnly) { $services = $services | Where-Object StartType -eq 'Automatic' }
    $results = $services | Select-Object Name, DisplayName, Status, StartType | Sort-Object Status, Name
    $running = ($services | Where-Object Status -eq 'Running').Count
    $stopped = ($services | Where-Object Status -eq 'Stopped').Count
    Write-Host "`n[Services] Running: $running | Stopped: $stopped | Total: $($services.Count)" -ForegroundColor Yellow
    $autoStopped = $services | Where-Object { $_.StartType -eq 'Automatic' -and $_.Status -ne 'Running' }
    if ($autoStopped.Count -gt 0) { Write-Host "[Warning] $($autoStopped.Count) auto-start service(s) not running:" -ForegroundColor Red; $autoStopped | Select-Object Name, DisplayName, Status | Format-Table -AutoSize }
    if ($Json) { $results | ConvertTo-Json } else { $results | Format-Table -AutoSize }
}

Export-ModuleMember -Function *

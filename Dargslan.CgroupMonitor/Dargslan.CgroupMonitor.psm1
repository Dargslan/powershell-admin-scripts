<#
.SYNOPSIS
    Monitor process resource usage and limits

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

function Get-ResourceMonitor {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Cgroup Monitor
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $top = Get-Process | Sort-Object WorkingSet64 -Descending | Select-Object -First 15 ProcessName, Id, @{N="MemMB";E={[math]::Round($_.WorkingSet64/1MB,1)}}, @{N="CPU(s)";E={[math]::Round($_.CPU,1)}}, HandleCount, @{N="Threads";E={$_.Threads.Count}}; Write-Host "`n[Resource Monitor] Top 15 processes by memory" -ForegroundColor Yellow; if ($Json) { $top | ConvertTo-Json } else { $top | Format-Table -AutoSize }
}


Export-ModuleMember -Function *

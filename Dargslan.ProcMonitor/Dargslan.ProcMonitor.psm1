<#
.SYNOPSIS
    Real-time process monitoring and resource tracking

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

function Watch-Processes {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Proc Monitor
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $procs = Get-Process | Where-Object { $_.CPU -gt 0 } | Sort-Object CPU -Descending | Select-Object -First 25 ProcessName, Id, @{N="CPU(s)";E={[math]::Round($_.CPU,1)}}, @{N="MemMB";E={[math]::Round($_.WorkingSet64/1MB,1)}}, HandleCount, @{N="Threads";E={$_.Threads.Count}}, @{N="Start";E={if($_.StartTime){$_.StartTime.ToString("HH:mm")}else{"N/A"}}}; Write-Host "`n[Process Monitor] Top 25 by CPU" -ForegroundColor Yellow; if ($Json) { $procs | ConvertTo-Json } else { $procs | Format-Table -AutoSize }
}


Export-ModuleMember -Function *

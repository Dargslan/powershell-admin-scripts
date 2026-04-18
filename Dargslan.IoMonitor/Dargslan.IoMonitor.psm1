<#
.SYNOPSIS
    Monitor disk I/O operations and throughput per process

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

function Get-IoReport {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Io Monitor
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $procs = Get-Process | Where-Object { $_.Id -ne 0 } | Sort-Object @{E={$_.IO.ReadBytes + $_.IO.WriteBytes}} -Descending -ErrorAction SilentlyContinue | Select-Object -First 20 ProcessName, Id, @{N="ReadMB";E={[math]::Round($_.IO.ReadBytes/1MB,1)}}, @{N="WriteMB";E={[math]::Round($_.IO.WriteBytes/1MB,1)}}, @{N="OtherMB";E={[math]::Round($_.IO.OtherBytes/1MB,1)}}; Write-Host "`n[I/O Monitor] Top 20 processes by I/O" -ForegroundColor Yellow; if ($Json) { $procs | ConvertTo-Json } else { $procs | Format-Table -AutoSize }
}


Export-ModuleMember -Function *

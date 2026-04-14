<#
.SYNOPSIS
    Audit open files, handles, and network connections per process

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

function Get-OpenHandles {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Lsof Audit
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $procs = Get-Process | Sort-Object HandleCount -Descending | Select-Object -First 20 ProcessName, Id, HandleCount, @{N="MemMB";E={[math]::Round($_.WorkingSet64/1MB,1)}}, @{N="Modules";E={$_.Modules.Count}}; Write-Host "`n[Open Handles] Top 20 processes:" -ForegroundColor Yellow; if ($Json) { $procs | ConvertTo-Json } else { $procs | Format-Table -AutoSize }
}


Export-ModuleMember -Function *

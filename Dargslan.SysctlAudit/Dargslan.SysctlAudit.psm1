<#
.SYNOPSIS
    Audit Windows registry-based system tuning parameters

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

function Get-SystemTuning {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Sysctl Audit
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $tcpParams = Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -ErrorAction SilentlyContinue; Write-Host "`n[TCP/IP Parameters]" -ForegroundColor Yellow; if ($tcpParams) { $tcpParams | Select-Object @{N="KeepAliveTime";E={$_.KeepAliveTime}}, @{N="TcpMaxDataRetransmissions";E={$_.TcpMaxDataRetransmissions}} | Format-List }; $memMgmt = Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -ErrorAction SilentlyContinue; if ($memMgmt) { Write-Host "[Memory Management]" -ForegroundColor Yellow; Write-Host "  LargeSystemCache: $($memMgmt.LargeSystemCache)"; Write-Host "  PagingFiles: $($memMgmt.PagingFiles -join ", ")" }
}


Export-ModuleMember -Function *

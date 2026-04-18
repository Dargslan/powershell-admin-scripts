<#
.SYNOPSIS
    Monitor TCP connections, states, and performance

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

function Get-TcpReport {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Tcp Monitor
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $connections = Get-NetTCPConnection; $states = $connections | Group-Object State | Select-Object @{N="State";E={$_.Name}}, Count | Sort-Object Count -Descending; Write-Host "`n[TCP Connections] Total: $($connections.Count)" -ForegroundColor Yellow; $states | Format-Table -AutoSize; $established = $connections | Where-Object State -eq "Established" | ForEach-Object { $proc = Get-Process -Id $_.OwningProcess -ErrorAction SilentlyContinue; [PSCustomObject]@{LocalPort=$_.LocalPort; RemoteAddr=$_.RemoteAddress; RemotePort=$_.RemotePort; Process=$(if($proc){$proc.ProcessName}else{"N/A"})} }; Write-Host "[Established] $($established.Count):" -ForegroundColor Cyan; $established | Select-Object -First 20 | Format-Table -AutoSize
}


Export-ModuleMember -Function *

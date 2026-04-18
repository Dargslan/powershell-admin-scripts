<#
.SYNOPSIS
    Display TCP/UDP socket statistics and connection states

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

function Get-SocketStats {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Socket Stats
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $tcp = Get-NetTCPConnection | Group-Object State | Select-Object @{N="State";E={$_.Name}}, Count | Sort-Object Count -Descending; $udp = Get-NetUDPEndpoint -ErrorAction SilentlyContinue; Write-Host "`n[TCP Socket States]" -ForegroundColor Yellow; $tcp | Format-Table -AutoSize; Write-Host "[UDP Endpoints] $($udp.Count)" -ForegroundColor Yellow
}


Export-ModuleMember -Function *

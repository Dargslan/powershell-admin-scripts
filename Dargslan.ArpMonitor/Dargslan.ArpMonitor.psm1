<#
.SYNOPSIS
    Monitor ARP table and detect suspicious network entries

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

function Get-ArpReport {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Arp Monitor
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $arp = Get-NetNeighbor -ErrorAction SilentlyContinue | Where-Object { $_.State -ne "Unreachable" } | Select-Object IPAddress, LinkLayerAddress, State, InterfaceAlias; Write-Host "`n[ARP Table] $($arp.Count) entries" -ForegroundColor Yellow; if ($Json) { $arp | ConvertTo-Json } else { $arp | Format-Table -AutoSize }
}


Export-ModuleMember -Function *

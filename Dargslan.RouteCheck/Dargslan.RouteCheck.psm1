<#
.SYNOPSIS
    Check routing table and network route configuration

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

function Get-RouteReport {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Route Check
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $routes = Get-NetRoute | Where-Object { $_.AddressFamily -eq "IPv4" } | Select-Object DestinationPrefix, NextHop, RouteMetric, InterfaceAlias | Sort-Object RouteMetric; Write-Host "`n[Routing Table] $($routes.Count) IPv4 routes" -ForegroundColor Yellow; if ($Json) { $routes | ConvertTo-Json } else { $routes | Format-Table -AutoSize }
}


Export-ModuleMember -Function *

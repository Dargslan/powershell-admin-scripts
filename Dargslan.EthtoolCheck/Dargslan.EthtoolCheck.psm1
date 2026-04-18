<#
.SYNOPSIS
    Check network adapter hardware properties and driver info

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

function Get-AdapterDetails {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Ethtool Check
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $adapters = Get-NetAdapter | Select-Object Name, InterfaceDescription, Status, LinkSpeed, MediaType, DriverVersion, DriverDate, MacAddress; Write-Host "`n[Network Adapters]" -ForegroundColor Yellow; if ($Json) { $adapters | ConvertTo-Json } else { $adapters | Format-Table -AutoSize }
}


Export-ModuleMember -Function *

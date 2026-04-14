<#
.SYNOPSIS
    Audit IPv6 configuration and transition mechanisms

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

function Get-IPv6Audit {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Ipv6 Audit
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $ipv6 = Get-NetIPAddress -AddressFamily IPv6 -ErrorAction SilentlyContinue | Select-Object InterfaceAlias, IPAddress, PrefixLength, AddressState, ValidLifetime; Write-Host "`n[IPv6 Configuration] $($ipv6.Count) address(es)" -ForegroundColor Yellow; if ($Json) { $ipv6 | ConvertTo-Json } else { $ipv6 | Format-Table -AutoSize }
}


Export-ModuleMember -Function *

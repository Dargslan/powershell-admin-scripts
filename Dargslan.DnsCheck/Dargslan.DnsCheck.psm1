<#
.SYNOPSIS
    Check DNS client configuration and resolver health

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

function Get-DnsConfigReport {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Dns Check
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $adapters = Get-DnsClientServerAddress -AddressFamily IPv4 -ErrorAction SilentlyContinue | Where-Object { $_.ServerAddresses.Count -gt 0 }; Write-Host "`n[DNS Configuration]" -ForegroundColor Yellow; $adapters | Select-Object InterfaceAlias, @{N="DNSServers";E={$_.ServerAddresses -join ", "}} | Format-Table -AutoSize; $cache = Get-DnsClientCache -ErrorAction SilentlyContinue | Select-Object -First 20 Entry, RecordName, Data, TimeToLive; Write-Host "`n[DNS Cache] Top 20 entries:" -ForegroundColor Yellow; $cache | Format-Table -AutoSize
}


Export-ModuleMember -Function *

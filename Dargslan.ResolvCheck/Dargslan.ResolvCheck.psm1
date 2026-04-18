<#
.SYNOPSIS
    Check DNS resolver configuration and connectivity

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

function Get-ResolverHealth {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Resolv Check
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $dnsServers = Get-DnsClientServerAddress -AddressFamily IPv4 | Where-Object { $_.ServerAddresses.Count -gt 0 }; Write-Host "`n[DNS Resolvers]" -ForegroundColor Yellow; foreach ($adapter in $dnsServers) { Write-Host "  $($adapter.InterfaceAlias): $($adapter.ServerAddresses -join ", ")" }; foreach ($server in ($dnsServers.ServerAddresses | Select-Object -Unique)) { $sw = [Diagnostics.Stopwatch]::StartNew(); $result = Resolve-DnsName google.com -Server $server -ErrorAction SilentlyContinue; $sw.Stop(); Write-Host "  $server -> $(if($result){"OK ($($sw.ElapsedMilliseconds)ms)"}else{"FAILED"})" -ForegroundColor $(if($result){"Green"}else{"Red"}) }
}


Export-ModuleMember -Function *

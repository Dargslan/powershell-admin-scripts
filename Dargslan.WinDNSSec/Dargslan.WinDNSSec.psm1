<#
.SYNOPSIS
    Windows DNS security audit toolkit — DNSSEC validation, DNS-over-HTTPS, DNS cache poisoning defense, and resolver hardening
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-DNSSecurityAudit {
    <#
    .SYNOPSIS
        Audit DNS security configuration and DNSSEC
    .DESCRIPTION
        Part of Dargslan.WinDNSSec (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        DNSServers = Get-DnsClientServerAddress -AddressFamily IPv4 -ErrorAction SilentlyContinue | Where-Object ServerAddresses | Select-Object InterfaceAlias, ServerAddresses
        DoHSettings = Get-DnsClientDohServerAddress -ErrorAction SilentlyContinue | Select-Object ServerAddress, DohTemplate, AllowFallbackToUdp, AutoUpgrade
        DNSCache = Get-DnsClientCache -ErrorAction SilentlyContinue | Group-Object Type | Select-Object Name, Count | Sort-Object Count -Descending | Select-Object -First 10
        DNSSECValidation = (Get-DnsClientNrptRule -ErrorAction SilentlyContinue | Where-Object DnssecValidationRequired | Measure-Object).Count
        GlobalSettings = Get-DnsClient -ErrorAction SilentlyContinue | Select-Object InterfaceAlias, ConnectionSpecificSuffix, RegisterThisConnectionsAddress | Select-Object -First 5
        Summary = [PSCustomObject]@{ DoHEnabled = $false; DNSSECRules = 0; CacheEntries = 0; DNSServers = 0 }
    }
    $report.Summary.DoHEnabled = ($report.DoHSettings | Measure-Object).Count -gt 0
    $report.Summary.DNSSECRules = $report.DNSSECValidation
    $report.Summary.CacheEntries = ($report.DNSCache | Measure-Object -Property Count -Sum).Sum
    $report.Summary.DNSServers = ($report.DNSServers | Measure-Object).Count
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [DNS Security - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    $report.DNSServers | Format-Table -AutoSize
    if ($report.DoHSettings) { Write-Host "  DNS-over-HTTPS:" -ForegroundColor Green; $report.DoHSettings | Format-Table -AutoSize }
    return $report
}

Export-ModuleMember -Function *

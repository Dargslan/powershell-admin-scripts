<#
.SYNOPSIS
    Windows DNS client diagnostics toolkit — DNS configuration, resolution testing, cache analysis, NRPT rules, and DNS performance monitoring

.DESCRIPTION
    Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
    Windows & DevOps Books: https://dargslan.com/books

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-DNSReport {
    <#
    .SYNOPSIS
        Generate DNS client configuration and health report
    .DESCRIPTION
        Analyzes DNS server configuration, tests resolution, checks cache health, and measures DNS response times.
        Part of Dargslan.WinDNSClient — https://dargslan.com
    #>
    [CmdletBinding()] param([string[]]$TestDomains = @("dargslan.com","google.com","microsoft.com"), [switch]$Json)

    $report = [ordered]@{
        Servers = Get-DnsClientServerAddress -AddressFamily IPv4 | Where-Object ServerAddresses | Select-Object InterfaceAlias, ServerAddresses
        Cache = [PSCustomObject]@{ Entries = (Get-DnsClientCache -ErrorAction SilentlyContinue | Measure-Object).Count; TopEntries = Get-DnsClientCache -ErrorAction SilentlyContinue | Select-Object -First 10 Entry, Data, Type }
        Resolution = $TestDomains | ForEach-Object {
            $start = Get-Date
            try { $result = Resolve-DnsName $_ -ErrorAction Stop; $ms = [math]::Round(((Get-Date)-$start).TotalMilliseconds,1); [PSCustomObject]@{ Domain = $_; OK = $true; IP = ($result | Where-Object Type -eq "A" | Select-Object -First 1).IPAddress; TimeMs = $ms } }
            catch { [PSCustomObject]@{ Domain = $_; OK = $false; IP = "N/A"; TimeMs = "N/A" } }
        }
        NRPT = Get-DnsClientNrptRule -ErrorAction SilentlyContinue | Select-Object Namespace, NameServers
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [DNS Report]" -ForegroundColor Cyan
    $report.Servers | Format-Table -AutoSize
    $report.Resolution | Format-Table -AutoSize
    return $report
}

Export-ModuleMember -Function *

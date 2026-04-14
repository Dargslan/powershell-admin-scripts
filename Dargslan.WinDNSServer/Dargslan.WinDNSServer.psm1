<#
.SYNOPSIS
    Windows DNS Server management toolkit — zone inventory, record audit, forwarder configuration, DNS analytics, and zone health monitoring

.DESCRIPTION
    Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-DNSServerReport {
    <#
    .SYNOPSIS
        Audit DNS Server zones and configuration
    .DESCRIPTION
        Lists DNS zones, record counts, forwarders, and server configuration for health assessment.
        Part of Dargslan.WinDNSServer — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $zones = Get-DnsServerZone -ErrorAction SilentlyContinue
    if (-not $zones) { Write-Warning "DNS Server not installed or no zones configured"; return }
    $report = [ordered]@{
        ServerConfig = [PSCustomObject]@{
            Forwarders = (Get-DnsServerForwarder -ErrorAction SilentlyContinue).IPAddress -join ", "
            RootHints = (Get-DnsServerRootHint -ErrorAction SilentlyContinue | Measure-Object).Count
            Recursion = (Get-DnsServerRecursion -ErrorAction SilentlyContinue).Enable
            ListeningIPs = (Get-DnsServerSetting -ErrorAction SilentlyContinue).ListeningIPAddress -join ", "
        }
        Zones = $zones | ForEach-Object {
            $records = Get-DnsServerResourceRecord -ZoneName $_.ZoneName -ErrorAction SilentlyContinue
            [PSCustomObject]@{
                ZoneName = $_.ZoneName; ZoneType = $_.ZoneType; IsAutoCreated = $_.IsAutoCreated
                IsDsIntegrated = $_.IsDsIntegrated; IsReverseLookupZone = $_.IsReverseLookupZone
                RecordCount = ($records | Measure-Object).Count
                ARecords = ($records | Where-Object RecordType -eq "A" | Measure-Object).Count
                CNAMEs = ($records | Where-Object RecordType -eq "CNAME" | Measure-Object).Count
                MXRecords = ($records | Where-Object RecordType -eq "MX" | Measure-Object).Count
            }
        }
        Statistics = Get-DnsServerStatistics -ErrorAction SilentlyContinue | Select-Object -ExpandProperty QueryStatistics -ErrorAction SilentlyContinue
        Summary = [PSCustomObject]@{ TotalZones = ($zones | Measure-Object).Count; PrimaryZones = ($zones | Where-Object ZoneType -eq "Primary" | Measure-Object).Count; ForwardZones = ($zones | Where-Object { -not $_.IsReverseLookupZone } | Measure-Object).Count }
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [DNS Server Report]" -ForegroundColor Cyan
    $report.Summary | Format-List
    $report.Zones | Where-Object { -not $_.IsAutoCreated } | Format-Table ZoneName, ZoneType, RecordCount, ARecords, IsDsIntegrated -AutoSize
    $report.ServerConfig | Format-List
    return $report
}

Export-ModuleMember -Function *

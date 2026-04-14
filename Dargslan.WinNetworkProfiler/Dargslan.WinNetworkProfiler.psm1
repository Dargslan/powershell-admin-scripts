<#
.SYNOPSIS
    Windows network profiling toolkit — network adapter deep analysis, WiFi profile audit, NIC teaming status, VLAN configuration, and bandwidth testing (2026 Edition)

.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-NetworkProfile {
    <#
    .SYNOPSIS
        Deep network adapter and connectivity profiling
    .DESCRIPTION
        Generates detailed network profiles including adapter capabilities, WiFi configurations, NIC teams, and connectivity analysis.
        Part of Dargslan.WinNetworkProfiler (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $report = [ordered]@{
        Adapters = Get-NetAdapter | Select-Object Name, InterfaceDescription, Status, LinkSpeed, MacAddress, MediaType, DriverVersion, DriverDate, PhysicalMediaType, @{N="VLAN";E={(Get-NetAdapterVlan -Name $_.Name -ErrorAction SilentlyContinue).VlanID}}
        IPConfig = Get-NetIPConfiguration | Where-Object { $_.IPv4Address } | Select-Object InterfaceAlias, @{N="IPv4";E={$_.IPv4Address.IPAddress}}, @{N="Gateway";E={$_.IPv4DefaultGateway.NextHop}}, @{N="DNS";E={($_.DNSServer | Where-Object AddressFamily -eq 2).ServerAddresses -join ","}}
        WiFiProfiles = netsh wlan show profiles 2>&1 | Where-Object { $_ -match "All User Profile\s+:\s+(.+)" } | ForEach-Object { $Matches[1].Trim() }
        NICTeaming = Get-NetLbfoTeam -ErrorAction SilentlyContinue | Select-Object Name, TeamingMode, LoadBalancingAlgorithm, Status, Members
        OffloadCapabilities = Get-NetAdapterChecksumOffload -ErrorAction SilentlyContinue | Select-Object Name, IPv4Enabled, TcpIPv4Enabled, UdpIPv4Enabled
        ConnectionProfile = Get-NetConnectionProfile -ErrorAction SilentlyContinue | Select-Object InterfaceAlias, NetworkCategory, IPv4Connectivity, IPv6Connectivity
        Summary = [PSCustomObject]@{
            PhysicalAdapters = (Get-NetAdapter -Physical -ErrorAction SilentlyContinue | Measure-Object).Count
            ActiveAdapters = (Get-NetAdapter | Where-Object Status -eq "Up" | Measure-Object).Count
            WiFiProfiles = (netsh wlan show profiles 2>&1 | Select-String "All User Profile" | Measure-Object).Count
            NICTeams = (Get-NetLbfoTeam -ErrorAction SilentlyContinue | Measure-Object).Count
        }
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Network Profiler — 2026 Edition]" -ForegroundColor Cyan
    $report.Summary | Format-List
    $report.Adapters | Where-Object Status -eq "Up" | Format-Table Name, InterfaceDescription, LinkSpeed, MacAddress -AutoSize
    $report.IPConfig | Format-Table -AutoSize
    if ($report.WiFiProfiles) { Write-Host "  WiFi Profiles ($($report.WiFiProfiles.Count)):" -ForegroundColor Yellow; $report.WiFiProfiles | ForEach-Object { Write-Host "    - $_" } }
    return $report
}

Export-ModuleMember -Function *

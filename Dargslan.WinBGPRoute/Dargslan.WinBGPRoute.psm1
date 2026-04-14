function Get-BGPRouteAudit {
    <#
    .SYNOPSIS
        Audit routing table and BGP peer configuration
    .DESCRIPTION
        Windows routing and BGP audit toolkit — routing table, persistent routes, RRAS status, BGP peers, and network interfaces
        Part of the Dargslan Windows Admin Toolkit — https://dargslan.com
    .PARAMETER Json
        Output results as JSON
    .EXAMPLE
        Get-BGPRouteAudit
    .EXAMPLE
        Get-BGPRouteAudit -Json
    .LINK
        https://dargslan.com
    .LINK
        https://www.powershellgallery.com/profiles/Dargslan
    #>
    [CmdletBinding()]
    param([switch]$Json)

    $report = [ordered]@{
        RoutingTable = Get-NetRoute -ErrorAction SilentlyContinue | Where-Object { $_.DestinationPrefix -ne "ff00::/8" } | Select-Object DestinationPrefix, NextHop, RouteMetric, InterfaceAlias, AddressFamily | Select-Object -First 40
        PersistentRoutes = route print 2>$null | Where-Object { $_ -match "^\s+\d" } | ForEach-Object { $_.Trim() } | Select-Object -First 20
        Interfaces = Get-NetAdapter -ErrorAction SilentlyContinue | Where-Object Status -eq "Up" | Select-Object Name, InterfaceDescription, LinkSpeed, MacAddress
        RRASService = Get-Service RemoteAccess -ErrorAction SilentlyContinue | Select-Object Status, StartType
        BGPPeers = Get-BgpPeer -ErrorAction SilentlyContinue | Select-Object PeerName, PeerASN, LocalIPAddress, PeerIPAddress, ConnectivityStatus
        BGPRoutes = Get-BgpRouteInformation -ErrorAction SilentlyContinue | Select-Object Network, NextHop, Origin, LocalPref | Select-Object -First 20
        Warnings = @()
    }
    if ($report.RRASService.Status -ne "Running") { $report.Warnings += "RRAS service is not running" }
    $report.Summary = [PSCustomObject]@{ RouteCount = ($report.RoutingTable | Measure-Object).Count; ActiveAdapters = ($report.Interfaces | Measure-Object).Count; BGPPeerCount = ($report.BGPPeers | Measure-Object).Count }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [BGP/Route Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.Interfaces) { $report.Interfaces | Format-Table Name, LinkSpeed, MacAddress -AutoSize }
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function Get-BGPRouteAudit

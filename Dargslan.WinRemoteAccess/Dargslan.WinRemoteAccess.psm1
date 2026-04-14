function Get-RemoteAccessAudit {
    <#
    .SYNOPSIS
        Audit RRAS VPN server configuration and connections
    .DESCRIPTION
        Windows Remote Access VPN audit toolkit — RRAS configuration, VPN protocols, SSTP, IKEv2, RADIUS, and connection stats
        Part of the Dargslan Windows Admin Toolkit — https://dargslan.com
    .PARAMETER Json
        Output results as JSON
    .EXAMPLE
        Get-RemoteAccessAudit
    .EXAMPLE
        Get-RemoteAccessAudit -Json
    .LINK
        https://dargslan.com
    .LINK
        https://www.powershellgallery.com/profiles/Dargslan
    #>
    [CmdletBinding()]
    param([switch]$Json)

    $report = [ordered]@{
        RRASService = Get-Service RemoteAccess -ErrorAction SilentlyContinue | Select-Object Status, StartType
        RAConfig = Get-RemoteAccess -ErrorAction SilentlyContinue | Select-Object VpnStatus, VpnProtocol, SstpProxyEnabled, DAStatus
        ActiveConnections = Get-RemoteAccessConnectionStatistics -ErrorAction SilentlyContinue | Select-Object ClientIPAddress, ConnectionType, ConnectionDuration, TotalBytesIn, TotalBytesOut | Select-Object -First 20
        IPConfig = Get-RemoteAccessIPAddress -ErrorAction SilentlyContinue | Select-Object IPAddressType, InternalIPAddress, ExternalIPAddress
        RoutingProtocols = Get-RemoteAccessRoutingDomain -ErrorAction SilentlyContinue | Select-Object Name, VpnStatus, VpnProtocol
        Ports = Get-RemoteAccessPort -ErrorAction SilentlyContinue | Select-Object PortType, MaxPorts, ActiveConnections | Select-Object -First 10
        Warnings = @()
    }
    if (-not $report.RRASService -or $report.RRASService.Status -ne "Running") { $report.Warnings += "RRAS service is not running" }
    $report.Summary = [PSCustomObject]@{ ServiceRunning = ($report.RRASService.Status -eq "Running"); VPNEnabled = ($report.RAConfig.VpnStatus -eq "Installed"); ActiveVPNClients = ($report.ActiveConnections | Measure-Object).Count }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Remote Access VPN Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.ActiveConnections) { $report.ActiveConnections | Format-Table -AutoSize }
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function Get-RemoteAccessAudit

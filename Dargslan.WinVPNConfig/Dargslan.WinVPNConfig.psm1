<#
.SYNOPSIS
    Windows VPN configuration audit toolkit — VPN connections, protocols, authentication methods, split tunneling, and always-on VPN status
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-VPNAudit {
    <#
    .SYNOPSIS
        Audit VPN connections and configuration
    .DESCRIPTION
        Part of Dargslan.WinVPNConfig (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        VPNConnections = Get-VpnConnection -ErrorAction SilentlyContinue | Select-Object Name, ServerAddress, TunnelType, AuthenticationMethod, SplitTunneling, ConnectionStatus, EncryptionLevel, L2tpIPsecAuth, RememberCredential
        RASConnections = Get-CimInstance Win32_NetworkAdapter -Filter "NetConnectionID LIKE \"%VPN%\" OR NetConnectionID LIKE \"%Tunnel%\"" -ErrorAction SilentlyContinue | Select-Object Name, NetConnectionID, NetConnectionStatus
        AlwaysOnVPN = Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\NetworkConnectivity*" -ErrorAction SilentlyContinue
        RASService = Get-Service RemoteAccess -ErrorAction SilentlyContinue | Select-Object Status, StartType
        Warnings = @()
    }
    $report.VPNConnections | Where-Object SplitTunneling -eq $true | ForEach-Object { $report.Warnings += "VPN $($_.Name) uses split tunneling" }
    $report.VPNConnections | Where-Object RememberCredential -eq $true | ForEach-Object { $report.Warnings += "VPN $($_.Name) stores credentials" }
    $report.Summary = [PSCustomObject]@{
        VPNConnections = ($report.VPNConnections | Measure-Object).Count
        Connected = ($report.VPNConnections | Where-Object ConnectionStatus -eq "Connected" | Measure-Object).Count
        SplitTunnel = ($report.VPNConnections | Where-Object SplitTunneling -eq $true | Measure-Object).Count
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [VPN Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.VPNConnections) { $report.VPNConnections | Format-Table Name, ServerAddress, TunnelType, ConnectionStatus, SplitTunneling -AutoSize }
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function *

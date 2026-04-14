<#
.SYNOPSIS
    Network Location Awareness audit toolkit — network profiles, connectivity status, firewall profile mapping, and network category management
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-NLAAudit {
    <#
    .SYNOPSIS
        Audit Network Location Awareness and profiles
    .DESCRIPTION
        Part of Dargslan.WinNLAStatus (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        Profiles = Get-NetConnectionProfile -ErrorAction SilentlyContinue | Select-Object InterfaceAlias, Name, NetworkCategory, IPv4Connectivity, IPv6Connectivity, InterfaceIndex
        FirewallProfiles = Get-NetFirewallProfile | Select-Object Name, Enabled, DefaultInboundAction, DefaultOutboundAction
        NLAService = Get-Service NlaSvc -ErrorAction SilentlyContinue | Select-Object Status, StartType
        NetworkAdapters = Get-NetAdapter | Where-Object Status -eq "Up" | Select-Object Name, InterfaceDescription, LinkSpeed, MacAddress
        Warnings = @()
    }
    $publicNets = $report.Profiles | Where-Object NetworkCategory -ne "DomainAuthenticated"
    if ($publicNets | Where-Object NetworkCategory -eq "Public") { $report.Warnings += "Public network detected — may restrict file sharing and discovery" }
    $report.Summary = [PSCustomObject]@{
        ActiveConnections = ($report.Profiles | Measure-Object).Count
        DomainNetworks = ($report.Profiles | Where-Object NetworkCategory -eq "DomainAuthenticated" | Measure-Object).Count
        PrivateNetworks = ($report.Profiles | Where-Object NetworkCategory -eq "Private" | Measure-Object).Count
        PublicNetworks = ($report.Profiles | Where-Object NetworkCategory -eq "Public" | Measure-Object).Count
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [NLA Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    $report.Profiles | Format-Table InterfaceAlias, Name, NetworkCategory, IPv4Connectivity -AutoSize
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function *

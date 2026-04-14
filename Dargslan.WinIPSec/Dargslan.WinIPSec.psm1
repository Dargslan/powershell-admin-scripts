<#
.SYNOPSIS
    IPsec policy and SA management toolkit — main mode SAs, quick mode SAs, IPsec rules, connection security policies, and encryption analysis
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-IPSecAudit {
    <#
    .SYNOPSIS
        Audit IPsec policies and security associations
    .DESCRIPTION
        Part of Dargslan.WinIPSec (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        IPsecRules = Get-NetIPsecRule -ErrorAction SilentlyContinue | Select-Object DisplayName, Enabled, InboundSecurity, OutboundSecurity, Mode, Phase1AuthSet
        MainModeSAs = Get-NetIPsecMainModeSA -ErrorAction SilentlyContinue | Select-Object Name, LocalEndpoint, RemoteEndpoint
        QuickModeSAs = Get-NetIPsecQuickModeSA -ErrorAction SilentlyContinue | Select-Object Name, LocalEndpoint, RemoteEndpoint
        ConnectionSecRules = Get-NetIPsecRule -ErrorAction SilentlyContinue | Where-Object Enabled -eq "True" | Select-Object DisplayName, Mode, InboundSecurity, OutboundSecurity
        Phase1Auth = Get-NetIPsecPhase1AuthSet -ErrorAction SilentlyContinue | Select-Object DisplayName, Proposal
        Phase2Auth = Get-NetIPsecPhase2AuthSet -ErrorAction SilentlyContinue | Select-Object DisplayName, Proposal
        Summary = [PSCustomObject]@{ Rules = 0; ActiveRules = 0; MainModeSAs = 0; QuickModeSAs = 0 }
    }
    $report.Summary.Rules = ($report.IPsecRules | Measure-Object).Count
    $report.Summary.ActiveRules = ($report.ConnectionSecRules | Measure-Object).Count
    $report.Summary.MainModeSAs = ($report.MainModeSAs | Measure-Object).Count
    $report.Summary.QuickModeSAs = ($report.QuickModeSAs | Measure-Object).Count
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [IPsec Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.ConnectionSecRules) { Write-Host "  Active Rules:" -ForegroundColor Yellow; $report.ConnectionSecRules | Format-Table -AutoSize }
    if ($report.MainModeSAs) { Write-Host "  Main Mode SAs:" -ForegroundColor Yellow; $report.MainModeSAs | Format-Table -AutoSize }
    return $report
}

Export-ModuleMember -Function *

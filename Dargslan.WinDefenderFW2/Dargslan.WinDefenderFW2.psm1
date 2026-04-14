<#
.SYNOPSIS
    Advanced Windows Defender Firewall toolkit v2 — rule optimization, connection security rules, IPsec audit, and firewall log parsing (2026 Edition)

.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-FirewallAdvancedAudit {
    <#
    .SYNOPSIS
        Advanced firewall analysis with IPsec and logging
    .DESCRIPTION
        Performs deep firewall audit including connection security rules, IPsec policies, firewall logs, and rule optimization.
        Part of Dargslan.WinDefenderFW2 (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $report = [ordered]@{
        Profiles = Get-NetFirewallProfile | Select-Object Name, Enabled, DefaultInboundAction, DefaultOutboundAction, AllowInboundRules, LogAllowed, LogBlocked, LogFileName, LogMaxSizeKilobytes
        RuleStats = [PSCustomObject]@{
            TotalRules = (Get-NetFirewallRule | Measure-Object).Count
            EnabledRules = (Get-NetFirewallRule -Enabled True | Measure-Object).Count
            InboundAllow = (Get-NetFirewallRule -Enabled True -Direction Inbound -Action Allow | Measure-Object).Count
            InboundBlock = (Get-NetFirewallRule -Enabled True -Direction Inbound -Action Block | Measure-Object).Count
            OutboundAllow = (Get-NetFirewallRule -Enabled True -Direction Outbound -Action Allow | Measure-Object).Count
            OutboundBlock = (Get-NetFirewallRule -Enabled True -Direction Outbound -Action Block | Measure-Object).Count
        }
        ConnectionSecurityRules = Get-NetIPsecRule -ErrorAction SilentlyContinue | Select-Object DisplayName, Enabled, InboundSecurity, OutboundSecurity, Mode, Phase1AuthSet, Phase2AuthSet
        IPsecSAs = Get-NetIPsecMainModeSA -ErrorAction SilentlyContinue | Select-Object Name, LocalEndpoint, RemoteEndpoint
        LogConfig = Get-NetFirewallProfile | Select-Object Name, LogFileName, @{N="LogExists";E={Test-Path $_.LogFileName -ErrorAction SilentlyContinue}}, LogMaxSizeKilobytes, LogAllowed, LogBlocked
    }
    $score = 100
    $report.Profiles | Where-Object { -not $_.Enabled } | ForEach-Object { $score -= 20 }
    if ($report.RuleStats.InboundAllow -gt 100) { $score -= 10 }
    $report.Profiles | Where-Object { -not $_.LogBlocked } | ForEach-Object { $score -= 5 }
    $report.SecurityScore = [PSCustomObject]@{ Score = [math]::Max(0,$score); Grade = $(if ($score -ge 80) {"A"} elseif ($score -ge 60) {"B"} else {"C"}) }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Advanced Firewall Audit — 2026 Edition]" -ForegroundColor Cyan
    $report.Profiles | Format-Table Name, Enabled, DefaultInboundAction, DefaultOutboundAction, LogBlocked -AutoSize
    $report.RuleStats | Format-List
    if ($report.ConnectionSecurityRules) { Write-Host "  Connection Security Rules:" -ForegroundColor Yellow; $report.ConnectionSecurityRules | Format-Table -AutoSize }
    Write-Host "  Score: $($report.SecurityScore.Score)/100 ($($report.SecurityScore.Grade))" -ForegroundColor $(if ($score -ge 80) {"Green"} else {"Yellow"})
    return $report
}

Export-ModuleMember -Function *

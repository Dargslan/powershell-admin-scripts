<#
.SYNOPSIS
    Windows Firewall management and auditing toolkit — rule analysis, profile management, security assessment, logging, and rule export/import

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

function Get-FirewallAudit {
    <#
    .SYNOPSIS
        Perform a comprehensive Windows Firewall security audit
    .DESCRIPTION
        Analyzes firewall profiles, rules, logging configuration, and identifies potential security issues. Provides a security score.
        Part of Dargslan.WinFirewall — https://dargslan.com
    #>
    [CmdletBinding()]
    param(
        [switch]$IncludeRules,
        [switch]$Json,
        [int]$TopRules = 50
    )

    Write-Host "`n  [Firewall Audit]" -ForegroundColor Cyan
    $audit = [ordered]@{}

    $profiles = Get-NetFirewallProfile
    $audit["Profiles"] = $profiles | ForEach-Object {
        [PSCustomObject]@{
            Name            = $_.Name
            Enabled         = $_.Enabled
            DefaultInbound  = $_.DefaultInboundAction
            DefaultOutbound = $_.DefaultOutboundAction
            LogAllowed      = $_.LogAllowed
            LogBlocked      = $_.LogBlocked
            LogFile         = $_.LogFileName
            LogMaxSize      = "$($_.LogMaxSizeKilobytes) KB"
        }
    }

    $allRules = Get-NetFirewallRule -Enabled True
    $inbound = ($allRules | Where-Object Direction -eq "Inbound" | Measure-Object).Count
    $outbound = ($allRules | Where-Object Direction -eq "Outbound" | Measure-Object).Count
    $allowAny = $allRules | Where-Object { $_.Action -eq "Allow" -and $_.Profile -match "Any|Public" }

    $audit["Summary"] = [PSCustomObject]@{
        TotalEnabledRules = ($allRules | Measure-Object).Count
        InboundAllow      = $inbound
        OutboundAllow     = $outbound
        PublicAnyRules    = ($allowAny | Measure-Object).Count
        AllProfilesOn     = ($profiles | Where-Object Enabled -eq $true | Measure-Object).Count -eq 3
        LoggingEnabled    = ($profiles | Where-Object { $_.LogBlocked -eq "True" } | Measure-Object).Count
    }

    $score = 100
    if (-not $audit["Summary"].AllProfilesOn) { $score -= 30 }
    if ($audit["Summary"].PublicAnyRules -gt 10) { $score -= 20 }
    if ($audit["Summary"].LoggingEnabled -lt 3) { $score -= 15 }
    $audit["SecurityScore"] = [PSCustomObject]@{ Score = $score; Grade = $(if ($score -ge 80) { "A" } elseif ($score -ge 60) { "B" } elseif ($score -ge 40) { "C" } else { "D" }) }

    if ($IncludeRules) {
        $audit["TopRules"] = $allRules | Select-Object -First $TopRules DisplayName, Direction, Action, Profile, @{N="Protocol";E={(Get-NetFirewallPortFilter -AssociatedNetFirewallRule $_ -ErrorAction SilentlyContinue).Protocol}}
    }

    if ($Json) { return $audit | ConvertTo-Json -Depth 5 }
    $audit["Profiles"] | Format-Table -AutoSize
    $audit["Summary"] | Format-List
    Write-Host "  Security Score: $($audit.SecurityScore.Score)/100 (Grade: $($audit.SecurityScore.Grade))" -ForegroundColor $(if ($score -ge 80) { "Green" } elseif ($score -ge 60) { "Yellow" } else { "Red" })
    return $audit
}

function Export-FirewallRules {
    <#
    .SYNOPSIS
        Export all firewall rules to JSON or CSV for backup
    .DESCRIPTION
        Exports all Windows Firewall rules to a file for backup, migration, or documentation purposes.
        Part of Dargslan.WinFirewall — https://dargslan.com
    #>
    [CmdletBinding()]
    param(
        [string]$Path = "firewall-rules-export.json",
        [ValidateSet("JSON","CSV")]
        [string]$Format = "JSON",
        [switch]$EnabledOnly
    )

    $rules = if ($EnabledOnly) { Get-NetFirewallRule -Enabled True } else { Get-NetFirewallRule }
    $export = $rules | ForEach-Object {
        $port = Get-NetFirewallPortFilter -AssociatedNetFirewallRule $_ -ErrorAction SilentlyContinue
        [PSCustomObject]@{
            Name = $_.DisplayName; Direction = $_.Direction.ToString()
            Action = $_.Action.ToString(); Profile = $_.Profile.ToString()
            Enabled = $_.Enabled.ToString(); Protocol = $port.Protocol
            LocalPort = $port.LocalPort; RemotePort = $port.RemotePort
        }
    }
    if ($Format -eq "JSON") { $export | ConvertTo-Json -Depth 3 | Out-File $Path -Encoding UTF8 }
    else { $export | Export-Csv -Path ($Path -replace "\.json$",".csv") -NoTypeInformation }
    Write-Host "Exported $($export.Count) rules to: $Path" -ForegroundColor Green
}

Export-ModuleMember -Function *

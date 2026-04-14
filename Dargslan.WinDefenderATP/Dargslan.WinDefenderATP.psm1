<#
.SYNOPSIS
    Microsoft Defender for Endpoint status toolkit — advanced threat protection monitoring, attack surface reduction rules, controlled folder access, and exploit protection (2026 Edition)

.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-ATPStatus {
    <#
    .SYNOPSIS
        Check Microsoft Defender for Endpoint and advanced protection status
    .DESCRIPTION
        Reports Defender ATP onboarding, ASR rules, exploit protection, controlled folder access, and network protection.
        Part of Dargslan.WinDefenderATP (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $report = [ordered]@{
        DefenderStatus = Get-MpComputerStatus -ErrorAction SilentlyContinue | Select-Object AMRunningMode, AMServiceEnabled, RealTimeProtectionEnabled, IoavProtectionEnabled, AntivirusEnabled, BehaviorMonitorEnabled, NISEnabled, OnAccessProtectionEnabled
        ASRRules = Get-MpPreference -ErrorAction SilentlyContinue | Select-Object -ExpandProperty AttackSurfaceReductionRules_Ids -ErrorAction SilentlyContinue
        ASRActions = Get-MpPreference -ErrorAction SilentlyContinue | Select-Object -ExpandProperty AttackSurfaceReductionRules_Actions -ErrorAction SilentlyContinue
        ControlledFolderAccess = (Get-MpPreference -ErrorAction SilentlyContinue).EnableControlledFolderAccess
        NetworkProtection = (Get-MpPreference -ErrorAction SilentlyContinue).EnableNetworkProtection
        CloudProtection = [PSCustomObject]@{
            CloudDelivered = (Get-MpPreference -ErrorAction SilentlyContinue).MAPSReporting
            CloudBlockLevel = (Get-MpPreference -ErrorAction SilentlyContinue).CloudBlockLevel
            CloudExtendedTimeout = (Get-MpPreference -ErrorAction SilentlyContinue).CloudExtendedTimeout
        }
        ExploitProtection = Get-ProcessMitigation -System -ErrorAction SilentlyContinue | Select-Object -First 10
        Exclusions = [PSCustomObject]@{
            Paths = (Get-MpPreference -ErrorAction SilentlyContinue).ExclusionPath
            Extensions = (Get-MpPreference -ErrorAction SilentlyContinue).ExclusionExtension
            Processes = (Get-MpPreference -ErrorAction SilentlyContinue).ExclusionProcess
        }
    }
    $score = 50
    if ($report.DefenderStatus.RealTimeProtectionEnabled) { $score += 15 }
    if ($report.DefenderStatus.BehaviorMonitorEnabled) { $score += 10 }
    if ($report.ControlledFolderAccess -eq 1) { $score += 10 }
    if ($report.NetworkProtection -eq 1) { $score += 10 }
    if ($report.CloudProtection.CloudDelivered -ge 1) { $score += 5 }
    $report.SecurityScore = [PSCustomObject]@{ Score = $score; Grade = $(if ($score -ge 80) {"A"} elseif ($score -ge 60) {"B"} else {"C"}) }
    if ($Json) { return $report | ConvertTo-Json -Depth 4 }
    Write-Host "`n  [Defender ATP Status — 2026 Edition]" -ForegroundColor Cyan
    $report.DefenderStatus | Format-List
    Write-Host "  Controlled Folder Access: $(if($report.ControlledFolderAccess -eq 1){"Enabled"}else{"Disabled"})"
    Write-Host "  Network Protection: $(if($report.NetworkProtection -eq 1){"Enabled"}else{"Disabled"})"
    Write-Host "  Score: $score/100 ($($report.SecurityScore.Grade))" -ForegroundColor $(if ($score -ge 80) {"Green"} elseif ($score -ge 60) {"Yellow"} else {"Red"})
    return $report
}

Export-ModuleMember -Function *

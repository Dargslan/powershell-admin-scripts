<#
.SYNOPSIS
    Attack Surface Reduction rules management toolkit — ASR rule inventory, action states, exclusions, block events, and compliance reporting
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-ASRRulesAudit {
    <#
    .SYNOPSIS
        Audit Attack Surface Reduction rules and compliance
    .DESCRIPTION
        Part of Dargslan.WinASRRules (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $asrGuids = @{
        "56a863a9-875e-4185-98a7-b882c64b5ce5" = "Block abuse of exploited vulnerable signed drivers"
        "7674ba52-37eb-4a4f-a9a1-f0f9a1619a2c" = "Block Adobe Reader from creating child processes"
        "d4f940ab-401b-4efc-aadc-ad5f3c50688a" = "Block all Office applications from creating child processes"
        "9e6c4e1f-7d60-472f-ba1a-a39ef669e4b2" = "Block credential stealing from LSASS"
        "be9ba2d9-53ea-4cdc-84e5-9b1eeee46550" = "Block executable content from email client and webmail"
        "01443614-cd74-433a-b99e-2ecdc07bfc25" = "Block executable files from running unless they meet criteria"
        "5beb7efe-fd9a-4556-801d-275e5ffc04cc" = "Block execution of potentially obfuscated scripts"
        "d3e037e1-3eb8-44c8-a917-57927947596d" = "Block JavaScript or VBScript from launching downloaded content"
        "3b576869-a4ec-4529-8536-b80a7769e899" = "Block Office applications from creating executable content"
        "75668c1f-73b5-4cf0-bb93-3ecf5cb7cc84" = "Block Office applications from injecting code into other processes"
        "26190899-1602-49e8-8b27-eb1d0a1ce869" = "Block Office communication app from creating child processes"
        "e6db77e5-3df2-4cf1-b95a-636979351e5b" = "Block persistence through WMI event subscription"
        "d1e49aac-8f56-4280-b9ba-993a6d77406c" = "Block process creations originating from PSExec and WMI commands"
        "b2b3f03d-6a65-4f7b-a9c7-1c7ef74a9ba4" = "Block untrusted and unsigned processes that run from USB"
        "92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b" = "Block Win32 API calls from Office macros"
        "c1db55ab-c21a-4637-bb3f-a12568109d35" = "Use advanced protection against ransomware"
    }
    $prefs = Get-MpPreference -ErrorAction SilentlyContinue
    $ruleIds = $prefs.AttackSurfaceReductionRules_Ids
    $ruleActions = $prefs.AttackSurfaceReductionRules_Actions
    $report = [ordered]@{
        Rules = @()
        Exclusions = $prefs.AttackSurfaceReductionOnlyExclusions
        RecentBlocks = Get-WinEvent -FilterHashtable @{LogName="Microsoft-Windows-Windows Defender/Operational";Id=1121,1122} -MaxEvents 15 -ErrorAction SilentlyContinue | Select-Object TimeCreated, Id, @{N="Rule";E={$_.Properties[0].Value}}, @{N="File";E={$_.Properties[3].Value}}
        Warnings = @()
    }
    if ($ruleIds) {
        for ($i = 0; $i -lt $ruleIds.Count; $i++) {
            $action = if($ruleActions -and $i -lt $ruleActions.Count){switch($ruleActions[$i]){0{"Disabled"}1{"Block"}2{"Audit"}6{"Warn"}default{"Unknown"}}}else{"Not set"}
            $name = if($asrGuids[$ruleIds[$i]]){$asrGuids[$ruleIds[$i]]}else{"Unknown rule"}
            $report.Rules += [PSCustomObject]@{ GUID=$ruleIds[$i]; Name=$name; Action=$action }
        }
    }
    $report.Summary = [PSCustomObject]@{
        TotalRules = ($report.Rules | Measure-Object).Count
        BlockMode = ($report.Rules | Where-Object Action -eq "Block" | Measure-Object).Count
        AuditMode = ($report.Rules | Where-Object Action -eq "Audit" | Measure-Object).Count
        Disabled = ($report.Rules | Where-Object Action -eq "Disabled" | Measure-Object).Count
        RecentBlocks = ($report.RecentBlocks | Measure-Object).Count
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [ASR Rules Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.Rules) { $report.Rules | Format-Table Action, Name -AutoSize }
    if ($report.RecentBlocks) { Write-Host "  Recent Block Events:" -ForegroundColor Yellow; $report.RecentBlocks | Select-Object -First 5 | Format-Table -AutoSize }
    return $report
}

Export-ModuleMember -Function *

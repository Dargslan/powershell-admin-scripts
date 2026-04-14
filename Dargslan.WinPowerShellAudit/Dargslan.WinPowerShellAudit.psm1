<#
.SYNOPSIS
    PowerShell security audit toolkit — execution policy, script block logging, module integrity, constrained language mode, and JEA configuration (2026 Edition)
.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
.LINK
    https://dargslan.com
#>

function Get-PowerShellAudit {
    <#
    .SYNOPSIS
        Audit PowerShell security configuration
    .DESCRIPTION
        Reports execution policies, script block logging, module logging, constrained language mode, JEA endpoints, and transcription settings.
        Part of Dargslan.WinPowerShellAudit (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $report = [ordered]@{
        ExecutionPolicy = [PSCustomObject]@{
            MachinePolicy = Get-ExecutionPolicy -Scope MachinePolicy -ErrorAction SilentlyContinue
            UserPolicy = Get-ExecutionPolicy -Scope UserPolicy -ErrorAction SilentlyContinue
            Process = Get-ExecutionPolicy -Scope Process -ErrorAction SilentlyContinue
            CurrentUser = Get-ExecutionPolicy -Scope CurrentUser -ErrorAction SilentlyContinue
            LocalMachine = Get-ExecutionPolicy -Scope LocalMachine -ErrorAction SilentlyContinue
        }
        ScriptBlockLogging = [PSCustomObject]@{
            Enabled = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" -ErrorAction SilentlyContinue).EnableScriptBlockLogging
            InvocationLogging = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" -ErrorAction SilentlyContinue).EnableScriptBlockInvocationLogging
        }
        ModuleLogging = [PSCustomObject]@{
            Enabled = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging" -ErrorAction SilentlyContinue).EnableModuleLogging
        }
        Transcription = [PSCustomObject]@{
            Enabled = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription" -ErrorAction SilentlyContinue).EnableTranscripting
            OutputDir = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription" -ErrorAction SilentlyContinue).OutputDirectory
            IncludeInvocation = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription" -ErrorAction SilentlyContinue).EnableInvocationHeader
        }
        LanguageMode = $ExecutionContext.SessionState.LanguageMode
        PSVersions = $PSVersionTable | Select-Object PSVersion, PSEdition, BuildVersion, CLRVersion
        JEAEndpoints = Get-PSSessionConfiguration -ErrorAction SilentlyContinue | Where-Object { $_.SessionType -eq "RestrictedRemoteServer" } | Select-Object Name, Permission, RunAsUser
        InstalledModules = (Get-Module -ListAvailable | Measure-Object).Count
    }
    $score = 50
    if ($report.ScriptBlockLogging.Enabled) { $score += 15 }
    if ($report.ModuleLogging.Enabled) { $score += 10 }
    if ($report.Transcription.Enabled) { $score += 15 }
    if ($report.LanguageMode -eq "ConstrainedLanguage") { $score += 10 }
    $report.SecurityScore = [PSCustomObject]@{ Score = $score; Grade = $(if ($score -ge 80) {"A"} elseif ($score -ge 60) {"B"} else {"C"}) }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [PowerShell Security Audit — 2026 Edition]" -ForegroundColor Cyan
    Write-Host "  Language Mode: $($report.LanguageMode)"
    $report.ExecutionPolicy | Format-List
    Write-Host "  Script Block Logging: $(if($report.ScriptBlockLogging.Enabled){\"Enabled\"}else{\"Disabled\"})"
    Write-Host "  Module Logging: $(if($report.ModuleLogging.Enabled){\"Enabled\"}else{\"Disabled\"})"
    Write-Host "  Transcription: $(if($report.Transcription.Enabled){\"Enabled\"}else{\"Disabled\"})"
    Write-Host "  Score: $score/100 ($($report.SecurityScore.Grade))" -ForegroundColor $(if ($score -ge 80) {"Green"} elseif ($score -ge 60) {"Yellow"} else {"Red"})
    return $report
}

Export-ModuleMember -Function *

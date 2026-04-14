<#
.SYNOPSIS
    Visual Studio Code audit toolkit — extensions inventory, settings analysis, workspace trust, telemetry configuration, and resource usage
.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-VSCodeAudit {
    <#
    .SYNOPSIS
        Audit Visual Studio Code installation and extensions
    .DESCRIPTION
        Reports VS Code version, installed extensions, settings, workspace trust, telemetry, and resource usage.
        Part of Dargslan.WinVSCodeAudit (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
$codePath = Get-Command code -ErrorAction SilentlyContinue
    if (-not $codePath) { Write-Warning "VS Code not found in PATH"; return }
    $report = [ordered]@{
        Version = (code --version 2>$null | Select-Object -First 1).Trim()
        Extensions = code --list-extensions --show-versions 2>$null | ForEach-Object { $p=$_ -split "@"; [PSCustomObject]@{Extension=$p[0];Version=$p[1]} }
        SettingsPath = "$env:APPDATA\Code\User\settings.json"
        SettingsExists = Test-Path "$env:APPDATA\Code\User\settings.json"
        WorkspaceTrust = @{}
    }
    if ($report.SettingsExists) {
        $settings = Get-Content "$env:APPDATA\Code\User\settings.json" -Raw -ErrorAction SilentlyContinue | ConvertFrom-Json -ErrorAction SilentlyContinue
        $report.WorkspaceTrust = [PSCustomObject]@{
            Enabled = $settings."security.workspace.trust.enabled"
            Telemetry = $settings."telemetry.telemetryLevel"
            AutoSave = $settings."files.autoSave"
            Theme = $settings."workbench.colorTheme"
        }
    }
    $report.Summary = [PSCustomObject]@{
        Version = $report.Version; Extensions = ($report.Extensions | Measure-Object).Count
        SettingsConfigured = $report.SettingsExists
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [VS Code Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.WorkspaceTrust) { $report.WorkspaceTrust | Format-List }
    $report.Extensions | Select-Object -First 20 | Format-Table -AutoSize
    return $report
}

Export-ModuleMember -Function *

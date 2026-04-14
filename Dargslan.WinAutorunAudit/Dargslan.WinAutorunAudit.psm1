<#
.SYNOPSIS
    Windows autorun/startup audit toolkit — startup programs, Run keys, scheduled tasks at boot, shell extensions, and persistence mechanisms
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-AutorunAudit {
    <#
    .SYNOPSIS
        Audit all autorun and startup persistence mechanisms
    .DESCRIPTION
        Part of Dargslan.WinAutorunAudit (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $locs = @(
        "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run",
        "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce",
        "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run",
        "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce",
        "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Run"
    )
    $report = [ordered]@{
        RegistryRuns = $locs | ForEach-Object {
            $path = $_
            if (Test-Path $path) {
                $props = Get-ItemProperty $path -ErrorAction SilentlyContinue
                $props.PSObject.Properties | Where-Object { $_.Name -notin "PSPath","PSParentPath","PSChildName","PSProvider","PSDrive" } | ForEach-Object {
                    [PSCustomObject]@{ Location=$path -replace "HKLM:\|HKCU:\",""; Name=$_.Name; Value=$_.Value }
                }
            }
        }
        StartupFolder = @(
            Get-ChildItem "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup" -ErrorAction SilentlyContinue | Select-Object Name, FullName, LastWriteTime
            Get-ChildItem "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp" -ErrorAction SilentlyContinue | Select-Object Name, FullName, LastWriteTime
        )
        Services = Get-CimInstance Win32_Service -Filter ("StartMode=" + [char]39 + "Auto" + [char]39) -ErrorAction SilentlyContinue | Where-Object { $_.State -eq "Running" } | Select-Object Name, DisplayName, PathName | Select-Object -First 30
        ScheduledAtBoot = Get-ScheduledTask -ErrorAction SilentlyContinue | Where-Object { $_.Triggers | Where-Object { $_ -is [CimInstance] -and $_.CimClass.CimClassName -eq "MSFT_TaskBootTrigger" } } | Select-Object TaskName, State | Select-Object -First 15
        Summary = [PSCustomObject]@{ RunKeys = 0; StartupItems = 0; AutoServices = 0; BootTasks = 0 }
    }
    $report.Summary.RunKeys = ($report.RegistryRuns | Measure-Object).Count
    $report.Summary.StartupItems = ($report.StartupFolder | Measure-Object).Count
    $report.Summary.AutoServices = ($report.Services | Measure-Object).Count
    $report.Summary.BootTasks = ($report.ScheduledAtBoot | Measure-Object).Count
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Autorun Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.RegistryRuns) { Write-Host "  Registry Run Keys:" -ForegroundColor Yellow; $report.RegistryRuns | Format-Table Location, Name, Value -AutoSize }
    if ($report.StartupFolder) { Write-Host "  Startup Folder:" -ForegroundColor Yellow; $report.StartupFolder | Format-Table -AutoSize }
    return $report
}

Export-ModuleMember -Function *

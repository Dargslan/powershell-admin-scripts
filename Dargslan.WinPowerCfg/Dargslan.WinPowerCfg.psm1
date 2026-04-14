<#
.SYNOPSIS
    Windows power configuration toolkit — power plan management, sleep/hibernate settings, battery health, and energy efficiency analysis

.DESCRIPTION
    Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-PowerReport {
    <#
    .SYNOPSIS
        Analyze Windows power configuration and energy settings
    .DESCRIPTION
        Reports current power plan, sleep settings, battery health, and provides energy efficiency recommendations.
        Part of Dargslan.WinPowerCfg — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $report = [ordered]@{
        ActivePlan = powercfg /getactivescheme 2>&1 | ForEach-Object { if ($_ -match ":\s+(.+)\s+\((.+)\)") { [PSCustomObject]@{ GUID = $Matches[1]; Name = $Matches[2] } } }
        AllPlans = powercfg /list 2>&1 | Where-Object { $_ -match "GUID:" } | ForEach-Object {
            if ($_ -match ":\s+(.+?)\s+\((.+?)\)(\s+\*)?") { [PSCustomObject]@{ GUID = $Matches[1]; Name = $Matches[2]; Active = [bool]$Matches[3] } }
        }
        SleepSettings = [PSCustomObject]@{
            HibernateEnabled = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Power" -ErrorAction SilentlyContinue).HibernateEnabled
            FastStartup = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" -ErrorAction SilentlyContinue).HiberbootEnabled
        }
        WakeTimers = powercfg /waketimers 2>&1
        LastWake = powercfg /lastwake 2>&1
    }
    $battery = Get-CimInstance Win32_Battery -ErrorAction SilentlyContinue
    if ($battery) {
        $report.Battery = [PSCustomObject]@{
            Status = $battery.BatteryStatus
            EstimatedCharge = "$($battery.EstimatedChargeRemaining)%"
            EstimatedRunTime = $battery.EstimatedRunTime
            Chemistry = switch($battery.Chemistry) { 1 {"Other"} 2 {"Unknown"} 3 {"Lead Acid"} 4 {"Nickel Cadmium"} 5 {"Nickel Metal Hydride"} 6 {"Lithium-ion"} default {"Unknown"} }
        }
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Power Configuration]" -ForegroundColor Cyan
    Write-Host "  Active Plan: $($report.ActivePlan.Name)"
    Write-Host "  Hibernate: $(if($report.SleepSettings.HibernateEnabled){"Enabled"}else{"Disabled"}) | Fast Startup: $(if($report.SleepSettings.FastStartup){"Enabled"}else{"Disabled"})"
    if ($report.Battery) { Write-Host "  Battery: $($report.Battery.EstimatedCharge) ($($report.Battery.Chemistry))" }
    return $report
}

Export-ModuleMember -Function *

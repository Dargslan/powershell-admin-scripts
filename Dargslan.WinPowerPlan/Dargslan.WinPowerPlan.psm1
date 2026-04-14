<#
.SYNOPSIS
    Windows power plan optimization toolkit — active plan analysis, custom plan detection, battery health, thermal monitoring, and energy efficiency scoring
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-PowerPlanAudit {
    <#
    .SYNOPSIS
        Audit power plans and energy efficiency
    .DESCRIPTION
        Part of Dargslan.WinPowerPlan (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        ActivePlan = powercfg /getactivescheme 2>$null | ForEach-Object { $_.Trim() }
        AllPlans = powercfg /list 2>$null | Where-Object { $_ -match "Power Scheme GUID" } | ForEach-Object {
            $active = $_ -match "\*$"
            [PSCustomObject]@{ Plan = ($_ -replace "Power Scheme GUID:\s+\S+\s+\(|\)\s*\*?$","").Trim(); Active = $active; GUID = if($_ -match "(\w{8}-\w{4}-\w{4}-\w{4}-\w{12})"){$Matches[1]}else{""} }
        }
        Battery = Get-CimInstance Win32_Battery -ErrorAction SilentlyContinue | Select-Object Name, Status, EstimatedChargeRemaining, BatteryStatus, DesignVoltage, EstimatedRunTime
        SleepSettings = [PSCustomObject]@{
            HibernateEnabled = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Power" -ErrorAction SilentlyContinue).HibernateEnabled
            StandbyActive = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Power" -ErrorAction SilentlyContinue).CsEnabled
        }
        Thermal = Get-CimInstance Win32_TemperatureProbe -ErrorAction SilentlyContinue | Select-Object Description, CurrentReading, Status
        Summary = [PSCustomObject]@{ Plans = 0; HasBattery = $false }
    }
    $report.Summary.Plans = ($report.AllPlans | Measure-Object).Count
    $report.Summary.HasBattery = ($report.Battery | Measure-Object).Count -gt 0
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Power Plan Audit - 2026]" -ForegroundColor Cyan
    Write-Host "  Active: $($report.ActivePlan)"
    $report.AllPlans | Format-Table -AutoSize
    if ($report.Battery) { Write-Host "  Battery:" -ForegroundColor Yellow; $report.Battery | Format-List }
    return $report
}

Export-ModuleMember -Function *

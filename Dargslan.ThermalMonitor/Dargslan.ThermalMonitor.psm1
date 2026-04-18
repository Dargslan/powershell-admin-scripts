<#
.SYNOPSIS
    Monitor system temperature sensors and thermal status

.DESCRIPTION
    Part of the Dargslan Windows Admin Tools collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
    Linux & DevOps Books: https://dargslan.com/books

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-ThermalStatus {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Thermal Monitor
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $thermal = Get-CimInstance -Namespace "root/WMI" -ClassName MSAcpi_ThermalZoneTemperature -ErrorAction SilentlyContinue; if ($thermal) { $results = $thermal | ForEach-Object { [PSCustomObject]@{Zone=$_.InstanceName; "Temp°C"=[math]::Round(($_.CurrentTemperature-2732)/10,1); Critical=[math]::Round(($_.CriticalTripPoint-2732)/10,1)} }; $results | Format-Table -AutoSize } else { Write-Host "Temperature sensors not available via WMI" -ForegroundColor Yellow }; $battery = Get-CimInstance Win32_Battery -ErrorAction SilentlyContinue; if ($battery) { Write-Host "`n[Battery] Charge: $($battery.EstimatedChargeRemaining)% | Status: $($battery.BatteryStatus)" -ForegroundColor Cyan }
}


Export-ModuleMember -Function *

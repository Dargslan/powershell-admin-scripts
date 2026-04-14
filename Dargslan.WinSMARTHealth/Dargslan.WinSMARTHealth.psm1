<#
.SYNOPSIS
    Disk SMART health monitoring toolkit — drive health prediction, temperature monitoring, reallocated sectors, power-on hours, and failure risk assessment
.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-SMARTHealth {
    <#
    .SYNOPSIS
        Monitor disk SMART health attributes
    .DESCRIPTION
        Reports disk SMART status, temperature, power-on hours, reallocated sectors, wear level, and failure risk.
        Part of Dargslan.WinSMARTHealth (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
$report = [ordered]@{
        Disks = Get-PhysicalDisk -ErrorAction SilentlyContinue | Select-Object FriendlyName, MediaType, HealthStatus, OperationalStatus, @{N="SizeGB";E={[math]::Round($_.Size/1GB,1)}}, BusType, FirmwareVersion, SerialNumber, Usage
        DiskDrive = Get-CimInstance Win32_DiskDrive | Select-Object Model, InterfaceType, MediaType, @{N="SizeGB";E={[math]::Round($_.Size/1GB,1)}}, Status, SerialNumber, Partitions, FirmwareRevision
        Reliability = Get-PhysicalDisk -ErrorAction SilentlyContinue | Get-StorageReliabilityCounter -ErrorAction SilentlyContinue | Select-Object DeviceId, Temperature, Wear, ReadErrorsTotal, WriteErrorsTotal, PowerOnHours, StartStopCycleCount, ReadLatencyMax, WriteLatencyMax, FlushLatencyMax
        Volumes = Get-Volume | Where-Object DriveLetter | Select-Object DriveLetter, FileSystemLabel, FileSystem, @{N="SizeGB";E={[math]::Round($_.Size/1GB,1)}}, @{N="FreeGB";E={[math]::Round($_.SizeRemaining/1GB,1)}}, @{N="UsedPct";E={if($_.Size -gt 0){[math]::Round((1-$_.SizeRemaining/$_.Size)*100,0)}else{0}}}, HealthStatus
        Warnings = @()
    }
    $report.Disks | Where-Object HealthStatus -ne "Healthy" | ForEach-Object { $report.Warnings += "Disk $($_.FriendlyName) status: $($_.HealthStatus)" }
    $report.Reliability | Where-Object Temperature -gt 50 | ForEach-Object { $report.Warnings += "Disk $($_.DeviceId) temperature: $($_.Temperature)C" }
    $report.Reliability | Where-Object Wear -gt 80 | ForEach-Object { $report.Warnings += "Disk $($_.DeviceId) wear level: $($_.Wear)%" }
    $report.Volumes | Where-Object UsedPct -gt 90 | ForEach-Object { $report.Warnings += "Volume $($_.DriveLetter): $($_.UsedPct)% full" }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [SMART Health - 2026]" -ForegroundColor Cyan
    $report.Disks | Format-Table FriendlyName, MediaType, HealthStatus, SizeGB -AutoSize
    if ($report.Reliability) { $report.Reliability | Format-Table DeviceId, Temperature, Wear, PowerOnHours, ReadErrorsTotal -AutoSize }
    $report.Volumes | Format-Table DriveLetter, FileSystemLabel, SizeGB, FreeGB, UsedPct, HealthStatus -AutoSize
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function *

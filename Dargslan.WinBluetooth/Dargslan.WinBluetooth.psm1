<#
.SYNOPSIS
    Windows Bluetooth device audit toolkit — paired devices, drivers, service status, security settings, and Bluetooth policy
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-BluetoothAudit {
    <#
    .SYNOPSIS
        Audit Bluetooth devices and security configuration
    .DESCRIPTION
        Part of Dargslan.WinBluetooth (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        Service = Get-Service bthserv -ErrorAction SilentlyContinue | Select-Object Status, StartType
        Devices = Get-PnpDevice -Class Bluetooth -ErrorAction SilentlyContinue | Select-Object FriendlyName, Status, InstanceId, Class
        Radios = Get-PnpDevice -FriendlyName "*Bluetooth*" -ErrorAction SilentlyContinue | Where-Object Status -eq "OK" | Select-Object FriendlyName, Status
        Policy = [PSCustomObject]@{
            AllowAdvertising = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Bluetooth\AllowAdvertising" -ErrorAction SilentlyContinue).value
            AllowDiscoverableMode = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Bluetooth\AllowDiscoverableMode" -ErrorAction SilentlyContinue).value
        }
        Summary = [PSCustomObject]@{ ServiceRunning = $false; DeviceCount = 0; ActiveRadios = 0 }
    }
    $report.Summary.ServiceRunning = $report.Service.Status -eq "Running"
    $report.Summary.DeviceCount = ($report.Devices | Measure-Object).Count
    $report.Summary.ActiveRadios = ($report.Radios | Measure-Object).Count
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Bluetooth Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.Devices) { $report.Devices | Format-Table FriendlyName, Status -AutoSize }
    return $report
}

Export-ModuleMember -Function *

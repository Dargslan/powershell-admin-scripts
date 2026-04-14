<#
.SYNOPSIS
    Windows USB device security toolkit — USB device inventory, policy enforcement, removable storage audit, and device installation control (2026 Edition)

.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-USBSecurityAudit {
    <#
    .SYNOPSIS
        Audit USB device security and policies
    .DESCRIPTION
        Reports connected USB devices, removable storage policy, device installation restrictions, and USB history.
        Part of Dargslan.WinUSBGuard (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $report = [ordered]@{
        ConnectedUSB = Get-PnpDevice -Class USB -Status OK -ErrorAction SilentlyContinue | Select-Object FriendlyName, InstanceId, Status, Class, Manufacturer
        RemovableDisks = Get-Volume | Where-Object DriveType -eq "Removable" | Select-Object DriveLetter, FileSystemLabel, FileSystem, @{N="SizeGB";E={[math]::Round($_.Size/1GB,1)}}, HealthStatus
        DevicePolicy = [PSCustomObject]@{
            RemovableStorageRead = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\RemovableStorageDevices" -ErrorAction SilentlyContinue).Deny_Read
            RemovableStorageWrite = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\RemovableStorageDevices" -ErrorAction SilentlyContinue).Deny_Write
            DeviceInstallRestriction = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions" -ErrorAction SilentlyContinue).DenyDeviceIDs
            AllowAdminOverride = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions" -ErrorAction SilentlyContinue).AllowAdminInstall
        }
        USBHistory = Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Enum\USBSTOR\*\*" -ErrorAction SilentlyContinue | Select-Object -First 20 FriendlyName, @{N="Serial";E={$_.PSChildName}}, Mfg
        Summary = [PSCustomObject]@{
            ConnectedDevices = (Get-PnpDevice -Class USB -Status OK -ErrorAction SilentlyContinue | Measure-Object).Count
            RemovableDrives = (Get-Volume | Where-Object DriveType -eq "Removable" | Measure-Object).Count
            StorageRestricted = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\RemovableStorageDevices" -ErrorAction SilentlyContinue).Deny_Write -eq 1
        }
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [USB Security Audit — 2026 Edition]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.ConnectedUSB) { Write-Host "  Connected USB:" -ForegroundColor Yellow; $report.ConnectedUSB | Format-Table FriendlyName, Manufacturer, Status -AutoSize }
    if ($report.RemovableDisks) { Write-Host "  Removable Disks:" -ForegroundColor Yellow; $report.RemovableDisks | Format-Table -AutoSize }
    Write-Host "  Removable Storage Write Blocked: $($report.Summary.StorageRestricted)" -ForegroundColor $(if ($report.Summary.StorageRestricted) {"Green"} else {"Yellow"})
    return $report
}

Export-ModuleMember -Function *

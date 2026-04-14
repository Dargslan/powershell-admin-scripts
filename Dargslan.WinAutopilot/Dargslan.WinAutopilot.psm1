<#
.SYNOPSIS
    Windows Autopilot diagnostics toolkit — hardware hash collection, deployment profile status, OOBE configuration, and provisioning log analysis (2026 Edition)

.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-AutopilotInfo {
    <#
    .SYNOPSIS
        Collect Autopilot hardware hash and deployment info
    .DESCRIPTION
        Reports hardware hash, serial number, Autopilot profile status, and deployment readiness.
        Part of Dargslan.WinAutopilot (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json, [string]$ExportCSV)

    $serial = (Get-CimInstance Win32_BIOS).SerialNumber
    $cs = Get-CimInstance Win32_ComputerSystem
    $report = [ordered]@{
        Device = [PSCustomObject]@{
            SerialNumber = $serial
            Manufacturer = $cs.Manufacturer
            Model = $cs.Model
            Hostname = $env:COMPUTERNAME
        }
        HardwareHash = try { (Get-CimInstance -Namespace root/cimv2/mdm/dmmap -ClassName MDM_DevDetail_Ext01 -Filter "InstanceID=`"Ext`" AND ParentID=`"./DevDetail`"" -ErrorAction Stop).DeviceHardwareData } catch { "Requires admin and MDM enrollment" }
        DeploymentProfile = Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Provisioning\AutopilotPolicy" -ErrorAction SilentlyContinue | Select-Object CloudAssignedTenantId, CloudAssignedLanguage, CloudAssignedRegion
        OOBESettings = Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Provisioning\OMADM\Accounts\*" -ErrorAction SilentlyContinue | Select-Object -First 1
        ProvisioningLogs = Get-WinEvent -LogName "Microsoft-Windows-Provisioning-Diagnostics-Provider/Admin" -MaxEvents 10 -ErrorAction SilentlyContinue | Select-Object TimeCreated, LevelDisplayName, Message
    }
    if ($ExportCSV) {
        [PSCustomObject]@{
            "Device Serial Number" = $serial
            "Windows Product ID" = (Get-CimInstance Win32_OperatingSystem).SerialNumber
            "Hardware Hash" = $report.HardwareHash
        } | Export-Csv $ExportCSV -NoTypeInformation
        Write-Host "  Exported to: $ExportCSV" -ForegroundColor Green
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Autopilot Info — 2026 Edition]" -ForegroundColor Cyan
    $report.Device | Format-List
    if ($report.DeploymentProfile) { Write-Host "  Deployment Profile:" -ForegroundColor Yellow; $report.DeploymentProfile | Format-List }
    return $report
}

Export-ModuleMember -Function *

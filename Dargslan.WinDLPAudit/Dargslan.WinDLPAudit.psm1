<#
.SYNOPSIS
    Windows Data Loss Prevention audit toolkit
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-DLPAudit {
    <#
    .SYNOPSIS
        Audit Data Loss Prevention policies and endpoint protection
    .DESCRIPTION
        Part of Dargslan.WinDLPAudit (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        BitLockerStatus = Get-BitLockerVolume -ErrorAction SilentlyContinue | Select-Object MountPoint, VolumeStatus, EncryptionMethod, ProtectionStatus
        USBPolicy = [PSCustomObject]@{
            DenyWrite = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\RemovableStorageDevices\{53f5630d-b6bf-11d0-94f2-00a0c91efb8b}" -ErrorAction SilentlyContinue).Deny_Write
            DenyRead = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\RemovableStorageDevices\{53f5630d-b6bf-11d0-94f2-00a0c91efb8b}" -ErrorAction SilentlyContinue).Deny_Read
            DenyExecute = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\RemovableStorageDevices\{53f5630d-b6bf-11d0-94f2-00a0c91efb8b}" -ErrorAction SilentlyContinue).Deny_Execute
        }
        PrintScreen = [PSCustomObject]@{
            SnippingToolPolicy = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\TabletPC" -ErrorAction SilentlyContinue).DisableSnippingTool
            PrintScreenDisabled = (Get-ItemProperty "HKCU:\SOFTWARE\Policies\Microsoft\Windows\Explorer" -ErrorAction SilentlyContinue).DisablePrtScr
        }
        CloudSync = [PSCustomObject]@{
            OneDriveEnabled = Test-Path "$env:ProgramFiles\Microsoft OneDrive\OneDrive.exe"
            OneDrivePolicy = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\OneDrive" -ErrorAction SilentlyContinue).DisableFileSyncNGSC
        }
        EmailDLP = [PSCustomObject]@{
            OutlookPolicy = (Get-ItemProperty "HKCU:\SOFTWARE\Policies\Microsoft\Office\16.0\Outlook\Options\Mail" -ErrorAction SilentlyContinue)
        }
        Warnings = @()
    }
    if (-not $report.USBPolicy.DenyWrite) { $report.Warnings += "USB write access not restricted" }
    $encVols = ($report.BitLockerStatus | Where-Object ProtectionStatus -eq "On" | Measure-Object).Count
    $totalVols = ($report.BitLockerStatus | Measure-Object).Count
    if ($encVols -lt $totalVols) { $report.Warnings += "Not all volumes encrypted ($encVols/$totalVols)" }
    $report.Summary = [PSCustomObject]@{
        EncryptedVolumes = "$encVols/$totalVols"
        USBRestricted = [bool]$report.USBPolicy.DenyWrite
        OneDriveControlled = [bool]$report.CloudSync.OneDrivePolicy
        Warnings = $report.Warnings.Count
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [DLP Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function *

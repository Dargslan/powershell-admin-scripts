<#
.SYNOPSIS
    Windows device encryption audit toolkit — encryption status across all drives, recovery key backup, encryption method, and compliance status
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-DeviceEncryptionAudit {
    <#
    .SYNOPSIS
        Audit device-level encryption status and compliance
    .DESCRIPTION
        Part of Dargslan.WinDeviceEncryption (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        BitLockerVolumes = Get-BitLockerVolume -ErrorAction SilentlyContinue | Select-Object MountPoint, VolumeStatus, EncryptionMethod, EncryptionPercentage, ProtectionStatus, LockStatus, AutoUnlockEnabled, KeyProtector
        EFS = [PSCustomObject]@{
            Service = (Get-Service EFS -ErrorAction SilentlyContinue).Status
            CertCount = (Get-ChildItem Cert:\CurrentUser\My -ErrorAction SilentlyContinue | Where-Object { $_.EnhancedKeyUsageList.FriendlyName -contains "Encrypting File System" } | Measure-Object).Count
        }
        DeviceEncryption = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceEncryption" -ErrorAction SilentlyContinue)
        RecoveryKeys = Get-BitLockerVolume -ErrorAction SilentlyContinue | ForEach-Object {
            $vol = $_.MountPoint
            $_.KeyProtector | Where-Object KeyProtectorType -eq "RecoveryPassword" | Select-Object @{N="Volume";E={$vol}}, KeyProtectorId, KeyProtectorType
        }
        Summary = [PSCustomObject]@{ EncryptedVolumes = 0; TotalVolumes = 0; AllEncrypted = $false; RecoveryKeys = 0 }
    }
    $report.Summary.TotalVolumes = ($report.BitLockerVolumes | Measure-Object).Count
    $report.Summary.EncryptedVolumes = ($report.BitLockerVolumes | Where-Object VolumeStatus -eq "FullyEncrypted" | Measure-Object).Count
    $report.Summary.AllEncrypted = $report.Summary.EncryptedVolumes -eq $report.Summary.TotalVolumes -and $report.Summary.TotalVolumes -gt 0
    $report.Summary.RecoveryKeys = ($report.RecoveryKeys | Measure-Object).Count
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Device Encryption - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.BitLockerVolumes) { $report.BitLockerVolumes | Format-Table MountPoint, VolumeStatus, EncryptionMethod, ProtectionStatus -AutoSize }
    Write-Host "  All Encrypted: $($report.Summary.AllEncrypted)" -ForegroundColor $(if($report.Summary.AllEncrypted){"Green"}else{"Red"})
    return $report
}

Export-ModuleMember -Function *

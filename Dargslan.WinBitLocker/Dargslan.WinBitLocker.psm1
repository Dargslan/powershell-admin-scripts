<#
.SYNOPSIS
    BitLocker drive encryption management toolkit — encryption status, recovery key management, TPM status, and compliance reporting

.DESCRIPTION
    Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-BitLockerReport {
    <#
    .SYNOPSIS
        Generate BitLocker encryption status report
    .DESCRIPTION
        Reports encryption status for all drives, TPM health, recovery key backup status, and compliance.
        Part of Dargslan.WinBitLocker — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $report = [ordered]@{
        TPM = Get-Tpm -ErrorAction SilentlyContinue | Select-Object TpmPresent, TpmReady, TpmEnabled, TpmActivated, TpmOwned, ManufacturerVersion
        Volumes = Get-BitLockerVolume -ErrorAction SilentlyContinue | ForEach-Object {
            [PSCustomObject]@{
                MountPoint = $_.MountPoint; VolumeStatus = $_.VolumeStatus
                ProtectionStatus = $_.ProtectionStatus; EncryptionMethod = $_.EncryptionMethod
                EncryptionPercentage = $_.EncryptionPercentage; LockStatus = $_.LockStatus
                AutoUnlockEnabled = $_.AutoUnlockEnabled; VolumeType = $_.VolumeType
                KeyProtectors = ($_.KeyProtector | ForEach-Object { $_.KeyProtectorType }) -join ", "
                HasRecoveryKey = ($_.KeyProtector | Where-Object KeyProtectorType -eq "RecoveryPassword" | Measure-Object).Count -gt 0
            }
        }
    }
    $report.Compliance = [PSCustomObject]@{
        AllDrivesEncrypted = ($report.Volumes | Where-Object ProtectionStatus -ne "On" | Measure-Object).Count -eq 0
        TPMReady = $report.TPM.TpmReady
        RecoveryKeysPresent = ($report.Volumes | Where-Object HasRecoveryKey | Measure-Object).Count
        Score = 0
    }
    $score = 0
    if ($report.Compliance.AllDrivesEncrypted) { $score += 40 }
    if ($report.Compliance.TPMReady) { $score += 30 }
    if ($report.Compliance.RecoveryKeysPresent -gt 0) { $score += 30 }
    $report.Compliance.Score = $score
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [BitLocker Report]" -ForegroundColor Cyan
    Write-Host "  TPM: $(if($report.TPM.TpmReady){"Ready"}else{"Not Ready"}) | All Encrypted: $($report.Compliance.AllDrivesEncrypted) | Score: $score/100"
    $report.Volumes | Format-Table MountPoint, VolumeStatus, ProtectionStatus, EncryptionMethod, EncryptionPercentage, HasRecoveryKey -AutoSize
    return $report
}

Export-ModuleMember -Function *

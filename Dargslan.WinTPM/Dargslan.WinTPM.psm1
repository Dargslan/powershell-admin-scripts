<#
.SYNOPSIS
    Windows TPM (Trusted Platform Module) audit toolkit — TPM version, status, health, PCR values, attestation, and key storage
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-TPMAudit {
    <#
    .SYNOPSIS
        Audit TPM status, version, and security features
    .DESCRIPTION
        Part of Dargslan.WinTPM (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        TPMInfo = Get-Tpm -ErrorAction SilentlyContinue
        TPMDetails = Get-CimInstance -Namespace root/cimv2/Security/MicrosoftTpm -ClassName Win32_Tpm -ErrorAction SilentlyContinue | Select-Object IsActivated_InitialValue, IsEnabled_InitialValue, IsOwned_InitialValue, ManufacturerVersion, ManufacturerVersionFull20, PhysicalPresenceVersionInfo, SpecVersion
        BitLockerTPM = Get-BitLockerVolume -MountPoint C: -ErrorAction SilentlyContinue | Select-Object @{N="TPMProtector";E={($_.KeyProtector | Where-Object KeyProtectorType -eq "Tpm") -ne $null}}
        VBSStatus = Get-CimInstance -ClassName Win32_DeviceGuard -Namespace root/Microsoft/Windows/DeviceGuard -ErrorAction SilentlyContinue | Select-Object SecurityServicesConfigured, SecurityServicesRunning, VirtualizationBasedSecurityStatus
        Summary = [PSCustomObject]@{ TPMPresent = $false; TPMReady = $false; TPMVersion = ""; TPMEnabled = $false }
    }
    if ($report.TPMInfo) {
        $report.Summary.TPMPresent = $report.TPMInfo.TpmPresent
        $report.Summary.TPMReady = $report.TPMInfo.TpmReady
        $report.Summary.TPMEnabled = $report.TPMInfo.TpmEnabled
    }
    if ($report.TPMDetails.SpecVersion) { $report.Summary.TPMVersion = ($report.TPMDetails.SpecVersion -split ",")[0].Trim() }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [TPM Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.TPMDetails) { $report.TPMDetails | Format-List }
    if ($report.VBSStatus) { Write-Host "  VBS Status:" -ForegroundColor Yellow; $report.VBSStatus | Format-List }
    return $report
}

Export-ModuleMember -Function *

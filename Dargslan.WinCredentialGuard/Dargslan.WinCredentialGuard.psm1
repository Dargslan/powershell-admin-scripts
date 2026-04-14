<#
.SYNOPSIS
    Windows Credential Guard and virtualization-based security audit toolkit — VBS status, HVCI, Secure Boot, and credential isolation verification (2026 Edition)

.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-CredentialGuardStatus {
    <#
    .SYNOPSIS
        Check Credential Guard and VBS security status
    .DESCRIPTION
        Reports virtualization-based security, Credential Guard, HVCI, Secure Boot, and Device Guard status.
        Part of Dargslan.WinCredentialGuard (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $devGuard = Get-CimInstance -ClassName Win32_DeviceGuard -Namespace root/Microsoft/Windows/DeviceGuard -ErrorAction SilentlyContinue
    $report = [ordered]@{
        VBSStatus = [PSCustomObject]@{
            Available = $devGuard.AvailableSecurityProperties -contains 1
            Running = $devGuard.VirtualizationBasedSecurityStatus -eq 2
            SecurityServices = $devGuard.SecurityServicesRunning
            ConfiguredServices = $devGuard.SecurityServicesConfigured
        }
        CredentialGuard = [PSCustomObject]@{
            Configured = $devGuard.SecurityServicesConfigured -contains 1
            Running = $devGuard.SecurityServicesRunning -contains 1
        }
        HVCI = [PSCustomObject]@{
            Configured = $devGuard.SecurityServicesConfigured -contains 2
            Running = $devGuard.SecurityServicesRunning -contains 2
        }
        SecureBoot = Confirm-SecureBootUEFI -ErrorAction SilentlyContinue
        TPM = Get-Tpm -ErrorAction SilentlyContinue | Select-Object TpmPresent, TpmReady, TpmEnabled, ManufacturerVersion
        UEFI = [PSCustomObject]@{
            SecureBoot = try { Confirm-SecureBootUEFI } catch { $false }
            FirmwareType = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\SecureBoot\State" -ErrorAction SilentlyContinue).UEFISecureBootEnabled
        }
    }
    $score = 0; $max = 0
    $checks = @(
        @{Name="VBS Running"; Pass=$report.VBSStatus.Running},
        @{Name="Credential Guard"; Pass=$report.CredentialGuard.Running},
        @{Name="HVCI"; Pass=$report.HVCI.Running},
        @{Name="Secure Boot"; Pass=$report.SecureBoot},
        @{Name="TPM Ready"; Pass=$report.TPM.TpmReady}
    )
    foreach ($c in $checks) { $max += 20; if ($c.Pass) { $score += 20 } }
    $report.SecurityScore = [PSCustomObject]@{ Score = $score; Max = $max; Grade = $(if ($score -ge 80) {"A"} elseif ($score -ge 60) {"B"} elseif ($score -ge 40) {"C"} else {"D"}) }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Credential Guard Audit — 2026 Edition]" -ForegroundColor Cyan
    foreach ($c in $checks) { $icon = if($c.Pass){"[PASS]"}else{"[FAIL]"}; $color = if($c.Pass){"Green"}else{"Red"}; Write-Host "  $icon $($c.Name)" -ForegroundColor $color }
    Write-Host "`n  Score: $score/$max ($($report.SecurityScore.Grade))" -ForegroundColor $(if ($score -ge 80) {"Green"} elseif ($score -ge 40) {"Yellow"} else {"Red"})
    return $report
}

Export-ModuleMember -Function *

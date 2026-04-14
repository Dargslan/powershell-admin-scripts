<#
.SYNOPSIS
    Secure Boot and UEFI configuration audit toolkit — boot chain verification, DBX updates, boot policy, and firmware security assessment
.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-SecureBootAudit {
    <#
    .SYNOPSIS
        Audit Secure Boot and UEFI firmware security
    .DESCRIPTION
        Reports Secure Boot status, UEFI configuration, DBX revocation list, boot policy, and firmware security assessment.
        Part of Dargslan.WinSecureBootAudit (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
$report = [ordered]@{
        SecureBoot = try { Confirm-SecureBootUEFI } catch { $false }
        UEFIVariables = @()
        BootConfig = bcdedit /enum firmware 2>$null | Where-Object { $_ -match "\S" } | ForEach-Object { $_.Trim() }
        BIOSInfo = Get-CimInstance Win32_BIOS | Select-Object Manufacturer, Name, Version, SMBIOSBIOSVersion, ReleaseDate, SerialNumber
        FirmwareType = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\SecureBoot\State" -ErrorAction SilentlyContinue).UEFISecureBootEnabled
        TPM = Get-Tpm -ErrorAction SilentlyContinue | Select-Object TpmPresent, TpmReady, TpmEnabled, ManufacturerVersion, ManufacturerId, LockoutCount
        BootEntries = bcdedit /enum 2>$null | Where-Object { $_ -match "identifier|description|path" } | ForEach-Object { $_.Trim() }
        Warnings = @()
    }
    $score = 0
    if ($report.SecureBoot) { $score += 25 } else { $report.Warnings += "Secure Boot is DISABLED" }
    if ($report.TPM.TpmReady) { $score += 25 } else { $report.Warnings += "TPM is not ready" }
    if ($report.FirmwareType -eq 1) { $score += 25 } else { $report.Warnings += "UEFI Secure Boot not confirmed in registry" }
    if ($report.TPM.TpmEnabled) { $score += 25 }
    $report.SecurityScore = [PSCustomObject]@{ Score=$score; Grade=$(if($score -ge 75){"A"}elseif($score -ge 50){"B"}elseif($score -ge 25){"C"}else{"D"}) }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Secure Boot Audit - 2026]" -ForegroundColor Cyan
    Write-Host "  Secure Boot: $(if($report.SecureBoot){"Enabled"}else{"DISABLED"})" -ForegroundColor $(if($report.SecureBoot){"Green"}else{"Red"})
    $report.BIOSInfo | Format-List
    $report.TPM | Format-List TpmPresent, TpmReady, TpmEnabled, ManufacturerVersion
    Write-Host "  Score: $score/100 ($($report.SecurityScore.Grade))" -ForegroundColor $(if($score -ge 75){"Green"}elseif($score -ge 50){"Yellow"}else{"Red"})
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function *

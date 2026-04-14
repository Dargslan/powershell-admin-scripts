<#
.SYNOPSIS
    LSA Protection and LSASS hardening audit toolkit — RunAsPPL, credential dumping defense, memory protection, and security assessment
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-LSAProtectionStatus {
    <#
    .SYNOPSIS
        Audit LSA Protection and LSASS hardening
    .DESCRIPTION
        Part of Dargslan.WinLSAProtection (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        RunAsPPL = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -ErrorAction SilentlyContinue).RunAsPPL
        LsaCfgFlags = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -ErrorAction SilentlyContinue).LsaCfgFlags
        DisableRestrictedAdmin = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -ErrorAction SilentlyContinue).DisableRestrictedAdmin
        NoLMHash = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -ErrorAction SilentlyContinue).NoLMHash
        LmCompatibilityLevel = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -ErrorAction SilentlyContinue).LmCompatibilityLevel
        WDigest = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest" -ErrorAction SilentlyContinue).UseLogonCredential
        CredentialGuard = (Get-CimInstance -ClassName Win32_DeviceGuard -Namespace root/Microsoft/Windows/DeviceGuard -ErrorAction SilentlyContinue).SecurityServicesRunning -contains 1
        Warnings = @()
    }
    $score = 50
    if ($report.RunAsPPL -eq 1) { $score += 20 } else { $report.Warnings += "LSA Protection (RunAsPPL) is not enabled" }
    if ($report.NoLMHash -eq 1) { $score += 10 } else { $report.Warnings += "LM Hash storage is not disabled" }
    if ($report.WDigest -ne 1) { $score += 10 } else { $report.Warnings += "WDigest plaintext credentials are enabled" }
    if ($report.LmCompatibilityLevel -ge 3) { $score += 10 } else { $report.Warnings += "LM Compatibility level is below recommended (5)" }
    $report.SecurityScore = [PSCustomObject]@{ Score=$score; Grade=$(if($score -ge 80){"A"}elseif($score -ge 60){"B"}else{"C"}) }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [LSA Protection - 2026]" -ForegroundColor Cyan
    Write-Host "  RunAsPPL: $(if($report.RunAsPPL -eq 1){"{0}Enabled{0}" -f [char]39}else{"{0}DISABLED{0}" -f [char]39})" -ForegroundColor $(if($report.RunAsPPL -eq 1){"Green"}else{"Red"})
    Write-Host "  WDigest: $(if($report.WDigest -ne 1){"{0}Secure{0}" -f [char]39}else{"{0}VULNERABLE{0}" -f [char]39})" -ForegroundColor $(if($report.WDigest -ne 1){"Green"}else{"Red"})
    Write-Host "  NoLMHash: $($report.NoLMHash) | LmCompat: $($report.LmCompatibilityLevel)"
    Write-Host "  Score: $score/100 ($($report.SecurityScore.Grade))" -ForegroundColor $(if($score -ge 80){"Green"}elseif($score -ge 60){"Yellow"}else{"Red"})
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function *

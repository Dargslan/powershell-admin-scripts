<#
.SYNOPSIS
    Windows Wi-Fi security audit toolkit — saved profiles, encryption types, open networks, enterprise WPA, and wireless policy compliance
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-WiFiSecurityAudit {
    <#
    .SYNOPSIS
        Audit Wi-Fi security profiles and encryption
    .DESCRIPTION
        Part of Dargslan.WinWiFiSec (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        Profiles = netsh wlan show profiles 2>$null | Where-Object { $_ -match "All User Profile" } | ForEach-Object {
            $name = ($_ -split ":\s+")[1].Trim()
            $detail = netsh wlan show profile name="$name" key=clear 2>$null
            $auth = ($detail | Where-Object { $_ -match "Authentication\s+:" } | Select-Object -First 1) -replace ".*:\s+",""
            $cipher = ($detail | Where-Object { $_ -match "Cipher\s+:" } | Select-Object -First 1) -replace ".*:\s+",""
            [PSCustomObject]@{ Name=$name; Auth=$auth.Trim(); Cipher=$cipher.Trim() }
        }
        Interfaces = netsh wlan show interfaces 2>$null | Where-Object { $_ -match "\S" } | ForEach-Object { $_.Trim() }
        Warnings = @()
    }
    $report.Profiles | Where-Object { $_.Auth -eq "Open" } | ForEach-Object { $report.Warnings += "Open network: $($_.Name)" }
    $report.Summary = [PSCustomObject]@{ TotalProfiles = ($report.Profiles | Measure-Object).Count; OpenNetworks = ($report.Profiles | Where-Object Auth -eq "Open" | Measure-Object).Count }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Wi-Fi Security - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.Profiles) { $report.Profiles | Format-Table -AutoSize }
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function *

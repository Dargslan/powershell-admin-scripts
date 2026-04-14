<#
.SYNOPSIS
    Windows security remediation toolkit — common hardening fixes, quick remediation actions, baseline enforcement, and compliance repair
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-RemediationStatus {
    <#
    .SYNOPSIS
        Check security remediation status and recommendations
    .DESCRIPTION
        Part of Dargslan.WinRemediation (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $checks = @(
        @{Name="UAC Enabled"; Check={((Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -ErrorAction SilentlyContinue).EnableLUA -eq 1)}; Severity="Critical"},
        @{Name="Firewall All Profiles"; Check={(Get-NetFirewallProfile | Where-Object {-not $_.Enabled} | Measure-Object).Count -eq 0}; Severity="Critical"},
        @{Name="Windows Defender Active"; Check={(Get-MpComputerStatus -ErrorAction SilentlyContinue).RealTimeProtectionEnabled}; Severity="Critical"},
        @{Name="SMBv1 Disabled"; Check={-not (Get-SmbServerConfiguration -ErrorAction SilentlyContinue).EnableSMB1Protocol}; Severity="High"},
        @{Name="Guest Account Disabled"; Check={-not (Get-LocalUser Guest -ErrorAction SilentlyContinue).Enabled}; Severity="High"},
        @{Name="Remote Desktop NLA"; Check={(Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" -ErrorAction SilentlyContinue).UserAuthentication -eq 1}; Severity="Medium"},
        @{Name="PowerShell Script Logging"; Check={(Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" -ErrorAction SilentlyContinue).EnableScriptBlockLogging -eq 1}; Severity="Medium"},
        @{Name="WDigest Disabled"; Check={(Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest" -ErrorAction SilentlyContinue).UseLogonCredential -ne 1}; Severity="High"},
        @{Name="Auto-Updates Enabled"; Check={(Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" -ErrorAction SilentlyContinue).AUOptions -ge 3}; Severity="Medium"},
        @{Name="Secure Boot Active"; Check={try{Confirm-SecureBootUEFI}catch{$false}}; Severity="High"}
    )
    $report = [ordered]@{ Results = @(); Passed = 0; Failed = 0; Score = 0 }
    foreach ($c in $checks) {
        $pass = try { & $c.Check } catch { $false }
        $report.Results += [PSCustomObject]@{ Check = $c.Name; Status = if($pass){"PASS"}else{"FAIL"}; Severity = $c.Severity }
        if ($pass) { $report.Passed++ } else { $report.Failed++ }
    }
    $report.Score = [math]::Round($report.Passed / ($report.Passed + $report.Failed) * 100, 0)
    $report.Grade = if($report.Score -ge 80){"A"}elseif($report.Score -ge 60){"B"}elseif($report.Score -ge 40){"C"}else{"D"}
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Security Remediation Status - 2026]" -ForegroundColor Cyan
    foreach ($r in $report.Results) {
        $icon = if($r.Status -eq "PASS"){"[PASS]"}else{"[FAIL]"}
        $color = if($r.Status -eq "PASS"){"Green"}else{if($r.Severity -eq "Critical"){"Red"}else{"Yellow"}}
        Write-Host "  $icon $($r.Check) [$($r.Severity)]" -ForegroundColor $color
    }
    Write-Host "`n  Score: $($report.Score)/100 ($($report.Grade)) | Passed: $($report.Passed)/$($report.Passed + $report.Failed)" -ForegroundColor $(if($report.Score -ge 80){"Green"}elseif($report.Score -ge 60){"Yellow"}else{"Red"})
    return $report
}

Export-ModuleMember -Function *

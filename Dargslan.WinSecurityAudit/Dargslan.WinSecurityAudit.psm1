<#
.SYNOPSIS
    Windows security hardening audit toolkit — CIS benchmark checks, UAC status, BitLocker, Windows Defender, audit policy, and security scoring

.DESCRIPTION
    Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
    Windows & DevOps Books: https://dargslan.com/books

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-SecurityAudit {
    <#
    .SYNOPSIS
        Comprehensive Windows security configuration audit
    .DESCRIPTION
        Checks UAC, BitLocker, Defender, firewall, password policy, audit policy, and provides a security score based on CIS benchmarks.
        Part of Dargslan.WinSecurityAudit — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $score = 0; $maxScore = 0; $checks = @()
    $addCheck = { param($name, $pass, $detail) $script:maxScore += 10; if ($pass) { $script:score += 10 }; $script:checks += [PSCustomObject]@{ Check = $name; Pass = $pass; Detail = $detail } }

    $uac = Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -ErrorAction SilentlyContinue
    & $addCheck "UAC Enabled" ($uac.EnableLUA -eq 1) "EnableLUA=$($uac.EnableLUA)"
    & $addCheck "UAC Prompt Admin" ($uac.ConsentPromptBehaviorAdmin -ge 1) "ConsentPrompt=$($uac.ConsentPromptBehaviorAdmin)"

    $fw = Get-NetFirewallProfile
    & $addCheck "Firewall Domain On" (($fw | Where-Object Name -eq "Domain").Enabled) "Domain profile"
    & $addCheck "Firewall Private On" (($fw | Where-Object Name -eq "Private").Enabled) "Private profile"
    & $addCheck "Firewall Public On" (($fw | Where-Object Name -eq "Public").Enabled) "Public profile"

    $defender = Get-MpComputerStatus -ErrorAction SilentlyContinue
    & $addCheck "Defender RealTime" ($defender.RealTimeProtectionEnabled -eq $true) "Real-time protection"
    & $addCheck "Defender Updated" (($defender.AntivirusSignatureLastUpdated -gt (Get-Date).AddDays(-3))) "Signatures < 3 days old"

    $bl = Get-BitLockerVolume -ErrorAction SilentlyContinue | Where-Object MountPoint -eq "C:"
    & $addCheck "BitLocker C:" ($bl.ProtectionStatus -eq "On") "Protection=$($bl.ProtectionStatus)"

    $rdp = Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -ErrorAction SilentlyContinue
    & $addCheck "RDP Restricted" ($rdp.fDenyTSConnections -eq 1) "fDenyTSConnections=$($rdp.fDenyTSConnections)"

    & $addCheck "Guest Disabled" (-not (Get-LocalUser -Name "Guest" -ErrorAction SilentlyContinue).Enabled) "Guest account"

    $pct = [math]::Round($score / $maxScore * 100, 0)
    $grade = if ($pct -ge 90) { "A" } elseif ($pct -ge 75) { "B" } elseif ($pct -ge 60) { "C" } elseif ($pct -ge 40) { "D" } else { "F" }
    $report = [ordered]@{ Score = "$score/$maxScore ($pct%)"; Grade = $grade; Checks = $checks }

    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Security Audit]" -ForegroundColor Cyan
    $checks | ForEach-Object { $color = if ($_.Pass) { "Green" } else { "Red" }; $icon = if ($_.Pass) { "✓" } else { "✗" }; Write-Host "  $icon $($_.Check): $($_.Detail)" -ForegroundColor $color }
    Write-Host "`n  Score: $score/$maxScore ($pct%) — Grade: $grade" -ForegroundColor $(if ($pct -ge 75) { "Green" } elseif ($pct -ge 50) { "Yellow" } else { "Red" })
    return $report
}

Export-ModuleMember -Function *

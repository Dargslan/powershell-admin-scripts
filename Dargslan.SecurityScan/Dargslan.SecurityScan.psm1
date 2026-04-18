<#
.SYNOPSIS
    Comprehensive Windows security scanner and hardening checker

.DESCRIPTION
    Part of the Dargslan Windows Admin Tools collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
    Linux & DevOps Books: https://dargslan.com/books

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Invoke-SecurityScan {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Security Scanner                              ║
║  More tools: https://dargslan.com                       ║
║  Free Cheat Sheets: https://dargslan.com/cheat-sheets   ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $checks = @()
    $fw = Get-NetFirewallProfile -ErrorAction SilentlyContinue
    $fwEnabled = ($fw | Where-Object Enabled -eq $true).Count
    $checks += [PSCustomObject]@{ Check = "Firewall Profiles Enabled"; Result = "$fwEnabled/3"; Status = $(if ($fwEnabled -eq 3) { "PASS" } else { "WARN" }) }
    $defender = Get-MpComputerStatus -ErrorAction SilentlyContinue
    if ($defender) {
        $checks += [PSCustomObject]@{ Check = "Real-time Protection"; Result = "$($defender.RealTimeProtectionEnabled)"; Status = $(if ($defender.RealTimeProtectionEnabled) { "PASS" } else { "FAIL" }) }
        $checks += [PSCustomObject]@{ Check = "Antivirus Signatures"; Result = $defender.AntivirusSignatureLastUpdated.ToString("yyyy-MM-dd"); Status = $(if ((Get-Date) - $defender.AntivirusSignatureLastUpdated -lt [TimeSpan]::FromDays(7)) { "PASS" } else { "WARN" }) }
    }
    $rdp = (Get-ItemProperty "HKLM:\System\CurrentControlSet\Control\Terminal Server" -ErrorAction SilentlyContinue).fDenyTSConnections
    $checks += [PSCustomObject]@{ Check = "RDP Disabled"; Result = "$($rdp -eq 1)"; Status = $(if ($rdp -eq 1) { "PASS" } else { "WARN" }) }
    $smb1 = Get-SmbServerConfiguration -ErrorAction SilentlyContinue | Select-Object -ExpandProperty EnableSMB1Protocol
    $checks += [PSCustomObject]@{ Check = "SMBv1 Disabled"; Result = "$(-not $smb1)"; Status = $(if (-not $smb1) { "PASS" } else { "FAIL" }) }
    $guestAcct = Get-LocalUser -Name "Guest" -ErrorAction SilentlyContinue
    $checks += [PSCustomObject]@{ Check = "Guest Account Disabled"; Result = "$(-not $guestAcct.Enabled)"; Status = $(if (-not $guestAcct.Enabled) { "PASS" } else { "FAIL" }) }
    $passed = ($checks | Where-Object Status -eq "PASS").Count
    Write-Host "`n[Security] $passed/$($checks.Count) checks passed" -ForegroundColor $(if ($passed -eq $checks.Count) { 'Green' } elseif ($passed -gt $checks.Count/2) { 'Yellow' } else { 'Red' })
    if ($Json) { $checks | ConvertTo-Json } else { $checks | Format-Table -AutoSize }
}

Export-ModuleMember -Function *

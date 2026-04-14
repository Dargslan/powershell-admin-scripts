<#
.SYNOPSIS
    Windows Registry auditing toolkit — registry key analysis, security assessment, startup entries, autorun detection, and registry backup

.DESCRIPTION
    Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-RegistryAudit {
    <#
    .SYNOPSIS
        Audit critical Windows Registry keys for security issues
    .DESCRIPTION
        Scans autorun locations, startup entries, security policies, and identifies suspicious registry modifications.
        Part of Dargslan.WinRegistryAudit — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    Write-Host "`n  [Registry Security Audit]" -ForegroundColor Cyan
    $autorunPaths = @(
        "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run",
        "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce",
        "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run",
        "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce",
        "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices",
        "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run"
    )
    $report = [ordered]@{
        AutorunEntries = @()
        SecurityPolicies = @()
        SuspiciousKeys = @()
    }
    foreach ($path in $autorunPaths) {
        if (Test-Path $path) {
            $entries = Get-ItemProperty $path -ErrorAction SilentlyContinue
            $entries.PSObject.Properties | Where-Object { $_.Name -notmatch "^PS" } | ForEach-Object {
                $report.AutorunEntries += [PSCustomObject]@{
                    Location = $path.Replace("HKLM:\","HKLM\").Replace("HKCU:\","HKCU\")
                    Name = $_.Name
                    Value = $_.Value.ToString().Substring(0, [math]::Min(100, $_.Value.ToString().Length))
                }
            }
        }
    }
    $uac = Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -ErrorAction SilentlyContinue
    $report.SecurityPolicies += [PSCustomObject]@{ Policy = "UAC Enabled"; Value = $uac.EnableLUA; Expected = 1; OK = $uac.EnableLUA -eq 1 }
    $report.SecurityPolicies += [PSCustomObject]@{ Policy = "UAC Admin Consent"; Value = $uac.ConsentPromptBehaviorAdmin; Expected = ">=2"; OK = $uac.ConsentPromptBehaviorAdmin -ge 2 }
    $rdp = Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -ErrorAction SilentlyContinue
    $report.SecurityPolicies += [PSCustomObject]@{ Policy = "RDP Disabled"; Value = $rdp.fDenyTSConnections; Expected = 1; OK = $rdp.fDenyTSConnections -eq 1 }
    $winlogon = Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -ErrorAction SilentlyContinue
    if ($winlogon.AutoAdminLogon -eq "1") { $report.SuspiciousKeys += [PSCustomObject]@{ Key = "Winlogon\AutoAdminLogon"; Risk = "HIGH"; Detail = "Auto-login enabled — credentials may be stored in registry" } }
    if ($winlogon.DefaultPassword) { $report.SuspiciousKeys += [PSCustomObject]@{ Key = "Winlogon\DefaultPassword"; Risk = "CRITICAL"; Detail = "Password stored in plain text in registry" } }
    $lsa = Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -ErrorAction SilentlyContinue
    if ($lsa.LimitBlankPasswordUse -ne 1) { $report.SuspiciousKeys += [PSCustomObject]@{ Key = "Lsa\LimitBlankPasswordUse"; Risk = "HIGH"; Detail = "Blank password network access allowed" } }
    $report.Summary = [PSCustomObject]@{ AutorunCount = $report.AutorunEntries.Count; PolicyChecks = $report.SecurityPolicies.Count; SuspiciousFindings = $report.SuspiciousKeys.Count }
    if ($Json) { return $report | ConvertTo-Json -Depth 4 }
    $report.Summary | Format-List
    Write-Host "  Autorun Entries:" -ForegroundColor Yellow
    $report.AutorunEntries | Format-Table -AutoSize
    Write-Host "  Security Policies:" -ForegroundColor Yellow
    $report.SecurityPolicies | Format-Table -AutoSize
    if ($report.SuspiciousKeys) { Write-Host "  Suspicious Findings:" -ForegroundColor Red; $report.SuspiciousKeys | Format-Table -AutoSize }
    return $report
}

function Export-RegistryBackup {
    <#
    .SYNOPSIS
        Export critical registry keys for backup
    .DESCRIPTION
        Exports important registry branches to .reg files for backup and disaster recovery.
        Part of Dargslan.WinRegistryAudit — https://dargslan.com
    #>
    [CmdletBinding()] param([string]$Path = ".\registry-backup")

    if (-not (Test-Path $Path)) { New-Item -ItemType Directory -Path $Path -Force | Out-Null }
    $timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
    $keys = @(
        @{Name="System"; Key="HKLM\SYSTEM\CurrentControlSet"},
        @{Name="Software"; Key="HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion"},
        @{Name="Security"; Key="HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies"}
    )
    foreach ($k in $keys) {
        $file = Join-Path $Path "$($k.Name)-$timestamp.reg"
        try { reg export $k.Key $file /y 2>$null; Write-Host "  Exported: $($k.Name) -> $file" -ForegroundColor Green }
        catch { Write-Host "  Failed: $($k.Name) — $_" -ForegroundColor Red }
    }
    Write-Host "`n  Backup saved to: $Path" -ForegroundColor Cyan
}

Export-ModuleMember -Function *

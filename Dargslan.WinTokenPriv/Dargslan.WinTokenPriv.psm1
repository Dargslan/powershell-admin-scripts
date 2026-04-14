<#
.SYNOPSIS
    Windows token and privilege audit toolkit — current user privileges, token integrity, UAC bypass detection, and privilege escalation assessment
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-TokenPrivilegeAudit {
    <#
    .SYNOPSIS
        Audit current user token privileges and elevation
    .DESCRIPTION
        Part of Dargslan.WinTokenPriv (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        CurrentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
        IsAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
        IntegrityLevel = whoami /groups 2>$null | Where-Object { $_ -match "Mandatory Label" } | ForEach-Object { ($_ -split "\s{2,}")[-1].Trim() }
        Privileges = whoami /priv 2>$null | Where-Object { $_ -match "Se\w+Privilege" } | ForEach-Object {
            $parts = $_ -split "\s{2,}"
            [PSCustomObject]@{ Privilege = $parts[0].Trim(); Description = $parts[1].Trim(); State = $parts[2].Trim() }
        }
        Groups = whoami /groups 2>$null | Where-Object { $_ -match "^\S" -and $_ -notmatch "GROUP INFORMATION|=|Group Name" } | ForEach-Object {
            $parts = $_ -split "\s{2,}"
            [PSCustomObject]@{ Group = $parts[0].Trim(); Type = $parts[1].Trim() }
        } | Select-Object -First 20
        UACSettings = [PSCustomObject]@{
            EnableLUA = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -ErrorAction SilentlyContinue).EnableLUA
            ConsentPromptBehavior = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -ErrorAction SilentlyContinue).ConsentPromptBehaviorAdmin
            PromptOnSecureDesktop = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -ErrorAction SilentlyContinue).PromptOnSecureDesktop
        }
        DangerousPrivs = @()
    }
    $dangerous = @("SeDebugPrivilege","SeTcbPrivilege","SeBackupPrivilege","SeRestorePrivilege","SeImpersonatePrivilege","SeAssignPrimaryTokenPrivilege","SeLoadDriverPrivilege","SeTakeOwnershipPrivilege")
    $report.DangerousPrivs = $report.Privileges | Where-Object { $_.Privilege -in $dangerous -and $_.State -eq "Enabled" }
    $score = 70
    if ($report.IsAdmin) { $score -= 10 }
    if ($report.DangerousPrivs.Count -gt 3) { $score -= 20 }
    if ($report.UACSettings.EnableLUA -ne 1) { $score -= 20 }
    $report.SecurityScore = [PSCustomObject]@{ Score=[math]::Max(0,$score); Grade=$(if($score -ge 70){"A"}elseif($score -ge 50){"B"}else{"C"}) }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Token Privilege Audit - 2026]" -ForegroundColor Cyan
    Write-Host "  User: $($report.CurrentUser) | Admin: $($report.IsAdmin) | Integrity: $($report.IntegrityLevel)"
    $report.Privileges | Format-Table Privilege, State -AutoSize
    if ($report.DangerousPrivs) { Write-Host "  DANGEROUS privileges enabled:" -ForegroundColor Red; $report.DangerousPrivs | Format-Table Privilege, State -AutoSize }
    Write-Host "  Score: $($report.SecurityScore.Score)/100" -ForegroundColor $(if($score -ge 70){"Green"}else{"Yellow"})
    return $report
}

Export-ModuleMember -Function *

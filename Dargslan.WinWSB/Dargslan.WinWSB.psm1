<#
.SYNOPSIS
    Windows Server Backup audit toolkit — backup schedule, backup history, backup destinations, and recovery catalog status
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-WSBAudit {
    <#
    .SYNOPSIS
        Audit Windows Server Backup configuration and history
    .DESCRIPTION
        Part of Dargslan.WinWSB (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        Feature = Get-WindowsFeature Windows-Server-Backup -ErrorAction SilentlyContinue | Select-Object Name, Installed, InstallState
        Policy = Get-WBPolicy -ErrorAction SilentlyContinue
        Schedule = @()
        BackupTarget = @()
        Summary = [PSCustomObject]@{ Installed = $false; Configured = $false; Schedule = "None" }
    }
    if ($report.Feature.Installed) {
        $report.Summary.Installed = $true
        $policy = Get-WBPolicy -ErrorAction SilentlyContinue
        if ($policy) {
            $report.Summary.Configured = $true
            $report.Schedule = Get-WBSchedule -Policy $policy -ErrorAction SilentlyContinue
            $report.BackupTarget = Get-WBBackupTarget -Policy $policy -ErrorAction SilentlyContinue | Select-Object TargetType, TargetPath, Label
            $report.Summary.Schedule = ($report.Schedule -join ", ")
        }
    }
    $report.BackupHistory = Get-WBSummary -ErrorAction SilentlyContinue | Select-Object LastSuccessfulBackupTime, LastBackupTime, LastBackupTarget, NumberOfVersions, CurrentOperationStatus
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Windows Server Backup - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.BackupHistory) { $report.BackupHistory | Format-List }
    if ($report.BackupTarget) { $report.BackupTarget | Format-Table -AutoSize }
    return $report
}

Export-ModuleMember -Function *

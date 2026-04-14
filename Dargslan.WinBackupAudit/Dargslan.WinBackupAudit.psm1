<#
.SYNOPSIS
    Windows backup auditing toolkit — Windows Server Backup, VSS snapshot monitoring, backup job verification, and recovery point tracking

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

function Get-BackupStatus {
    <#
    .SYNOPSIS
        Check Windows backup and VSS snapshot status
    .DESCRIPTION
        Reports Windows Server Backup status, VSS shadow copies, and backup schedule compliance.
        Part of Dargslan.WinBackupAudit — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $report = [ordered]@{
        ShadowCopies = Get-CimInstance Win32_ShadowCopy -ErrorAction SilentlyContinue | Select-Object InstallDate, VolumeName, @{N="SizeMB";E={[math]::Round($_.Count/1MB,1)}}
        ShadowCopyCount = (Get-CimInstance Win32_ShadowCopy -ErrorAction SilentlyContinue | Measure-Object).Count
        BackupTasks = Get-ScheduledTask -TaskPath "\Microsoft\Windows\Backup\*" -ErrorAction SilentlyContinue | Select-Object TaskName, State, @{N="LastRun";E={($_ | Get-ScheduledTaskInfo).LastRunTime}}
        WbadminStatus = try { $out = wbadmin get status 2>&1; $out -join "`n" | Select-Object -First 500 } catch { "WBAdmin not available" }
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Backup Status]" -ForegroundColor Cyan
    Write-Host "  Shadow Copies: $($report.ShadowCopyCount)"
    if ($report.ShadowCopies) { $report.ShadowCopies | Format-Table -AutoSize }
    return $report
}

Export-ModuleMember -Function *

<#
.SYNOPSIS
    Windows Task Scheduler management toolkit — task inventory, failed task detection, trigger analysis, and task creation helpers

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

function Get-ScheduledTaskAudit {
    <#
    .SYNOPSIS
        Audit all scheduled tasks for issues
    .DESCRIPTION
        Lists all scheduled tasks, identifies failed tasks, disabled tasks, and tasks running as SYSTEM.
        Part of Dargslan.WinScheduler — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $tasks = Get-ScheduledTask
    $report = [ordered]@{
        Summary = [PSCustomObject]@{ Total = $tasks.Count; Ready = ($tasks | Where-Object State -eq "Ready").Count; Running = ($tasks | Where-Object State -eq "Running").Count; Disabled = ($tasks | Where-Object State -eq "Disabled").Count }
        Failed = $tasks | Where-Object State -eq "Ready" | ForEach-Object { $info = $_ | Get-ScheduledTaskInfo -ErrorAction SilentlyContinue; if ($info.LastTaskResult -ne 0 -and $info.LastTaskResult -ne 267009) { [PSCustomObject]@{ Name = $_.TaskName; Path = $_.TaskPath; LastResult = $info.LastTaskResult; LastRun = $info.LastRunTime } } }
        SystemTasks = $tasks | Where-Object { $_.Principal.UserId -match "SYSTEM|Administrator" -and $_.Principal.RunLevel -eq "Highest" } | Select-Object TaskName, TaskPath, State, @{N="RunAs";E={$_.Principal.UserId}}
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Scheduled Task Audit]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.Failed) { Write-Host "  Failed Tasks:" -ForegroundColor Red; $report.Failed | Format-Table -AutoSize }
    return $report
}

Export-ModuleMember -Function *

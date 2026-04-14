<#
.SYNOPSIS
    Manage Windows scheduled task timers and triggers

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

function Get-TaskTimers {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Systemd Timer
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $tasks = Get-ScheduledTask -ErrorAction SilentlyContinue | Where-Object State -eq "Ready"; $results = foreach ($t in $tasks) { $info = $t | Get-ScheduledTaskInfo -ErrorAction SilentlyContinue; if ($info.NextRunTime -and $info.NextRunTime -gt (Get-Date)) { [PSCustomObject]@{Task=$t.TaskName; NextRun=$info.NextRunTime; LastRun=$info.LastRunTime; LastResult=$info.LastTaskResult} } }; $results = $results | Sort-Object NextRun | Select-Object -First 20; Write-Host "`n[Upcoming Tasks]" -ForegroundColor Yellow; $results | Format-Table -AutoSize
}


Export-ModuleMember -Function *

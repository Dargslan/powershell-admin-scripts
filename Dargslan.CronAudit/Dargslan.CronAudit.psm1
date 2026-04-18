<#
.SYNOPSIS
    Audit Windows Task Scheduler tasks and scheduled jobs

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

function Get-ScheduledTaskAudit {
    [CmdletBinding()]
    param([switch]$EnabledOnly, [switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Scheduled Task Auditor                        ║
║  More tools: https://dargslan.com                       ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $tasks = Get-ScheduledTask -ErrorAction SilentlyContinue
    if ($EnabledOnly) { $tasks = $tasks | Where-Object State -eq 'Ready' }
    $results = $tasks | ForEach-Object {
        $info = $_ | Get-ScheduledTaskInfo -ErrorAction SilentlyContinue
        [PSCustomObject]@{ Name = $_.TaskName; Path = $_.TaskPath; State = $_.State; LastRun = $info.LastRunTime; LastResult = $info.LastTaskResult; NextRun = $info.NextRunTime }
    }
    Write-Host "`n[Tasks] Total: $($results.Count) | Enabled: $(($tasks | Where-Object State -eq 'Ready').Count)" -ForegroundColor Yellow
    if ($Json) { $results | ConvertTo-Json } else { $results | Format-Table -AutoSize }
}

Export-ModuleMember -Function *

<#
.SYNOPSIS
    Manage Windows scheduled tasks and at-jobs

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

function Get-ScheduledJobs {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan At Scheduler
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $tasks = Get-ScheduledTask -ErrorAction SilentlyContinue | Where-Object State -ne "Disabled" | Select-Object TaskName, TaskPath, State, @{N="Author";E={$_.Principal.UserId}} | Sort-Object TaskPath; Write-Host "`n[Scheduled Tasks] $($tasks.Count) active tasks" -ForegroundColor Yellow; if ($Json) { $tasks | ConvertTo-Json } else { $tasks | Format-Table -AutoSize }
}


Export-ModuleMember -Function *

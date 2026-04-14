<#
.SYNOPSIS
    Parse and validate Windows scheduled task triggers

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

function Get-TaskTriggerReport {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Cron Parser
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $tasks = Get-ScheduledTask -ErrorAction SilentlyContinue | Where-Object State -eq "Ready"; $results = foreach ($t in $tasks) { $triggers = $t.Triggers | ForEach-Object { $_.ToString() }; [PSCustomObject]@{Task=$t.TaskName; Triggers=($triggers -join "; "); State=$t.State} }; if ($Json) { $results | ConvertTo-Json } else { $results | Format-Table -AutoSize -Wrap }
}


Export-ModuleMember -Function *

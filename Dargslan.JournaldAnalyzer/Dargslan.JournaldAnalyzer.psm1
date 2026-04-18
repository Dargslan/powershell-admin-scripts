<#
.SYNOPSIS
    Analyze Windows Event Log patterns and anomalies

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

function Get-EventLogAnalysis {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Journald Analyzer
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $logs = @("Application","System","Security"); foreach ($log in $logs) { $events = Get-WinEvent -LogName $log -MaxEvents 100 -ErrorAction SilentlyContinue; $errors = ($events | Where-Object Level -le 2).Count; Write-Host "`n[$log] Total: $($events.Count) | Errors/Critical: $errors" -ForegroundColor $(if ($errors -gt 10) {"Red"} elseif ($errors -gt 0) {"Yellow"} else {"Green"}) }
}


Export-ModuleMember -Function *

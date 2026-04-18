<#
.SYNOPSIS
    Parse and analyze Windows event log files

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

function Get-LogSummary {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Log Parser
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $logs = @("Application","System","Security"); $results = foreach ($log in $logs) { $events = Get-WinEvent -LogName $log -MaxEvents 500 -ErrorAction SilentlyContinue; $levels = $events | Group-Object LevelDisplayName; [PSCustomObject]@{Log=$log; Total=$events.Count; Errors=($levels|Where-Object Name -eq "Error").Count; Warnings=($levels|Where-Object Name -eq "Warning").Count; Critical=($levels|Where-Object Name -eq "Critical").Count} }; if ($Json) { $results | ConvertTo-Json } else { $results | Format-Table -AutoSize }
}


Export-ModuleMember -Function *

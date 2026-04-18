<#
.SYNOPSIS
    Generate statistics from Windows event logs

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

function Get-LogStatistics {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Log Stats
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $logs = @("Application","System"); foreach ($log in $logs) { $events = Get-WinEvent -LogName $log -MaxEvents 1000 -ErrorAction SilentlyContinue; Write-Host "`n[$log Log Statistics]" -ForegroundColor Yellow; $events | Group-Object ProviderName | Sort-Object Count -Descending | Select-Object -First 10 @{N="Source";E={$_.Name}}, Count | Format-Table -AutoSize }
}


Export-ModuleMember -Function *

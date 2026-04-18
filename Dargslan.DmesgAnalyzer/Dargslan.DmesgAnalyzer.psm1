<#
.SYNOPSIS
    Analyze Windows system and boot event logs

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

function Get-SystemEventReport {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Dmesg Analyzer
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $events = Get-WinEvent -LogName System -MaxEvents 100 -ErrorAction SilentlyContinue | Where-Object { $_.LevelDisplayName -match "Error|Warning|Critical" }; $summary = $events | Group-Object LevelDisplayName | Select-Object Name, Count; Write-Host "`n[System Events] Recent errors/warnings:" -ForegroundColor Yellow; $summary | Format-Table -AutoSize; $events | Select-Object -First 20 TimeCreated, LevelDisplayName, @{N="Message";E={($_.Message -split "`n")[0].Substring(0,[Math]::Min(80,($_.Message -split "`n")[0].Length))}} | Format-Table -AutoSize
}


Export-ModuleMember -Function *

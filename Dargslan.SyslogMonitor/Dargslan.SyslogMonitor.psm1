<#
.SYNOPSIS
    Monitor Windows event log sources in real-time

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

function Watch-EventLog {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Syslog Monitor
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    param([string]$LogName = "System", [int]$Tail = 20) ; $events = Get-WinEvent -LogName $LogName -MaxEvents $Tail -ErrorAction SilentlyContinue | Select-Object TimeCreated, LevelDisplayName, ProviderName, @{N="Message";E={($_.Message -split "`n")[0].Substring(0,[Math]::Min(100,($_.Message -split "`n")[0].Length))}}; Write-Host "`n[$LogName] Last $Tail events:" -ForegroundColor Yellow; $events | Format-Table -AutoSize
}


Export-ModuleMember -Function *

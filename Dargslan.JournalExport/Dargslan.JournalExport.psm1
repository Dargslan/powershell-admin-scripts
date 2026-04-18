<#
.SYNOPSIS
    Export Windows Event Log entries to various formats

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

function Export-EventLogs {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Journal Export
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $logName = "System"; $outFile = Join-Path $PWD "eventlog-$logName-$(Get-Date -Format yyyyMMdd).csv"; $events = Get-WinEvent -LogName $logName -MaxEvents 1000 -ErrorAction SilentlyContinue | Select-Object TimeCreated, Id, LevelDisplayName, ProviderName, @{N="Message";E={($_.Message -split "`n")[0]}}; $events | Export-Csv -Path $outFile -NoTypeInformation; Write-Host "`n[Export] $($events.Count) events from $logName to $outFile" -ForegroundColor Green
}


Export-ModuleMember -Function *

<#
.SYNOPSIS
    Track and alert on suspicious login patterns

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

function Get-LoginTracker {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Login Tracker
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $failed = Get-WinEvent -FilterHashtable @{LogName="Security"; Id=4625} -MaxEvents 100 -ErrorAction SilentlyContinue; $byAccount = $failed | Group-Object { $_.Properties[5].Value } | Sort-Object Count -Descending; Write-Host "`n[Login Tracker] Failed attempts by account:" -ForegroundColor Yellow; $byAccount | Select-Object @{N="Account";E={$_.Name}}, Count, @{N="LastAttempt";E={$_.Group[0].TimeCreated}} | Format-Table -AutoSize
}


Export-ModuleMember -Function *

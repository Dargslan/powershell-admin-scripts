<#
.SYNOPSIS
    Audit user last login times and login history

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

function Get-LastLogonReport {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Lastlog Audit
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $users = Get-LocalUser | Select-Object Name, Enabled, LastLogon, PasswordLastSet, @{N="DaysSinceLogin";E={if($_.LastLogon){[math]::Round(((Get-Date)-$_.LastLogon).TotalDays,0)}else{"Never"}}}; Write-Host "`n[Last Logon Audit]" -ForegroundColor Yellow; if ($Json) { $users | ConvertTo-Json } else { $users | Format-Table -AutoSize }
}


Export-ModuleMember -Function *

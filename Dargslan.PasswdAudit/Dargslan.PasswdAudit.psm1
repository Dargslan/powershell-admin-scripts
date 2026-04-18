<#
.SYNOPSIS
    Audit local user password policies and expiration

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

function Get-PasswordAudit {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Passwd Audit
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $users = Get-LocalUser | Select-Object Name, Enabled, PasswordRequired, PasswordLastSet, PasswordExpires, @{N="PasswordAge";E={if($_.PasswordLastSet){[math]::Round(((Get-Date)-$_.PasswordLastSet).TotalDays,0)}else{"N/A"}}}; Write-Host "`n[Password Audit]" -ForegroundColor Yellow; if ($Json) { $users | ConvertTo-Json } else { $users | Format-Table -AutoSize }
}


Export-ModuleMember -Function *

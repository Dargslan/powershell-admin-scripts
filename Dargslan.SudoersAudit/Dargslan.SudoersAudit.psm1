<#
.SYNOPSIS
    Audit local administrator group membership and privileges

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

function Get-AdminAudit {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Sudoers Audit
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $admins = Get-LocalGroupMember -Group "Administrators" -ErrorAction SilentlyContinue; Write-Host "`n[Administrators Group] $($admins.Count) member(s):" -ForegroundColor Yellow; $admins | Select-Object Name, ObjectClass, PrincipalSource | Format-Table -AutoSize; $powerUsers = Get-LocalGroupMember -Group "Power Users" -ErrorAction SilentlyContinue; if ($powerUsers) { Write-Host "[Power Users] $($powerUsers.Count) member(s):" -ForegroundColor Yellow; $powerUsers | Format-Table -AutoSize }
}


Export-ModuleMember -Function *

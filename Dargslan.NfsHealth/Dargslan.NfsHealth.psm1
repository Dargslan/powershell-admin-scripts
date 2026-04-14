<#
.SYNOPSIS
    Check SMB/CIFS share health and NFS client status

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

function Get-ShareHealth {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Nfs Health
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $shares = Get-SmbShare -ErrorAction SilentlyContinue | Where-Object Name -notlike "*$"; Write-Host "`n[SMB Shares]" -ForegroundColor Yellow; $shares | Select-Object Name, Path, Description | Format-Table -AutoSize; $sessions = Get-SmbSession -ErrorAction SilentlyContinue; Write-Host "[Active Sessions] $($sessions.Count)" -ForegroundColor Yellow
}


Export-ModuleMember -Function *

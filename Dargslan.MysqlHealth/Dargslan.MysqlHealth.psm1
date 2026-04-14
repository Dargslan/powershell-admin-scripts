<#
.SYNOPSIS
    Check MySQL/MariaDB database server health on Windows

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

function Test-MySqlHealth {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Mysql Health
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $mysql = Get-Command mysql -ErrorAction SilentlyContinue; if (-not $mysql) { Write-Host "MySQL client not found" -ForegroundColor Red; return }; $svc = Get-Service -Name "MySQL*" -ErrorAction SilentlyContinue; if ($svc) { Write-Host "`n[MySQL Service] $($svc.Name): $($svc.Status)" -ForegroundColor $(if($svc.Status-eq"Running"){"Green"}else{"Red"}) }; Write-Host "`n[MySQL Version]" -ForegroundColor Yellow; mysql --version 2>$null
}


Export-ModuleMember -Function *

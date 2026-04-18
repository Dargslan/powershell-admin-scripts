<#
.SYNOPSIS
    Check PostgreSQL database server health on Windows

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

function Test-PostgresHealth {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Postgres Health
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $pg = Get-Command psql -ErrorAction SilentlyContinue; if (-not $pg) { Write-Host "PostgreSQL client not found" -ForegroundColor Red; return }; $svc = Get-Service -Name "postgresql*" -ErrorAction SilentlyContinue; if ($svc) { foreach ($s in $svc) { Write-Host "`n[PostgreSQL] $($s.Name): $($s.Status)" -ForegroundColor $(if($s.Status-eq"Running"){"Green"}else{"Red"}) } }; Write-Host "`n[Version]" -ForegroundColor Yellow; psql --version 2>$null
}


Export-ModuleMember -Function *

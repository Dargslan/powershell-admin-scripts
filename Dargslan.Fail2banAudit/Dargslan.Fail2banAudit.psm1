<#
.SYNOPSIS
    Audit Windows account lockout policies and blocked IPs

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

function Get-LockoutReport {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Fail2ban Audit
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $policy = net accounts 2>$null; Write-Host "`n[Account Lockout Policy]" -ForegroundColor Yellow; $policy | ForEach-Object { Write-Host "  $_" }; $lockouts = Get-WinEvent -FilterHashtable @{LogName="Security"; Id=4740} -MaxEvents 20 -ErrorAction SilentlyContinue; if ($lockouts) { Write-Host "`n[Recent Lockouts] $($lockouts.Count) event(s):" -ForegroundColor Red; $lockouts | Select-Object TimeCreated, @{N="Account";E={$_.Properties[0].Value}}, @{N="Source";E={$_.Properties[1].Value}} | Format-Table -AutoSize } else { Write-Host "`nNo recent lockouts" -ForegroundColor Green }
}


Export-ModuleMember -Function *

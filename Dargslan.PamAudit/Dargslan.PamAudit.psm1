<#
.SYNOPSIS
    Audit Windows authentication policies and credential providers

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

function Get-AuthPolicyAudit {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Pam Audit
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $policy = net accounts 2>$null; Write-Host "`n[Authentication Policy]" -ForegroundColor Yellow; $policy | ForEach-Object { Write-Host "  $_" }; $credProviders = Get-ChildItem "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\Credential Providers" -ErrorAction SilentlyContinue; Write-Host "`n[Credential Providers] $($credProviders.Count) registered" -ForegroundColor Cyan
}


Export-ModuleMember -Function *

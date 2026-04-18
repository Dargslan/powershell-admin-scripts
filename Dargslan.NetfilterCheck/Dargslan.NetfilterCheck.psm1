<#
.SYNOPSIS
    Check Windows Filtering Platform and network filter status

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

function Get-NetworkFilterStatus {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Netfilter Check
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $profiles = Get-NetFirewallProfile; foreach ($p in $profiles) { Write-Host "`n[$($p.Name) Profile]" -ForegroundColor Yellow; Write-Host "  Enabled: $($p.Enabled)"; Write-Host "  Inbound: $($p.DefaultInboundAction)"; Write-Host "  Outbound: $($p.DefaultOutboundAction)"; Write-Host "  Log Allowed: $($p.LogAllowed)"; Write-Host "  Log Blocked: $($p.LogBlocked)" }
}


Export-ModuleMember -Function *

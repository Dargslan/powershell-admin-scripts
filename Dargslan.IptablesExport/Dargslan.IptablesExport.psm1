<#
.SYNOPSIS
    Export Windows Firewall rules to file for backup

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

function Export-FirewallRules {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Iptables Export
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $outFile = Join-Path $PWD "firewall-rules-$(Get-Date -Format yyyyMMdd).csv"; $rules = Get-NetFirewallRule | Select-Object DisplayName, Direction, Action, Enabled, Profile; $rules | Export-Csv -Path $outFile -NoTypeInformation; Write-Host "`n[Export] $($rules.Count) rules exported to $outFile" -ForegroundColor Green
}


Export-ModuleMember -Function *

<#
.SYNOPSIS
    Check NIC teaming and network adapter bonding configuration

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

function Get-NicTeamStatus {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Bonding Check
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $teams = Get-NetLbfoTeam -ErrorAction SilentlyContinue; if ($teams) { $results = $teams | Select-Object Name, Status, TeamingMode, LoadBalancingAlgorithm, @{N="Members";E={($_ | Get-NetLbfoTeamMember).Name -join ", "}}; if ($Json) { $results | ConvertTo-Json } else { $results | Format-Table -AutoSize } } else { Write-Host "No NIC teams configured" -ForegroundColor Yellow }
}


Export-ModuleMember -Function *

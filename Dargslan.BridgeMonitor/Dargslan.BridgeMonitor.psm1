<#
.SYNOPSIS
    Monitor Hyper-V virtual switches and bridge configurations

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

function Get-VirtualSwitchReport {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Bridge Monitor
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $switches = Get-VMSwitch -ErrorAction SilentlyContinue; if ($switches) { $switches | Select-Object Name, SwitchType, NetAdapterInterfaceDescription, @{N="VMs";E={(Get-VMNetworkAdapter -SwitchName $_.Name -ErrorAction SilentlyContinue).Count}} | Format-Table -AutoSize } else { Write-Host "Hyper-V not available or no virtual switches" -ForegroundColor Yellow }
}


Export-ModuleMember -Function *

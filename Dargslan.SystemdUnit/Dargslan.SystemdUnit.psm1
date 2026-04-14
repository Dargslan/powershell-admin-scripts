<#
.SYNOPSIS
    Manage Windows services configuration and dependencies

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

function Get-ServiceDetails {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Systemd Unit
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    param([string]$Name = "") ; if ($Name) { $svc = Get-Service -Name $Name -ErrorAction SilentlyContinue; if ($svc) { $svc | Select-Object Name, DisplayName, Status, StartType, @{N="DependsOn";E={($_.ServicesDependedOn.Name -join ", ")}}, @{N="DependedBy";E={(Get-Service -Name $Name -DependentServices -ErrorAction SilentlyContinue).Name -join ", "}} | Format-List } else { Write-Host "Service not found: $Name" -ForegroundColor Red } } else { Get-Service | Where-Object StartType -eq "Automatic" | Select-Object Name, DisplayName, Status | Sort-Object Status, Name | Format-Table -AutoSize }
}


Export-ModuleMember -Function *

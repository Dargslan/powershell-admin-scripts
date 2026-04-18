<#
.SYNOPSIS
    Check Windows driver loading and device manager status

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

function Get-DriverStatus {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Modprobe Check
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $problems = Get-CimInstance Win32_PnPEntity | Where-Object { $_.ConfigManagerErrorCode -ne 0 }; if ($problems) { Write-Host "`n[Driver Issues] $($problems.Count) device(s) with problems:" -ForegroundColor Red; $problems | Select-Object Name, @{N="Error";E={$_.ConfigManagerErrorCode}}, Status | Format-Table -AutoSize } else { Write-Host "`nAll devices OK" -ForegroundColor Green }; $drivers = Get-CimInstance Win32_SystemDriver | Where-Object State -ne "Running" | Where-Object StartMode -eq "Auto"; if ($drivers.Count -gt 0) { Write-Host "`n[Stopped Auto-Start Drivers] $($drivers.Count):" -ForegroundColor Yellow; $drivers | Select-Object Name, State, StartMode | Format-Table -AutoSize }
}


Export-ModuleMember -Function *

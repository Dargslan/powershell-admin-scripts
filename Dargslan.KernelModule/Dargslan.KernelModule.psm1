<#
.SYNOPSIS
    List loaded drivers and kernel modules on Windows

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

function Get-DriverReport {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Kernel Module
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $drivers = Get-CimInstance Win32_SystemDriver | Select-Object Name, DisplayName, State, StartMode, PathName | Sort-Object State, Name; $running = ($drivers | Where-Object State -eq "Running").Count; Write-Host "`n[Drivers] Total: $($drivers.Count) | Running: $running" -ForegroundColor Yellow; if ($Json) { $drivers | ConvertTo-Json } else { $drivers | Select-Object -First 30 | Format-Table -AutoSize }
}


Export-ModuleMember -Function *

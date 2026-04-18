<#
.SYNOPSIS
    Analyze Windows boot time and startup performance

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

function Get-BootAnalysis {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Systemd Analyze
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $os = Get-CimInstance Win32_OperatingSystem; $bootTime = $os.LastBootUpTime; $uptime = (Get-Date) - $bootTime; Write-Host "`n[Boot Analysis]" -ForegroundColor Yellow; Write-Host "  Last Boot: $($bootTime.ToString("yyyy-MM-dd HH:mm:ss"))"; Write-Host "  Uptime: $($uptime.Days)d $($uptime.Hours)h $($uptime.Minutes)m"; $startups = Get-CimInstance Win32_StartupCommand -ErrorAction SilentlyContinue; if ($startups) { Write-Host "`n[Startup Programs] $($startups.Count):" -ForegroundColor Yellow; $startups | Select-Object Name, Command, Location | Format-Table -AutoSize }
}


Export-ModuleMember -Function *

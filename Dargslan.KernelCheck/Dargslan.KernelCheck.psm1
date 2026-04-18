<#
.SYNOPSIS
    Check Windows kernel version and installed hotfixes

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

function Get-KernelReport {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Kernel Check
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $os = Get-CimInstance Win32_OperatingSystem; $hotfixes = Get-HotFix | Sort-Object InstalledOn -Descending | Select-Object -First 10; Write-Host "`n[Kernel/OS]" -ForegroundColor Yellow; [PSCustomObject]@{Version=$os.Version; Build=$os.BuildNumber; ServicePack=$os.ServicePackMajorVersion; Architecture=$os.OSArchitecture; InstallDate=$os.InstallDate.ToString("yyyy-MM-dd"); LastBoot=$os.LastBootUpTime.ToString("yyyy-MM-dd HH:mm")} | Format-List; Write-Host "[Recent Hotfixes]" -ForegroundColor Yellow; $hotfixes | Select-Object HotFixID, Description, InstalledOn | Format-Table -AutoSize
}


Export-ModuleMember -Function *

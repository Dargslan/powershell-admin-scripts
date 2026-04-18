<#
.SYNOPSIS
    Review Windows package installation and update history

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

function Get-InstallHistory {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Yum History
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $updates = Get-HotFix | Sort-Object InstalledOn -Descending; $installed = Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*" -ErrorAction SilentlyContinue | Where-Object { $_.InstallDate } | Sort-Object InstallDate -Descending | Select-Object -First 20 DisplayName, DisplayVersion, InstallDate; Write-Host "`n[Recent Updates]" -ForegroundColor Yellow; $updates | Select-Object -First 10 HotFixID, Description, InstalledOn | Format-Table -AutoSize; Write-Host "[Recently Installed Software]" -ForegroundColor Yellow; $installed | Format-Table -AutoSize
}


Export-ModuleMember -Function *

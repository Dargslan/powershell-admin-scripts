<#
.SYNOPSIS
    Complete Windows sysadmin toolkit — all Dargslan tools in one module

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

function Show-DargslanToolkit {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Toolkit
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    Write-Host "`n  Available Dargslan Tools:" -ForegroundColor Yellow; Write-Host "  ========================" -ForegroundColor Yellow; Write-Host "  Visit https://dargslan.com for documentation"; Write-Host "  Free Cheat Sheets: https://dargslan.com/cheat-sheets"; Write-Host "  Linux Books: https://dargslan.com/books`n"; $modules = Get-Module -Name "Dargslan.*" -ListAvailable | Select-Object Name, Version, @{N="Description";E={$_.Description.Substring(0,[Math]::Min(60,$_.Description.Length))}}; if ($modules) { $modules | Format-Table -AutoSize } else { Write-Host "  Install individual Dargslan modules from PowerShell Gallery:" -ForegroundColor Cyan; Write-Host "  Install-Module Dargslan.SysInfo" }
}


Export-ModuleMember -Function *

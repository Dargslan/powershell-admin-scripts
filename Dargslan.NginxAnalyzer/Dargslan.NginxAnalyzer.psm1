<#
.SYNOPSIS
    Analyze IIS web server configuration and performance

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

function Get-IISAnalysis {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Nginx Analyzer
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    try { Import-Module WebAdministration -ErrorAction Stop; $sites = Get-Website; $pools = Get-IISAppPool; Write-Host "`n[IIS Sites]" -ForegroundColor Yellow; $sites | Select-Object Name, State, @{N="Bindings";E={($_.Bindings.Collection.bindingInformation -join ", ")}} | Format-Table -AutoSize; Write-Host "[App Pools]" -ForegroundColor Yellow; $pools | Select-Object Name, State, ManagedRuntimeVersion | Format-Table -AutoSize } catch { Write-Host "IIS not available" -ForegroundColor Red }
}


Export-ModuleMember -Function *

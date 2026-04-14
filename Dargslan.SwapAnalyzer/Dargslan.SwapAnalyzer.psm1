<#
.SYNOPSIS
    Analyze Windows page file configuration and usage

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

function Get-PageFileReport {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Swap Analyzer
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $pf = Get-CimInstance Win32_PageFileUsage -ErrorAction SilentlyContinue; if ($pf) { $pf | Select-Object Name, @{N="AllocatedMB";E={$_.AllocatedBaseSize}}, @{N="UsedMB";E={$_.CurrentUsage}}, @{N="PeakMB";E={$_.PeakUsage}}, @{N="Used%";E={if($_.AllocatedBaseSize -gt 0){[math]::Round($_.CurrentUsage/$_.AllocatedBaseSize*100,1)}else{0}}} | Format-Table -AutoSize } else { Write-Host "No page file configured" -ForegroundColor Yellow }
}


Export-ModuleMember -Function *

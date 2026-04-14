<#
.SYNOPSIS
    Check NUMA topology and memory node configuration

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

function Get-NumaTopology {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Numa Check
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $proc = Get-CimInstance Win32_Processor; $numa = $proc | Select-Object SocketDesignation, NumberOfCores, NumberOfLogicalProcessors, @{N="L2CacheMB";E={[math]::Round($_.L2CacheSize/1024,1)}}, @{N="L3CacheMB";E={[math]::Round($_.L3CacheSize/1024,1)}}; Write-Host "`n[NUMA/CPU Topology]" -ForegroundColor Yellow; $numa | Format-List
}


Export-ModuleMember -Function *

<#
.SYNOPSIS
    Profile memory usage and detect memory leaks

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

function Get-MemoryProfile {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Memory Profiler
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $os = Get-CimInstance Win32_OperatingSystem; $totalGB = [math]::Round($os.TotalVisibleMemorySize/1MB,1); $freeGB = [math]::Round($os.FreePhysicalMemory/1MB,1); Write-Host "`n[Memory Profile] Total: ${totalGB}GB | Free: ${freeGB}GB | Used: $([math]::Round($totalGB-$freeGB,1))GB" -ForegroundColor Yellow; $topMem = Get-Process | Sort-Object WorkingSet64 -Descending | Select-Object -First 15 ProcessName, Id, @{N="WorkingSetMB";E={[math]::Round($_.WorkingSet64/1MB,1)}}, @{N="PrivateMB";E={[math]::Round($_.PrivateMemorySize64/1MB,1)}}, @{N="VirtualMB";E={[math]::Round($_.VirtualMemorySize64/1MB,1)}}; $topMem | Format-Table -AutoSize
}


Export-ModuleMember -Function *

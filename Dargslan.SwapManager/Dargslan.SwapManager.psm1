<#
.SYNOPSIS
    Manage Windows virtual memory and page file settings

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

function Get-VirtualMemoryConfig {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Swap Manager
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $pf = Get-CimInstance Win32_PageFileSetting -ErrorAction SilentlyContinue; $os = Get-CimInstance Win32_OperatingSystem; Write-Host "`n[Virtual Memory]" -ForegroundColor Yellow; Write-Host "  Total Physical: $([math]::Round($os.TotalVisibleMemorySize/1MB,1)) GB"; Write-Host "  Total Virtual: $([math]::Round($os.TotalVirtualMemorySize/1MB,1)) GB"; Write-Host "  Free Physical: $([math]::Round($os.FreePhysicalMemory/1MB,1)) GB"; Write-Host "  Free Virtual: $([math]::Round($os.FreeVirtualMemory/1MB,1)) GB"; if ($pf) { Write-Host "`n[Page File Settings]" -ForegroundColor Yellow; $pf | Select-Object Name, InitialSize, MaximumSize | Format-Table -AutoSize }
}


Export-ModuleMember -Function *

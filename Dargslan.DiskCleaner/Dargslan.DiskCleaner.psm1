<#
.SYNOPSIS
    Clean temporary files and reclaim disk space

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

function Invoke-DiskCleanup {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Disk Cleaner
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $paths = @($env:TEMP, "$env:SystemRoot\Temp", "$env:LOCALAPPDATA\Temp"); $totalFreed = 0; foreach ($p in $paths) { if (Test-Path $p) { $files = Get-ChildItem $p -Recurse -File -ErrorAction SilentlyContinue | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-7) }; $size = ($files | Measure-Object Length -Sum).Sum; $totalFreed += $size; Write-Host "  $p : $($files.Count) old files ($([math]::Round($size/1MB,1)) MB)" -ForegroundColor Yellow } }; Write-Host "`n[Cleanup] Total reclaimable: $([math]::Round($totalFreed/1MB,1)) MB" -ForegroundColor Cyan
}


Export-ModuleMember -Function *

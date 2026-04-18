<#
.SYNOPSIS
    Advanced temporary file cleanup with age-based filtering

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

function Invoke-TempCleanup {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Tmpfile Cleaner
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    param([int]$OlderThanDays = 7) ; $paths = @($env:TEMP, "$env:SystemRoot\Temp"); $totalFiles = 0; $totalSize = 0; foreach ($p in $paths) { if (Test-Path $p) { $old = Get-ChildItem $p -Recurse -File -ErrorAction SilentlyContinue | Where-Object LastWriteTime -lt (Get-Date).AddDays(-$OlderThanDays); $size = ($old | Measure-Object Length -Sum).Sum; $totalFiles += $old.Count; $totalSize += $size; Write-Host "  $p : $($old.Count) files older than $OlderThanDays days ($([math]::Round($size/1MB,1)) MB)" -ForegroundColor Yellow } }; Write-Host "`n[Total] $totalFiles files, $([math]::Round($totalSize/1MB,1)) MB reclaimable" -ForegroundColor Cyan
}


Export-ModuleMember -Function *

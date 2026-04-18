<#
.SYNOPSIS
    Manage log file rotation and cleanup on Windows

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

function Invoke-LogRotation {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Log Rotate
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    param([string]$LogPath = "$env:SystemRoot\Logs", [int]$MaxAgeDays = 30) ; if (-not (Test-Path $LogPath)) { Write-Host "Path not found: $LogPath" -ForegroundColor Red; return }; $files = Get-ChildItem -Path $LogPath -Recurse -File -ErrorAction SilentlyContinue | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-$MaxAgeDays) }; $totalSize = ($files | Measure-Object Length -Sum).Sum; Write-Host "`n[Log Rotation] Found $($files.Count) files older than $MaxAgeDays days ($([math]::Round($totalSize/1MB,1)) MB)" -ForegroundColor Yellow; $files | Select-Object Name, @{N="SizeMB";E={[math]::Round($_.Length/1MB,2)}}, LastWriteTime | Format-Table -AutoSize
}


Export-ModuleMember -Function *

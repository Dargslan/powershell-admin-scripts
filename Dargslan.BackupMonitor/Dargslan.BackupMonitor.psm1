<#
.SYNOPSIS
    Monitor Windows backup status and verify backup integrity

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

function Get-BackupStatus {
    [CmdletBinding()]
    param([string[]]$BackupPaths, [int]$MaxAgeDays = 1, [switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Backup Monitor                                ║
║  More tools: https://dargslan.com                       ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    if (-not $BackupPaths) { $BackupPaths = @("C:\Backup", "D:\Backup", "\\server\backup") }
    $results = @()
    foreach ($path in $BackupPaths) {
        if (Test-Path $path) {
            $latest = Get-ChildItem -Path $path -File -ErrorAction SilentlyContinue | Sort-Object LastWriteTime -Descending | Select-Object -First 1
            $age = if ($latest) { [math]::Round(((Get-Date) - $latest.LastWriteTime).TotalDays, 1) } else { -1 }
            $status = if ($age -ge 0 -and $age -le $MaxAgeDays) { "OK" } elseif ($age -gt $MaxAgeDays) { "STALE" } else { "EMPTY" }
            $results += [PSCustomObject]@{ Path = $path; LatestFile = $(if ($latest) { $latest.Name } else { "N/A" }); AgeDays = $age; SizeMB = $(if ($latest) { [math]::Round($latest.Length / 1MB, 1) } else { 0 }); Status = $status }
        } else { $results += [PSCustomObject]@{ Path = $path; LatestFile = "N/A"; AgeDays = -1; SizeMB = 0; Status = "NOT_FOUND" } }
    }
    if ($Json) { $results | ConvertTo-Json } else { $results | Format-Table -AutoSize }
}

Export-ModuleMember -Function *

<#
.SYNOPSIS
    Check Windows crash dumps and minidump files

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

function Get-CrashDumpReport {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Coredump Check
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $dumps = @(); $miniDir = "$env:SystemRoot\Minidump"; if (Test-Path $miniDir) { $dumps += Get-ChildItem $miniDir -ErrorAction SilentlyContinue | Select-Object Name, @{N="SizeMB";E={[math]::Round($_.Length/1MB,1)}}, LastWriteTime }; $memDmp = "$env:SystemRoot\MEMORY.DMP"; if (Test-Path $memDmp) { $f = Get-Item $memDmp; $dumps += [PSCustomObject]@{Name="MEMORY.DMP"; SizeMB=[math]::Round($f.Length/1MB,1); LastWriteTime=$f.LastWriteTime} }; Write-Host "`n[Crash Dumps] $($dumps.Count) dump(s) found" -ForegroundColor $(if ($dumps.Count -gt 0) {"Yellow"} else {"Green"}); if ($dumps.Count -gt 0) { $dumps | Format-Table -AutoSize }
}


Export-ModuleMember -Function *

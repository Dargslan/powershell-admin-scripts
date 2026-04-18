<#
.SYNOPSIS
    Clean temporary files and cache directories

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

function Clear-TempFiles {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Tmpfile Clean
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $paths = @{Temp=$env:TEMP; SystemTemp="$env:SystemRoot\Temp"; Prefetch="$env:SystemRoot\Prefetch"}; foreach ($name in $paths.Keys) { $p = $paths[$name]; if (Test-Path $p) { $files = Get-ChildItem $p -Recurse -File -ErrorAction SilentlyContinue; $size = ($files | Measure-Object Length -Sum).Sum; Write-Host "  [$name] $($files.Count) files ($([math]::Round($size/1MB,1)) MB)" -ForegroundColor Yellow } }
}


Export-ModuleMember -Function *

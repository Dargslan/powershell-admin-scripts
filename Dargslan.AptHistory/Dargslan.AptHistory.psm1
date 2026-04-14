<#
.SYNOPSIS
    Review Windows Update and package installation history

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

function Get-UpdateHistory {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Apt History
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $results = Get-HotFix -ErrorAction SilentlyContinue | Select-Object HotFixID, Description, InstalledBy, InstalledOn | Sort-Object InstalledOn -Descending; Write-Host "`n[Update History] $($results.Count) updates found" -ForegroundColor Yellow; if ($Json) { $results | ConvertTo-Json } else { $results | Format-Table -AutoSize }
}


Export-ModuleMember -Function *

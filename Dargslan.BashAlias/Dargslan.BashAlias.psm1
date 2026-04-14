<#
.SYNOPSIS
    Manage PowerShell aliases and profile shortcuts

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

function Get-AliasReport {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Bash Alias
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $aliases = Get-Alias | Select-Object Name, Definition, @{N="Source";E={if ($_.Options -match "ReadOnly") {"Built-in"} else {"Custom"}}} | Sort-Object Source, Name; Write-Host "`n[Aliases] $($aliases.Count) total" -ForegroundColor Yellow; if ($Json) { $aliases | ConvertTo-Json } else { $aliases | Format-Table -AutoSize }
}


Export-ModuleMember -Function *

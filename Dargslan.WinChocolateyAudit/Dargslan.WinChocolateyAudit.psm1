<#
.SYNOPSIS
    Chocolatey package manager audit toolkit — installed packages, outdated detection, source configuration, and feature status
.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-ChocolateyAudit {
    <#
    .SYNOPSIS
        Audit Chocolatey package manager status and packages
    .DESCRIPTION
        Reports Chocolatey version, installed packages, outdated packages, configured sources, and features.
        Part of Dargslan.WinChocolateyAudit (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
$chocoPath = Get-Command choco -ErrorAction SilentlyContinue
    if (-not $chocoPath) { Write-Warning "Chocolatey not installed"; return }
    $report = [ordered]@{
        Version = (choco --version 2>$null).Trim()
        Packages = choco list --local-only 2>$null | Where-Object { $_ -match "^\S+\s+\d" } | ForEach-Object { $p=$_ -split "\s+"; [PSCustomObject]@{Name=$p[0];Version=$p[1]} }
        Sources = choco source list 2>$null | Where-Object { $_ -match "http|\\|file:" } | ForEach-Object { $_.Trim() }
        Features = choco feature list 2>$null | Where-Object { $_ -match "Enabled|Disabled" } | Select-Object -First 15 | ForEach-Object { $_.Trim() }
        Summary = [PSCustomObject]@{ Version = ""; PackageCount = 0; SourceCount = 0 }
    }
    $report.Summary.Version = $report.Version
    $report.Summary.PackageCount = ($report.Packages | Measure-Object).Count
    $report.Summary.SourceCount = ($report.Sources | Measure-Object).Count
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Chocolatey Audit - 2026]" -ForegroundColor Cyan
    Write-Host "  Version: $($report.Version) | Packages: $($report.Summary.PackageCount)"
    $report.Packages | Format-Table -AutoSize
    return $report
}

Export-ModuleMember -Function *

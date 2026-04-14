<#
.SYNOPSIS
    Windows Package Manager (winget) audit toolkit — installed apps, available updates, source configuration, and settings analysis
.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-WinGetAudit {
    <#
    .SYNOPSIS
        Audit winget package manager and installed applications
    .DESCRIPTION
        Reports winget version, installed applications, available upgrades, configured sources, and settings.
        Part of Dargslan.WinWinGetAudit (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
$wingetPath = Get-Command winget -ErrorAction SilentlyContinue
    if (-not $wingetPath) { Write-Warning "winget not found"; return }
    $report = [ordered]@{
        Version = (winget --version 2>$null).Trim()
        Sources = winget source list 2>$null | Select-Object -Skip 2 | Where-Object { $_ -match "\S" } | ForEach-Object { $p=$_ -split "\s{2,}"; [PSCustomObject]@{Name=$p[0].Trim();URL=$p[1].Trim()} }
        InstalledCount = (winget list --count 2>$null | Select-Object -Last 1).Trim()
        UpgradeAvailable = winget upgrade 2>$null | Where-Object { $_ -match "^\S.*\d+\.\d+" } | Select-Object -First 20 | ForEach-Object { $_.Trim() }
        Summary = [PSCustomObject]@{ Version = ""; Sources = 0; UpgradesAvailable = 0 }
    }
    $report.Summary.Version = $report.Version
    $report.Summary.Sources = ($report.Sources | Measure-Object).Count
    $report.Summary.UpgradesAvailable = ($report.UpgradeAvailable | Measure-Object).Count
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [WinGet Audit - 2026]" -ForegroundColor Cyan
    Write-Host "  Version: $($report.Version) | Installed: $($report.InstalledCount) | Upgrades: $($report.Summary.UpgradesAvailable)"
    if ($report.UpgradeAvailable) { Write-Host "  Available Upgrades:" -ForegroundColor Yellow; $report.UpgradeAvailable | ForEach-Object { Write-Host "    $_" } }
    return $report
}

Export-ModuleMember -Function *

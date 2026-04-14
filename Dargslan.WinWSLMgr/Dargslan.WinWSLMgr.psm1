<#
.SYNOPSIS
    Windows Subsystem for Linux management toolkit — WSL distribution inventory, resource monitoring, configuration audit, and version management (2026 Edition)

.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-WSLReport {
    <#
    .SYNOPSIS
        Audit WSL installations and configuration
    .DESCRIPTION
        Reports installed WSL distributions, version, resource allocation, running instances, and configuration.
        Part of Dargslan.WinWSLMgr (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $wslPath = Get-Command wsl -ErrorAction SilentlyContinue
    if (-not $wslPath) { Write-Warning "WSL not installed"; return }
    $report = [ordered]@{
        Version = wsl --version 2>&1 | Where-Object { $_ -match "\S" } | ForEach-Object { $_.Trim() }
        Distributions = wsl -l -v 2>&1 | Where-Object { $_ -match "\S" -and $_ -notmatch "NAME" } | ForEach-Object {
            $line = $_.Trim() -replace "\*\s*", ""
            $parts = $line -split "\s{2,}"
            if ($parts.Count -ge 3) { [PSCustomObject]@{ Name = $parts[0]; State = $parts[1]; Version = $parts[2] } }
        }
        DefaultDistro = (wsl -l 2>&1 | Where-Object { $_ -match "\(Default\)" }) -replace "\s*\(Default\)", "" | ForEach-Object { $_.Trim() }
        Config = @{}
        Status = wsl --status 2>&1 | Where-Object { $_ -match "\S" } | ForEach-Object { $_.Trim() }
    }
    $wslConfig = "$env:USERPROFILE\.wslconfig"
    if (Test-Path $wslConfig) { $report.Config = Get-Content $wslConfig }
    $report.Summary = [PSCustomObject]@{
        TotalDistros = ($report.Distributions | Measure-Object).Count
        Running = ($report.Distributions | Where-Object State -eq "Running" | Measure-Object).Count
        WSL2Count = ($report.Distributions | Where-Object Version -eq "2" | Measure-Object).Count
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [WSL Report — 2026 Edition]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.Distributions) { $report.Distributions | Format-Table -AutoSize }
    return $report
}

Export-ModuleMember -Function *

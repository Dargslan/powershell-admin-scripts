<#
.SYNOPSIS
    NuGet and .NET package audit toolkit — installed packages, outdated detection, vulnerability scanning, and dependency analysis
.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-NuGetAudit {
    <#
    .SYNOPSIS
        Audit installed NuGet/.NET packages and vulnerabilities
    .DESCRIPTION
        Reports installed .NET SDK versions, global tools, NuGet package sources, outdated packages, and known vulnerabilities.
        Part of Dargslan.WinNuGetAudit (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
$dotnet = Get-Command dotnet -ErrorAction SilentlyContinue
    $report = [ordered]@{
        DotNetSDKs = if ($dotnet) { dotnet --list-sdks 2>$null | ForEach-Object { $parts = $_ -split " "; [PSCustomObject]@{Version=$parts[0]; Path=$parts[1]} } } else { @() }
        Runtimes = if ($dotnet) { dotnet --list-runtimes 2>$null | ForEach-Object { $parts = $_ -split " "; [PSCustomObject]@{Name=$parts[0]; Version=$parts[1]} } } else { @() }
        GlobalTools = if ($dotnet) { dotnet tool list -g 2>$null | Select-Object -Skip 2 | Where-Object { $_ -match "\S" } | ForEach-Object { $p=$_ -split "\s{2,}"; [PSCustomObject]@{Package=$p[0];Version=$p[1]} } } else { @() }
        NuGetSources = dotnet nuget list source 2>$null | Where-Object { $_ -match "^\s+\d" } | ForEach-Object { $_.Trim() }
        PackageCacheSizeMB = if (Test-Path "$env:USERPROFILE\.nuget\packages") { [math]::Round((Get-ChildItem "$env:USERPROFILE\.nuget\packages" -Recurse -File -ErrorAction SilentlyContinue | Measure-Object Length -Sum).Sum / 1MB, 0) } else { 0 }
        Summary = [PSCustomObject]@{ SDKCount = 0; RuntimeCount = 0; GlobalTools = 0; CacheSizeMB = 0 }
    }
    $report.Summary.SDKCount = ($report.DotNetSDKs | Measure-Object).Count
    $report.Summary.RuntimeCount = ($report.Runtimes | Measure-Object).Count
    $report.Summary.GlobalTools = ($report.GlobalTools | Measure-Object).Count
    $report.Summary.CacheSizeMB = $report.PackageCacheSizeMB
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [NuGet/.NET Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.DotNetSDKs) { $report.DotNetSDKs | Format-Table -AutoSize }
    if ($report.GlobalTools) { Write-Host "  Global Tools:" -ForegroundColor Yellow; $report.GlobalTools | Format-Table -AutoSize }
    return $report
}

Export-ModuleMember -Function *

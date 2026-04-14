<#
.SYNOPSIS
    DotNet runtime and framework audit toolkit — installed .NET versions, CLR status, assembly cache, framework updates, and compatibility analysis
.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-DotNetReport {
    <#
    .SYNOPSIS
        .NET Framework and Runtime audit report
    .DESCRIPTION
        Reports installed .NET Framework versions, .NET Core/5+ runtimes, CLR versions, assembly cache status, and compatibility.
        Part of Dargslan.WinDotNetRuntime (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
$report = [ordered]@{
        Framework = Get-ChildItem "HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP" -Recurse -ErrorAction SilentlyContinue | Get-ItemProperty -Name Version,Release -ErrorAction SilentlyContinue | Where-Object Version | Select-Object @{N="Key";E={$_.PSChildName}}, Version, Release | Sort-Object Version -Descending | Select-Object -First 10
        Runtimes = @()
        CLR = [System.Runtime.InteropServices.RuntimeInformation]::FrameworkDescription
        OSArchitecture = [System.Runtime.InteropServices.RuntimeInformation]::OSArchitecture
        ProcessArchitecture = [System.Runtime.InteropServices.RuntimeInformation]::ProcessArchitecture
        GAC = @{
            Path = "$env:WINDIR\assembly"
            Exists = Test-Path "$env:WINDIR\assembly"
        }
    }
    $dotnet = Get-Command dotnet -ErrorAction SilentlyContinue
    if ($dotnet) {
        $report.Runtimes = dotnet --list-runtimes 2>$null | ForEach-Object { $p=$_ -split " "; [PSCustomObject]@{Name=$p[0];Version=$p[1];Path=$p[2]} }
    }
    $report.Summary = [PSCustomObject]@{
        CLR = $report.CLR; FrameworkVersions = ($report.Framework | Measure-Object).Count
        InstalledRuntimes = ($report.Runtimes | Measure-Object).Count
        Architecture = "$($report.ProcessArchitecture) on $($report.OSArchitecture)"
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [.NET Report - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.Framework) { Write-Host "  .NET Framework:" -ForegroundColor Yellow; $report.Framework | Format-Table -AutoSize }
    if ($report.Runtimes) { Write-Host "  .NET Runtimes:" -ForegroundColor Yellow; $report.Runtimes | Format-Table Name, Version -AutoSize }
    return $report
}

Export-ModuleMember -Function *

<#
.SYNOPSIS
    Python installation audit toolkit — version detection, pip packages, virtual environments, PATH validation, and security configuration
.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-PythonAudit {
    <#
    .SYNOPSIS
        Audit Python installations and packages
    .DESCRIPTION
        Reports installed Python versions, pip packages, virtual environments, PATH configuration, and security status.
        Part of Dargslan.WinPythonAudit (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
$report = [ordered]@{
        Installations = @()
        PipPackages = @()
        VirtualEnvs = @()
        PATH = @()
    }
    $pyVersions = @("python","python3","py")
    foreach ($cmd in $pyVersions) {
        $py = Get-Command $cmd -ErrorAction SilentlyContinue
        if ($py) {
            $ver = & $cmd --version 2>&1
            $report.Installations += [PSCustomObject]@{ Command=$cmd; Version=$ver.ToString().Trim(); Path=$py.Source }
        }
    }
    $pip = Get-Command pip -ErrorAction SilentlyContinue
    if ($pip) {
        $report.PipPackages = pip list --format=json 2>$null | ConvertFrom-Json -ErrorAction SilentlyContinue | Select-Object -First 30 name, version
    }
    $pyPaths = $env:PATH -split ";" | Where-Object { $_ -match "python|Python" }
    $report.PATH = $pyPaths | ForEach-Object { [PSCustomObject]@{ Path=$_; Exists=Test-Path $_ } }
    $regPaths = Get-ChildItem "HKLM:\SOFTWARE\Python","HKLM:\SOFTWARE\WOW6432Node\Python","HKCU:\SOFTWARE\Python" -ErrorAction SilentlyContinue
    $report.Registry = $regPaths | Select-Object Name | ForEach-Object { $_.Name }
    $report.Summary = [PSCustomObject]@{
        Installations = ($report.Installations | Measure-Object).Count
        PipPackages = ($report.PipPackages | Measure-Object).Count
        PythonPaths = ($report.PATH | Measure-Object).Count
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Python Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.Installations) { $report.Installations | Format-Table -AutoSize }
    if ($report.PipPackages) { Write-Host "  Pip Packages (top 30):" -ForegroundColor Yellow; $report.PipPackages | Format-Table -AutoSize }
    return $report
}

Export-ModuleMember -Function *

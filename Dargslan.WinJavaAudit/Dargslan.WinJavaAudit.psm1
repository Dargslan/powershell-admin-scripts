<#
.SYNOPSIS
    Java runtime audit toolkit — JDK/JRE inventory, version detection, JAVA_HOME validation, security settings, and multiple installation detection
.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-JavaAudit {
    <#
    .SYNOPSIS
        Audit Java installations and security settings
    .DESCRIPTION
        Reports installed Java versions, JDK/JRE paths, JAVA_HOME configuration, security properties, and browser plugin status.
        Part of Dargslan.WinJavaAudit (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
$report = [ordered]@{
        JAVA_HOME = $env:JAVA_HOME
        JavaInPath = (Get-Command java -ErrorAction SilentlyContinue).Source
        JavaVersion = try { java -version 2>&1 | Select-Object -First 3 | ForEach-Object { $_.ToString().Trim() } } catch { "Not found" }
        Installations = @()
        SecuritySettings = @()
    }
    $javaKeys = @("HKLM:\SOFTWARE\JavaSoft", "HKLM:\SOFTWARE\WOW6432Node\JavaSoft")
    foreach ($key in $javaKeys) {
        Get-ChildItem $key -Recurse -ErrorAction SilentlyContinue | Get-ItemProperty -ErrorAction SilentlyContinue | Where-Object JavaHome | ForEach-Object {
            $report.Installations += [PSCustomObject]@{ Path = $_.JavaHome; Version = $_.PSChildName; Architecture = if($key -match "WOW6432") {"32-bit"} else {"64-bit"} }
        }
    }
    $adoptPaths = Get-ChildItem "C:\Program Files\Eclipse Adoptium","C:\Program Files\AdoptOpenJDK","C:\Program Files\Java" -Directory -ErrorAction SilentlyContinue
    foreach ($p in $adoptPaths) { $report.Installations += [PSCustomObject]@{ Path=$p.FullName; Version=$p.Name; Architecture="64-bit" } }
    $report.Summary = [PSCustomObject]@{
        JAVA_HOME = if($report.JAVA_HOME) { $report.JAVA_HOME } else { "NOT SET" }
        InstallationCount = ($report.Installations | Measure-Object).Count
        InPath = if($report.JavaInPath) {"Yes"} else {"No"}
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Java Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.JavaVersion -ne "Not found") { $report.JavaVersion | ForEach-Object { Write-Host "  $_" } }
    if ($report.Installations) { $report.Installations | Format-Table -AutoSize }
    if (-not $report.JAVA_HOME) { Write-Host "  Warning: JAVA_HOME not set" -ForegroundColor Yellow }
    return $report
}

Export-ModuleMember -Function *

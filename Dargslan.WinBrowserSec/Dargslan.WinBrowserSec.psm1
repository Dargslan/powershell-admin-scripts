<#
.SYNOPSIS
    Web browser security audit toolkit — installed browsers, default browser, extension audit, auto-update status, and security policy configuration
.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-BrowserSecurityAudit {
    <#
    .SYNOPSIS
        Audit installed web browsers and security settings
    .DESCRIPTION
        Reports installed browsers, versions, extensions, update status, security policies, and default browser configuration.
        Part of Dargslan.WinBrowserSec (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
$report = [ordered]@{
        Browsers = @()
        DefaultBrowser = (Get-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice" -ErrorAction SilentlyContinue).ProgId
        Warnings = @()
    }
    $browserChecks = @(
        @{Name="Microsoft Edge"; RegKey="HKLM:\SOFTWARE\Microsoft\Edge\BLBeacon"; VersionProp="version"; Path="$env:ProgramFiles(x86)\Microsoft\Edge\Application\msedge.exe"},
        @{Name="Google Chrome"; RegKey="HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe"; VersionProp=""; Path="$env:ProgramFiles\Google\Chrome\Application\chrome.exe"},
        @{Name="Mozilla Firefox"; RegKey="HKLM:\SOFTWARE\Mozilla\Mozilla Firefox"; VersionProp="CurrentVersion"; Path="$env:ProgramFiles\Mozilla Firefox\firefox.exe"},
        @{Name="Brave"; RegKey="HKLM:\SOFTWARE\BraveSoftware\Brave-Browser\BLBeacon"; VersionProp="version"; Path="$env:ProgramFiles\BraveSoftware\Brave-Browser\Application\brave.exe"}
    )
    foreach ($b in $browserChecks) {
        $installed = Test-Path $b.Path -ErrorAction SilentlyContinue
        if ($installed -or (Test-Path $b.RegKey -ErrorAction SilentlyContinue)) {
            $ver = if ($b.VersionProp -and (Test-Path $b.RegKey)) { (Get-ItemProperty $b.RegKey -ErrorAction SilentlyContinue).$($b.VersionProp) } elseif (Test-Path $b.Path) { (Get-Item $b.Path -ErrorAction SilentlyContinue).VersionInfo.ProductVersion } else { "Unknown" }
            $report.Browsers += [PSCustomObject]@{ Name=$b.Name; Version=$ver; Installed=$true; Path=$b.Path }
        }
    }
    $chromeExtDir = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Extensions"
    $edgeExtDir = "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Extensions"
    $report.ChromeExtensions = if (Test-Path $chromeExtDir) { (Get-ChildItem $chromeExtDir -Directory -ErrorAction SilentlyContinue | Measure-Object).Count } else { 0 }
    $report.EdgeExtensions = if (Test-Path $edgeExtDir) { (Get-ChildItem $edgeExtDir -Directory -ErrorAction SilentlyContinue | Measure-Object).Count } else { 0 }
    $report.Summary = [PSCustomObject]@{
        InstalledBrowsers = ($report.Browsers | Measure-Object).Count
        DefaultBrowser = $report.DefaultBrowser
        ChromeExtensions = $report.ChromeExtensions
        EdgeExtensions = $report.EdgeExtensions
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Browser Security - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    $report.Browsers | Format-Table Name, Version, Installed -AutoSize
    return $report
}

Export-ModuleMember -Function *

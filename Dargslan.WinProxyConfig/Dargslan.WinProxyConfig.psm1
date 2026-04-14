<#
.SYNOPSIS
    Windows proxy and internet settings audit toolkit — system proxy, PAC files, WinHTTP proxy, IE/Edge settings, and proxy bypass lists
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-ProxyAudit {
    <#
    .SYNOPSIS
        Audit proxy and internet connection settings
    .DESCRIPTION
        Part of Dargslan.WinProxyConfig (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        SystemProxy = [System.Net.WebProxy]::GetDefaultProxy() | Select-Object @{N="Address";E={$_.Address}}, @{N="BypassLocal";E={$_.BypassProxyOnLocal}}, @{N="BypassList";E={$_.BypassList -join ","}}
        IEProxy = Get-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" -ErrorAction SilentlyContinue | Select-Object ProxyEnable, ProxyServer, ProxyOverride, AutoConfigURL
        WinHTTP = netsh winhttp show proxy 2>$null | Where-Object { $_ -match "\S" } | ForEach-Object { $_.Trim() }
        EnvironmentProxy = [PSCustomObject]@{
            HTTP_PROXY = $env:HTTP_PROXY
            HTTPS_PROXY = $env:HTTPS_PROXY
            NO_PROXY = $env:NO_PROXY
        }
        WPADEnabled = (Get-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Wpad" -ErrorAction SilentlyContinue) -ne $null
        Summary = [PSCustomObject]@{ ProxyEnabled = $false; ProxyServer = ""; AutoConfig = $false }
    }
    $report.Summary.ProxyEnabled = $report.IEProxy.ProxyEnable -eq 1
    $report.Summary.ProxyServer = $report.IEProxy.ProxyServer
    $report.Summary.AutoConfig = [bool]$report.IEProxy.AutoConfigURL
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Proxy Config Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    Write-Host "  IE/Edge Proxy:" -ForegroundColor Yellow; $report.IEProxy | Format-List ProxyEnable, ProxyServer, AutoConfigURL
    Write-Host "  WinHTTP:" -ForegroundColor Yellow; $report.WinHTTP | ForEach-Object { Write-Host "    $_" }
    Write-Host "  Environment Variables:" -ForegroundColor Yellow; $report.EnvironmentProxy | Format-List
    return $report
}

Export-ModuleMember -Function *

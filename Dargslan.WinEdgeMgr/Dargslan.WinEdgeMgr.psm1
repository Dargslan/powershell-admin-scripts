<#
.SYNOPSIS
    Microsoft Edge browser management toolkit — policy audit, extension inventory, profile management, and security configuration (2026 Edition)
.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
.LINK
    https://dargslan.com
#>

function Get-EdgeAudit {
    <#
    .SYNOPSIS
        Audit Microsoft Edge browser configuration and policies
    .DESCRIPTION
        Reports Edge browser policies, installed extensions, profiles, security settings, and update status.
        Part of Dargslan.WinEdgeMgr (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $report = [ordered]@{
        Version = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Edge\BLBeacon" -ErrorAction SilentlyContinue).version
        Policies = Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Edge" -ErrorAction SilentlyContinue | Select-Object * -ExcludeProperty PS*
        Extensions = Get-ChildItem "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Extensions" -ErrorAction SilentlyContinue | Select-Object Name, CreationTime, LastWriteTime
        Profiles = Get-ChildItem "$env:LOCALAPPDATA\Microsoft\Edge\User Data" -Directory -ErrorAction SilentlyContinue | Where-Object Name -match "Profile|Default" | Select-Object Name, CreationTime
        UpdateService = Get-Service edgeupdate -ErrorAction SilentlyContinue | Select-Object Status, StartType
        Security = [PSCustomObject]@{
            SmartScreen = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Edge" -ErrorAction SilentlyContinue).SmartScreenEnabled
            PasswordMonitor = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Edge" -ErrorAction SilentlyContinue).PasswordMonitorAllowed
            InPrivateBrowsing = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Edge" -ErrorAction SilentlyContinue).InPrivateModeAvailability
        }
        Summary = [PSCustomObject]@{
            Version = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Edge\BLBeacon" -ErrorAction SilentlyContinue).version
            ExtensionCount = (Get-ChildItem "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Extensions" -ErrorAction SilentlyContinue | Measure-Object).Count
            ProfileCount = (Get-ChildItem "$env:LOCALAPPDATA\Microsoft\Edge\User Data" -Directory -ErrorAction SilentlyContinue | Where-Object Name -match "Profile|Default" | Measure-Object).Count
        }
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Edge Audit — 2026 Edition]" -ForegroundColor Cyan
    Write-Host "  Version: $($report.Version) | Extensions: $($report.Summary.ExtensionCount) | Profiles: $($report.Summary.ProfileCount)"
    $report.Security | Format-List
    return $report
}

Export-ModuleMember -Function *

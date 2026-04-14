<#
.SYNOPSIS
    Windows Features and Roles audit toolkit — installed features, available features, role services, and feature dependency analysis
.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-WindowsFeaturesAudit {
    <#
    .SYNOPSIS
        Audit installed Windows features and optional capabilities
    .DESCRIPTION
        Reports installed Windows features, optional capabilities, server roles, and available features not yet installed.
        Part of Dargslan.WinWindowsFeatures (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
$report = [ordered]@{
        OptionalFeatures = Get-WindowsOptionalFeature -Online -ErrorAction SilentlyContinue | Where-Object State -eq "Enabled" | Select-Object FeatureName, State | Sort-Object FeatureName
        Capabilities = Get-WindowsCapability -Online -ErrorAction SilentlyContinue | Where-Object State -eq "Installed" | Select-Object Name, State | Sort-Object Name
        ServerFeatures = @()
        AvailableFeatures = Get-WindowsOptionalFeature -Online -ErrorAction SilentlyContinue | Where-Object State -eq "Disabled" | Measure-Object | Select-Object Count
    }
    if (Get-Command Get-WindowsFeature -ErrorAction SilentlyContinue) {
        $report.ServerFeatures = Get-WindowsFeature | Where-Object Installed | Select-Object Name, DisplayName, InstallState, FeatureType
    }
    $report.Summary = [PSCustomObject]@{
        EnabledFeatures = ($report.OptionalFeatures | Measure-Object).Count
        InstalledCapabilities = ($report.Capabilities | Measure-Object).Count
        ServerRoles = ($report.ServerFeatures | Measure-Object).Count
        AvailableToInstall = $report.AvailableFeatures.Count
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Windows Features - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    Write-Host "  Enabled Optional Features:" -ForegroundColor Yellow
    $report.OptionalFeatures | Format-Table -AutoSize
    if ($report.ServerFeatures) { Write-Host "  Server Roles:" -ForegroundColor Yellow; $report.ServerFeatures | Format-Table -AutoSize }
    return $report
}

Export-ModuleMember -Function *

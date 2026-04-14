function Get-WDSAudit {
    <#
    .SYNOPSIS
        Audit Windows Deployment Services configuration
    .DESCRIPTION
        Windows Deployment Services audit toolkit — WDS server config, boot images, install images, multicast, PXE settings, and driver groups
        Part of the Dargslan Windows Admin Toolkit — https://dargslan.com
    .PARAMETER Json
        Output results as JSON
    .EXAMPLE
        Get-WDSAudit
    .EXAMPLE
        Get-WDSAudit -Json
    .LINK
        https://dargslan.com
    .LINK
        https://www.powershellgallery.com/profiles/Dargslan
    #>
    [CmdletBinding()]
    param([switch]$Json)

    $report = [ordered]@{
        Service = Get-Service WDSServer -ErrorAction SilentlyContinue | Select-Object Status, StartType
        BootImages = Get-WdsBootImage -ErrorAction SilentlyContinue | Select-Object ImageName, Architecture, Enabled, ImageGroup
        InstallImages = Get-WdsInstallImage -ErrorAction SilentlyContinue | Select-Object ImageName, ImageGroup, Architecture, InstallImageType | Select-Object -First 20
        Config = wdsutil /Get-Server /Show:Config 2>$null | Where-Object { $_ -match "\S" } | Select-Object -First 20 | ForEach-Object { $_.Trim() }
        Multicast = Get-WdsMulticastSessionStatus -ErrorAction SilentlyContinue | Select-Object Name, TransferStatus, Clients
        Warnings = @()
    }
    if (-not $report.Service -or $report.Service.Status -ne "Running") { $report.Warnings += "WDS Server service is not running or not installed" }
    $report.Summary = [PSCustomObject]@{ ServiceRunning = ($report.Service.Status -eq "Running"); BootImageCount = ($report.BootImages | Measure-Object).Count; InstallImageCount = ($report.InstallImages | Measure-Object).Count }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [WDS Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.BootImages) { $report.BootImages | Format-Table -AutoSize }
    if ($report.InstallImages) { $report.InstallImages | Format-Table ImageName, Architecture -AutoSize }
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function Get-WDSAudit

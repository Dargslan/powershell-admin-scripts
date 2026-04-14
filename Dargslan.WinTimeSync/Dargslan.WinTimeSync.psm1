function Get-TimeSyncAudit {
    <#
    .SYNOPSIS
        Audit Windows time synchronization and NTP config
    .DESCRIPTION
        Windows time synchronization audit toolkit — NTP configuration, W32Time service, stratum, time drift, and sync peers
        Part of the Dargslan Windows Admin Toolkit — https://dargslan.com
    .PARAMETER Json
        Output results as JSON
    .EXAMPLE
        Get-TimeSyncAudit
    .EXAMPLE
        Get-TimeSyncAudit -Json
    .LINK
        https://dargslan.com
    .LINK
        https://www.powershellgallery.com/profiles/Dargslan
    #>
    [CmdletBinding()]
    param([switch]$Json)

    $report = [ordered]@{
        Service = Get-Service W32Time -ErrorAction SilentlyContinue | Select-Object Status, StartType
        Config = w32tm /query /configuration 2>$null | Where-Object { $_ -match "\S" } | ForEach-Object { $_.Trim() }
        Status = w32tm /query /status 2>$null | Where-Object { $_ -match "\S" } | ForEach-Object { $_.Trim() }
        Peers = w32tm /query /peers 2>$null | Where-Object { $_ -match "\S" } | ForEach-Object { $_.Trim() }
        Source = w32tm /query /source 2>$null
        Registry = [PSCustomObject]@{
            NtpServer = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Services\W32Time\Parameters" -ErrorAction SilentlyContinue).NtpServer
            Type = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Services\W32Time\Parameters" -ErrorAction SilentlyContinue).Type
        }
        Warnings = @()
    }
    if ($report.Service.Status -ne "Running") { $report.Warnings += "W32Time service is not running" }
    $report.Summary = [PSCustomObject]@{ ServiceRunning = $report.Service.Status -eq "Running"; NTPSource = if ($report.Source) { $report.Source.Trim() } else { "Unknown" }; SyncType = $report.Registry.Type }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Time Sync Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function Get-TimeSyncAudit

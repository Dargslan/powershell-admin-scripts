<#
.SYNOPSIS
    Windows time synchronization management toolkit — NTP status, time skew detection, W32Time service monitoring, and timezone configuration

.DESCRIPTION
    Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
    Windows & DevOps Books: https://dargslan.com/books

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-TimeStatus {
    <#
    .SYNOPSIS
        Check Windows time synchronization status
    .DESCRIPTION
        Reports W32Time service status, NTP source, time skew, and timezone configuration.
        Part of Dargslan.WinTimeMgr — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $w32time = w32tm /query /status 2>&1
    $report = [ordered]@{
        Timezone = Get-TimeZone | Select-Object Id, DisplayName, BaseUtcOffset
        CurrentTime = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss.fff")
        UTCTime = (Get-Date).ToUniversalTime().ToString("yyyy-MM-dd HH:mm:ss.fff")
        W32TimeService = (Get-Service W32Time -ErrorAction SilentlyContinue).Status
        NTPSource = ($w32time | Where-Object { $_ -match "Source:" }) -replace "Source:\s*", ""
        LastSync = ($w32time | Where-Object { $_ -match "Last Successful" }) -replace "Last Successful Sync Time:\s*", ""
        Stratum = ($w32time | Where-Object { $_ -match "Stratum:" }) -replace "Stratum:\s*", ""
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Time Status]" -ForegroundColor Cyan
    Write-Host "  Timezone: $($report.Timezone.DisplayName)"
    Write-Host "  NTP Source: $($report.NTPSource)"
    Write-Host "  Last Sync: $($report.LastSync)"
    Write-Host "  W32Time: $($report.W32TimeService)"
    return $report
}

Export-ModuleMember -Function *

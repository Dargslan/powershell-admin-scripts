<#
.SYNOPSIS
    Windows Update management toolkit — update status, pending patches, hotfix history, WSUS configuration, and update compliance reporting

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

function Get-UpdateStatus {
    <#
    .SYNOPSIS
        Get comprehensive Windows Update status
    .DESCRIPTION
        Shows pending updates, last update date, WSUS configuration, and compliance status.
        Part of Dargslan.WinUpdateMgr — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $report = [ordered]@{
        LastHotfix = Get-HotFix | Sort-Object InstalledOn -Descending | Select-Object -First 1 HotFixID, InstalledOn, Description
        RecentHotfixes = Get-HotFix | Sort-Object InstalledOn -Descending | Select-Object -First 10 HotFixID, InstalledOn, Description, InstalledBy
        TotalInstalled = (Get-HotFix | Measure-Object).Count
        DaysSinceUpdate = if ((Get-HotFix | Sort-Object InstalledOn -Descending | Select-Object -First 1).InstalledOn) { [math]::Round(((Get-Date) - (Get-HotFix | Sort-Object InstalledOn -Descending | Select-Object -First 1).InstalledOn).TotalDays, 0) } else { "Unknown" }
        WsusConfig = try { Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -ErrorAction Stop | Select-Object WUServer, WUStatusServer } catch { @{WUServer = "Not configured"} }
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Windows Update Status]" -ForegroundColor Cyan
    Write-Host "  Last Update: $($report.LastHotfix.HotFixID) on $($report.LastHotfix.InstalledOn) ($($report.DaysSinceUpdate) days ago)"
    Write-Host "  Total Hotfixes: $($report.TotalInstalled)"
    $report.RecentHotfixes | Format-Table -AutoSize
    return $report
}

Export-ModuleMember -Function *

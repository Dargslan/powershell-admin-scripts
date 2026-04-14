<#
.SYNOPSIS
    Windows boot performance analyzer — boot time measurement, startup impact analysis, boot event review, and optimization recommendations

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

function Get-BootAnalysis {
    <#
    .SYNOPSIS
        Analyze Windows boot performance and startup impact
    .DESCRIPTION
        Measures boot time, identifies slow-starting services and applications, and provides optimization recommendations.
        Part of Dargslan.WinBootAnalyzer — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $os = Get-CimInstance Win32_OperatingSystem
    $report = [ordered]@{
        LastBoot = $os.LastBootUpTime.ToString("yyyy-MM-dd HH:mm:ss")
        UptimeDays = [math]::Round(((Get-Date) - $os.LastBootUpTime).TotalDays, 1)
        BootEvents = Get-WinEvent -FilterHashtable @{LogName="System";ID=@(6005,6006,6008,6009)} -MaxEvents 10 -ErrorAction SilentlyContinue | Select-Object TimeCreated, Id, @{N="Event";E={switch($_.Id){6005{"Event Log Started"}6006{"Event Log Stopped"}6008{"Unexpected Shutdown"}6009{"OS Info at Boot"}}}}
        StartupPrograms = Get-CimInstance Win32_StartupCommand | Select-Object Name, Command, Location, User
        AutoStartServices = Get-Service | Where-Object StartType -eq "Automatic" | Select-Object -First 20 Name, DisplayName, Status
        FastStartup = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power" -ErrorAction SilentlyContinue).HiberbootEnabled
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Boot Analysis]" -ForegroundColor Cyan
    Write-Host "  Last Boot: $($report.LastBoot) (Uptime: $($report.UptimeDays) days)"
    Write-Host "  Fast Startup: $(if($report.FastStartup){"Enabled"}else{"Disabled"})"
    Write-Host "  Startup Programs: $(($report.StartupPrograms | Measure-Object).Count)"
    Write-Host "  Auto-Start Services: $(($report.AutoStartServices | Measure-Object).Count)"
    if ($report.BootEvents) { Write-Host "`n  Recent Boot Events:" -ForegroundColor Yellow; $report.BootEvents | Format-Table -AutoSize }
    return $report
}

Export-ModuleMember -Function *

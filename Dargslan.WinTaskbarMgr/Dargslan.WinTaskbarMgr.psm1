<#
.SYNOPSIS
    Windows startup program and scheduled task optimization toolkit

.DESCRIPTION
    Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com

.LINK
    https://dargslan.com
#>

function Get-StartupOptimization {
    <#
    .SYNOPSIS
        Analyze startup programs and suggest optimizations
    .DESCRIPTION
        Reviews autostart programs, scheduled tasks at logon, and startup services.
        Part of Dargslan.WinTaskbarMgr
    #>
    [CmdletBinding()] param([switch]$Json)

    $report = [ordered]@{
        StartupPrograms = Get-CimInstance Win32_StartupCommand | Select-Object Name, Command, Location, User
        LogonTasks = Get-ScheduledTask | Where-Object State -eq "Ready" | Select-Object -First 20 TaskName, State
        AutoStartServices = Get-Service | Where-Object StartType -eq "Automatic" | Select-Object Name, DisplayName, Status
        Summary = [PSCustomObject]@{
            StartupPrograms = (Get-CimInstance Win32_StartupCommand | Measure-Object).Count
            AutoServices = (Get-Service | Where-Object StartType -eq "Automatic" | Measure-Object).Count
            StoppedAutoServices = (Get-Service | Where-Object { $_.StartType -eq "Automatic" -and $_.Status -ne "Running" } | Measure-Object).Count
        }
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Startup Optimization]" -ForegroundColor Cyan
    $report.Summary | Format-List
    Write-Host "  Startup Programs:" -ForegroundColor Yellow
    $report.StartupPrograms | Format-Table Name, Command, Location -AutoSize
    return $report
}

Export-ModuleMember -Function *

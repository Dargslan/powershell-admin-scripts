<#
.SYNOPSIS
    Windows Event Log analyzer toolkit — error detection, security event monitoring, log statistics, export, and real-time filtering

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

function Get-EventLogSummary {
    <#
    .SYNOPSIS
        Get summary statistics for Windows Event Logs
    .DESCRIPTION
        Analyzes event logs for error counts, warning trends, and critical events in a specified time period.
        Part of Dargslan.WinEventLog — https://dargslan.com
    #>
    [CmdletBinding()] param([int]$Hours = 24, [switch]$Json)

    $since = (Get-Date).AddHours(-$Hours)
    $logs = @("System","Application","Security")
    $report = [ordered]@{}
    foreach ($log in $logs) {
        $events = Get-WinEvent -FilterHashtable @{LogName=$log;StartTime=$since} -ErrorAction SilentlyContinue
        $report[$log] = [PSCustomObject]@{
            Total = ($events | Measure-Object).Count
            Critical = ($events | Where-Object Level -eq 1 | Measure-Object).Count
            Error = ($events | Where-Object Level -eq 2 | Measure-Object).Count
            Warning = ($events | Where-Object Level -eq 3 | Measure-Object).Count
            Info = ($events | Where-Object Level -eq 4 | Measure-Object).Count
            TopSources = ($events | Group-Object ProviderName | Sort-Object Count -Descending | Select-Object -First 5 Name, Count)
        }
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 4 }
    Write-Host "`n  [Event Log Summary — Last $Hours hours]" -ForegroundColor Cyan
    foreach ($log in $logs) {
        Write-Host "`n  $log`:" -ForegroundColor Yellow
        Write-Host "    Critical: $($report[$log].Critical) | Error: $($report[$log].Error) | Warning: $($report[$log].Warning) | Info: $($report[$log].Info)"
    }
    return $report
}

function Get-CriticalEvents {
    <#
    .SYNOPSIS
        Get critical and error events from all logs
    .DESCRIPTION
        Retrieves the most recent critical and error events across System, Application, and Security logs.
        Part of Dargslan.WinEventLog — https://dargslan.com
    #>
    [CmdletBinding()] param([int]$Hours = 24, [int]$MaxEvents = 30, [switch]$Json)

    $since = (Get-Date).AddHours(-$Hours)
    $events = @("System","Application") | ForEach-Object {
        Get-WinEvent -FilterHashtable @{LogName=$_;Level=@(1,2);StartTime=$since} -MaxEvents $MaxEvents -ErrorAction SilentlyContinue |
            Select-Object TimeCreated, LevelDisplayName, ProviderName, Id, Message
    }
    if ($Json) { return $events | ConvertTo-Json -Depth 3 }
    if ($events) { $events | Sort-Object TimeCreated -Descending | Format-Table -Wrap TimeCreated, LevelDisplayName, ProviderName, Id, @{N="Message";E={$_.Message.Substring(0,[math]::Min(80,$_.Message.Length))}} }
    else { Write-Host "  No critical/error events in last $Hours hours" -ForegroundColor Green }
    return $events
}

Export-ModuleMember -Function *

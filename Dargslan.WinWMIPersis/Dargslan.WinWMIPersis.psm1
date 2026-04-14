<#
.SYNOPSIS
    WMI persistence detection toolkit — event subscriptions, consumer bindings, suspicious WMI activity, and backdoor hunting
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-WMIPersistenceAudit {
    <#
    .SYNOPSIS
        Detect WMI-based persistence and suspicious subscriptions
    .DESCRIPTION
        Part of Dargslan.WinWMIPersis (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        EventFilters = Get-WmiObject -Namespace root/subscription -Class __EventFilter -ErrorAction SilentlyContinue | Select-Object Name, Query, QueryLanguage
        EventConsumers = Get-WmiObject -Namespace root/subscription -Class __EventConsumer -ErrorAction SilentlyContinue | Select-Object Name, @{N="Type";E={$_.__CLASS}}, @{N="Detail";E={if($_.CommandLineTemplate){$_.CommandLineTemplate}elseif($_.ScriptText){$_.ScriptText.Substring(0,100)}else{"N/A"}}}
        FilterToConsumer = Get-WmiObject -Namespace root/subscription -Class __FilterToConsumerBinding -ErrorAction SilentlyContinue | Select-Object @{N="Filter";E={$_.Filter -replace ".*Name=""","" -replace """.*",""}}, @{N="Consumer";E={$_.Consumer -replace ".*Name=""","" -replace """.*",""}}
        Warnings = @()
    }
    if (($report.EventFilters | Measure-Object).Count -gt 0) { $report.Warnings += "WMI event subscriptions found — review for persistence" }
    $report.EventConsumers | Where-Object Type -eq "CommandLineEventConsumer" | ForEach-Object { $report.Warnings += "CommandLine consumer found: $($_.Name)" }
    $report.Summary = [PSCustomObject]@{
        Filters = ($report.EventFilters | Measure-Object).Count
        Consumers = ($report.EventConsumers | Measure-Object).Count
        Bindings = ($report.FilterToConsumer | Measure-Object).Count
        SuspiciousCount = $report.Warnings.Count
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [WMI Persistence - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.EventFilters) { Write-Host "  Event Filters:" -ForegroundColor Yellow; $report.EventFilters | Format-Table -AutoSize }
    if ($report.FilterToConsumer) { Write-Host "  Bindings:" -ForegroundColor Yellow; $report.FilterToConsumer | Format-Table -AutoSize }
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  ALERT: $_" -ForegroundColor Red } }
    return $report
}

Export-ModuleMember -Function *

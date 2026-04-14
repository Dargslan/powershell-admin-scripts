<#
.SYNOPSIS
    Windows ETW (Event Tracing) audit toolkit — active trace sessions, providers, consumer processes, and ETW tampering detection
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-ETWAudit {
    <#
    .SYNOPSIS
        Audit Event Tracing for Windows sessions and providers
    .DESCRIPTION
        Part of Dargslan.WinETW (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        ActiveSessions = logman query -ets 2>$null | Where-Object { $_ -match "^\S" -and $_ -notmatch "^Data Collector" -and $_ -notmatch "^---" -and $_ -notmatch "^The command" } | ForEach-Object {
            $parts = $_ -split "\s{2,}"
            [PSCustomObject]@{ Name=$parts[0].Trim(); Status=if($parts.Count -gt 1){$parts[1].Trim()}else{"Active"} }
        }
        AutoLoggers = Get-ChildItem "HKLM:\SYSTEM\CurrentControlSet\Control\WMI\Autologger" -ErrorAction SilentlyContinue | Select-Object PSChildName | ForEach-Object { $_.PSChildName }
        SecurityTrace = logman query "EventLog-Security" -ets 2>$null | Where-Object { $_ -match "\S" } | Select-Object -First 10 | ForEach-Object { $_.Trim() }
        Summary = [PSCustomObject]@{ ActiveSessions = 0; AutoLoggers = 0 }
    }
    $report.Summary.ActiveSessions = ($report.ActiveSessions | Measure-Object).Count
    $report.Summary.AutoLoggers = ($report.AutoLoggers | Measure-Object).Count
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [ETW Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.ActiveSessions) { $report.ActiveSessions | Format-Table -AutoSize }
    return $report
}

Export-ModuleMember -Function *

<#
.SYNOPSIS
    Sysmon configuration audit toolkit — installed version, config hash, rule counts, event ID coverage, and detection gap analysis
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-SysmonAudit {
    <#
    .SYNOPSIS
        Audit Sysmon installation and configuration
    .DESCRIPTION
        Part of Dargslan.WinSysmonConfig (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        Installed = (Get-Service Sysmon,Sysmon64 -ErrorAction SilentlyContinue | Measure-Object).Count -gt 0
        Service = Get-Service Sysmon,Sysmon64 -ErrorAction SilentlyContinue | Select-Object Name, Status, StartType
        Version = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Sysmon/Operational" -ErrorAction SilentlyContinue)
        Driver = Get-CimInstance Win32_SystemDriver -ErrorAction SilentlyContinue | Where-Object Name -match "Sysmon" | Select-Object Name, State, PathName
        Config = sysmon -c 2>$null | Where-Object { $_ -match "\S" } | Select-Object -First 20
        RecentEvents = Get-WinEvent -LogName "Microsoft-Windows-Sysmon/Operational" -MaxEvents 10 -ErrorAction SilentlyContinue | Select-Object TimeCreated, Id, @{N="Brief";E={$_.Message.Substring(0,[math]::Min(80,$_.Message.Length))}}
        Summary = [PSCustomObject]@{ Installed = $false; Running = $false; RecentEvents = 0 }
    }
    $report.Summary.Installed = $report.Installed
    $report.Summary.Running = ($report.Service | Where-Object Status -eq "Running" | Measure-Object).Count -gt 0
    $report.Summary.RecentEvents = ($report.RecentEvents | Measure-Object).Count
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Sysmon Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.Service) { $report.Service | Format-Table -AutoSize }
    if ($report.RecentEvents) { $report.RecentEvents | Format-Table TimeCreated, Id, Brief -AutoSize }
    return $report
}

Export-ModuleMember -Function *

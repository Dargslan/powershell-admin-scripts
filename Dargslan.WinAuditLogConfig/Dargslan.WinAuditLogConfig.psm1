<#
.SYNOPSIS
    Windows audit log configuration toolkit — event log sizes, retention policies, advanced audit policy, security event log health
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-AuditLogConfig {
    <#
    .SYNOPSIS
        Audit Windows event log configuration and health
    .DESCRIPTION
        Part of Dargslan.WinAuditLogConfig (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        EventLogs = Get-WinEvent -ListLog Security,System,Application,"Microsoft-Windows-PowerShell/Operational","Microsoft-Windows-Sysmon/Operational" -ErrorAction SilentlyContinue | Select-Object LogName, @{N="MaxSizeMB";E={[math]::Round($_.MaximumSizeInBytes/1MB,0)}}, @{N="CurrentSizeMB";E={[math]::Round($_.FileSize/1MB,1)}}, @{N="UsedPct";E={if($_.MaximumSizeInBytes -gt 0){[math]::Round($_.FileSize/$_.MaximumSizeInBytes*100,0)}else{0}}}, RecordCount, LogMode, IsEnabled
        AuditPolicy = auditpol /get /category:* 2>$null | Where-Object { $_ -match "^\s+\S" -and $_ -match "Success|Failure|No Auditing" } | ForEach-Object {
            $parts = $_ -split "\s{2,}"
            [PSCustomObject]@{ Subcategory = $parts[0].Trim(); Setting = $parts[-1].Trim() }
        }
        SysmonInstalled = (Get-Service Sysmon* -ErrorAction SilentlyContinue | Measure-Object).Count -gt 0
        WEFEnabled = (Get-Service Wecsvc -ErrorAction SilentlyContinue).Status -eq "Running"
        Warnings = @()
    }
    $secLog = $report.EventLogs | Where-Object LogName -eq "Security"
    if ($secLog.MaxSizeMB -lt 100) { $report.Warnings += "Security log is small ($($secLog.MaxSizeMB) MB) — recommend 1GB+" }
    if ($secLog.UsedPct -gt 90) { $report.Warnings += "Security log is $($secLog.UsedPct)% full" }
    $noAudit = $report.AuditPolicy | Where-Object Setting -eq "No Auditing"
    if (($noAudit | Measure-Object).Count -gt 10) { $report.Warnings += "$($noAudit.Count) audit subcategories are not configured" }
    $report.Summary = [PSCustomObject]@{
        EventLogs = ($report.EventLogs | Measure-Object).Count
        AuditSubcategories = ($report.AuditPolicy | Measure-Object).Count
        AuditEnabled = ($report.AuditPolicy | Where-Object Setting -ne "No Auditing" | Measure-Object).Count
        Sysmon = $report.SysmonInstalled; WEF = $report.WEFEnabled
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Audit Log Config - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    $report.EventLogs | Format-Table LogName, MaxSizeMB, CurrentSizeMB, UsedPct, RecordCount, LogMode -AutoSize
    Write-Host "  Sysmon: $(if($report.SysmonInstalled){"{0}Installed{0}" -f [char]39}else{"{0}Not installed{0}" -f [char]39}) | WEF: $(if($report.WEFEnabled){"{0}Active{0}" -f [char]39}else{"{0}Inactive{0}" -f [char]39})"
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function *

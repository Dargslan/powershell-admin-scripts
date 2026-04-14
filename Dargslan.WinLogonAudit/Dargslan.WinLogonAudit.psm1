<#
.SYNOPSIS
    Windows logon security audit toolkit — logon history, failed attempts, account lockouts, session tracking, and authentication method analysis
.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-LogonAudit {
    <#
    .SYNOPSIS
        Audit Windows logon activity and security
    .DESCRIPTION
        Reports recent logon events, failed attempts, account lockouts, active sessions, and authentication methods used.
        Part of Dargslan.WinLogonAudit (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
$report = [ordered]@{
        RecentLogons = Get-WinEvent -FilterHashtable @{LogName="Security";Id=4624} -MaxEvents 20 -ErrorAction SilentlyContinue | Select-Object TimeCreated, @{N="User";E={$_.Properties[5].Value}}, @{N="Domain";E={$_.Properties[6].Value}}, @{N="LogonType";E={$_.Properties[8].Value}}, @{N="Source";E={$_.Properties[18].Value}}
        FailedLogons = Get-WinEvent -FilterHashtable @{LogName="Security";Id=4625} -MaxEvents 20 -ErrorAction SilentlyContinue | Select-Object TimeCreated, @{N="User";E={$_.Properties[5].Value}}, @{N="Domain";E={$_.Properties[6].Value}}, @{N="FailureReason";E={$_.Properties[8].Value}}, @{N="Source";E={$_.Properties[19].Value}}
        Lockouts = Get-WinEvent -FilterHashtable @{LogName="Security";Id=4740} -MaxEvents 10 -ErrorAction SilentlyContinue | Select-Object TimeCreated, @{N="User";E={$_.Properties[0].Value}}, @{N="CallerComputer";E={$_.Properties[1].Value}}
        ActiveSessions = query user 2>$null | Select-Object -Skip 1 | ForEach-Object { $_.Trim() }
        LogonTypes = @{2="Interactive";3="Network";4="Batch";5="Service";7="Unlock";8="NetworkCleartext";9="NewCredentials";10="RemoteInteractive";11="CachedInteractive"}
    }
    $report.Summary = [PSCustomObject]@{
        RecentLogons = ($report.RecentLogons | Measure-Object).Count
        FailedAttempts = ($report.FailedLogons | Measure-Object).Count
        AccountLockouts = ($report.Lockouts | Measure-Object).Count
        ActiveSessions = ($report.ActiveSessions | Measure-Object).Count
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Logon Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.FailedLogons) { Write-Host "  Failed Logons:" -ForegroundColor Red; $report.FailedLogons | Select-Object -First 10 TimeCreated, User, Source | Format-Table -AutoSize }
    if ($report.Lockouts) { Write-Host "  Account Lockouts:" -ForegroundColor Red; $report.Lockouts | Format-Table -AutoSize }
    $report.RecentLogons | Select-Object -First 10 TimeCreated, User, LogonType, Source | Format-Table -AutoSize
    return $report
}

Export-ModuleMember -Function *

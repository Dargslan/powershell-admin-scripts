<#
.SYNOPSIS
    Windows Event Forwarding (WEF) audit toolkit
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-EventForwardingAudit {
    <#
    .SYNOPSIS
        Audit Windows Event Forwarding subscriptions and collector status
    .DESCRIPTION
        Part of Dargslan.WinEventForward (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        CollectorService = Get-Service Wecsvc -ErrorAction SilentlyContinue | Select-Object Status, StartType
        Subscriptions = wecutil es 2>$null | ForEach-Object {
            $sub = wecutil gs $_ 2>$null
            [PSCustomObject]@{
                Name = $_
                Enabled = ($sub | Where-Object { $_ -match "Enabled:" }) -replace ".*:\s+",""
                Mode = ($sub | Where-Object { $_ -match "DeliveryMode:" }) -replace ".*:\s+",""
                Format = ($sub | Where-Object { $_ -match "ContentFormat:" }) -replace ".*:\s+",""
            }
        }
        WinRMService = Get-Service WinRM -ErrorAction SilentlyContinue | Select-Object Status, StartType
        WinRMConfig = winrm get winrm/config/service 2>$null | Where-Object { $_ -match "\S" } | Select-Object -First 10 | ForEach-Object { $_.Trim() }
        Summary = [PSCustomObject]@{
            CollectorRunning = $false
            WinRMRunning = $false
            Subscriptions = 0
            ActiveSubscriptions = 0
        }
    }
    $report.Summary.CollectorRunning = $report.CollectorService.Status -eq "Running"
    $report.Summary.WinRMRunning = $report.WinRMService.Status -eq "Running"
    $report.Summary.Subscriptions = ($report.Subscriptions | Measure-Object).Count
    $report.Summary.ActiveSubscriptions = ($report.Subscriptions | Where-Object Enabled -eq "true" | Measure-Object).Count
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Event Forwarding Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.Subscriptions) { $report.Subscriptions | Format-Table -AutoSize }
    return $report
}

Export-ModuleMember -Function *

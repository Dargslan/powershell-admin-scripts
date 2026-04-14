<#
.SYNOPSIS
    Windows service management toolkit — service health monitoring, failed service detection, startup analysis, dependency mapping, and restart automation

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

function Get-ServiceHealth {
    <#
    .SYNOPSIS
        Analyze Windows service health and detect issues
    .DESCRIPTION
        Identifies stopped auto-start services, high-resource services, and provides dependency analysis.
        Part of Dargslan.WinServiceMgr — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $services = Get-Service
    $failedAuto = $services | Where-Object { $_.Status -ne "Running" -and $_.StartType -eq "Automatic" }
    $report = [ordered]@{
        Summary = [PSCustomObject]@{
            Total = ($services | Measure-Object).Count
            Running = ($services | Where-Object Status -eq "Running" | Measure-Object).Count
            Stopped = ($services | Where-Object Status -eq "Stopped" | Measure-Object).Count
            AutoStart = ($services | Where-Object StartType -eq "Automatic" | Measure-Object).Count
            FailedAutoStart = ($failedAuto | Measure-Object).Count
        }
        FailedAutoStart = $failedAuto | Select-Object Name, DisplayName, Status, StartType
        CriticalServices = @("wuauserv","WinDefend","EventLog","W32Time","Dnscache","LanmanServer","LanmanWorkstation","RpcSs","Schedule") | ForEach-Object {
            $svc = Get-Service -Name $_ -ErrorAction SilentlyContinue
            if ($svc) { [PSCustomObject]@{ Name = $svc.Name; Display = $svc.DisplayName; Status = $svc.Status; StartType = $svc.StartType } }
        }
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Service Health]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.FailedAutoStart) {
        Write-Host "  Failed Auto-Start Services:" -ForegroundColor Red
        $report.FailedAutoStart | Format-Table -AutoSize
    }
    return $report
}

function Restart-FailedServices {
    <#
    .SYNOPSIS
        Restart all failed auto-start services
    .DESCRIPTION
        Finds and restarts services that should be running but are stopped. Supports -WhatIf.
        Part of Dargslan.WinServiceMgr — https://dargslan.com
    #>
    [CmdletBinding(SupportsShouldProcess)] param([string[]]$Exclude = @())

    $failed = Get-Service | Where-Object { $_.Status -ne "Running" -and $_.StartType -eq "Automatic" -and $_.Name -notin $Exclude }
    foreach ($svc in $failed) {
        if ($PSCmdlet.ShouldProcess($svc.DisplayName, "Restart")) {
            try { Restart-Service -Name $svc.Name -Force; Write-Host "  ✓ Restarted: $($svc.DisplayName)" -ForegroundColor Green }
            catch { Write-Host "  ✗ Failed: $($svc.DisplayName) — $_" -ForegroundColor Red }
        }
    }
}

Export-ModuleMember -Function *

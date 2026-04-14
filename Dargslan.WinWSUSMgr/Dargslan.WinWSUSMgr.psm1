<#
.SYNOPSIS
    WSUS server management toolkit — update compliance, client reporting, sync status, cleanup operations, and approval management

.DESCRIPTION
    Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-WSUSReport {
    <#
    .SYNOPSIS
        Generate WSUS server compliance report
    .DESCRIPTION
        Reports update synchronization status, client compliance, pending approvals, and server health.
        Part of Dargslan.WinWSUSMgr — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    try { [reflection.assembly]::LoadWithPartialName("Microsoft.UpdateServices.Administration") | Out-Null
        $wsus = [Microsoft.UpdateServices.Administration.AdminProxy]::GetUpdateServer()
    } catch { Write-Warning "WSUS not available: $_"; return }
    $report = [ordered]@{
        ServerInfo = [PSCustomObject]@{ Name = $wsus.Name; Version = $wsus.Version; PortNumber = $wsus.PortNumber; IsSSL = $wsus.UseSecureConnection }
        SyncStatus = $wsus.GetSubscription() | Select-Object LastSynchronizationTime, LastSuccessfulSynchronization, SynchronizationFrequency
        UpdateStats = [PSCustomObject]@{
            TotalUpdates = $wsus.GetUpdateCount()
            ApprovedUpdates = ($wsus.GetUpdates() | Where-Object IsApproved | Measure-Object).Count
            DeclinedUpdates = ($wsus.GetUpdates() | Where-Object IsDeclined | Measure-Object).Count
            NotApproved = ($wsus.GetUpdates() | Where-Object { -not $_.IsApproved -and -not $_.IsDeclined } | Measure-Object).Count
        }
        ComputerGroups = $wsus.GetComputerTargetGroups() | Select-Object Name, @{N="Computers";E={$_.GetComputerTargets().Count}}
        ClientSummary = [PSCustomObject]@{
            TotalClients = ($wsus.GetComputerTargets() | Measure-Object).Count
            LastContactWithin24h = ($wsus.GetComputerTargets() | Where-Object { $_.LastReportedStatusTime -gt (Get-Date).AddHours(-24) } | Measure-Object).Count
        }
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [WSUS Report]" -ForegroundColor Cyan
    $report.ServerInfo | Format-List
    $report.SyncStatus | Format-List
    $report.UpdateStats | Format-List
    $report.ComputerGroups | Format-Table -AutoSize
    return $report
}

Export-ModuleMember -Function *

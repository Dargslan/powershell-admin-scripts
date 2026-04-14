<#
.SYNOPSIS
    Windows Defender Application Control policy toolkit — WDAC policy audit, code integrity, smart app control, and application reputation (2026 Edition)

.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-WDACStatus {
    <#
    .SYNOPSIS
        Audit WDAC and code integrity policy status
    .DESCRIPTION
        Reports WDAC policy enforcement, code integrity events, Smart App Control status, and policy details.
        Part of Dargslan.WinWDAC (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([int]$EventDays = 7, [switch]$Json)

    $report = [ordered]@{
        CodeIntegrity = Get-CimInstance -ClassName Win32_DeviceGuard -Namespace root/Microsoft/Windows/DeviceGuard -ErrorAction SilentlyContinue | Select-Object CodeIntegrityPolicyEnforcementStatus, UsermodeCodeIntegrityPolicyEnforcementStatus
        SmartAppControl = try { Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\CI\Policy" -ErrorAction Stop | Select-Object VerifiedAndReputablePolicyState } catch { [PSCustomObject]@{ VerifiedAndReputablePolicyState = "Not configured" } }
        CIPolicies = Get-CIPolicy -ErrorAction SilentlyContinue | Select-Object PolicyID, IsEnforced, IsAuthorized, FriendlyName
        RecentBlocks = Get-WinEvent -FilterHashtable @{LogName="Microsoft-Windows-CodeIntegrity/Operational";StartTime=(Get-Date).AddDays(-$EventDays)} -MaxEvents 20 -ErrorAction SilentlyContinue | Select-Object TimeCreated, Id, LevelDisplayName, Message
        DriverBlocks = Get-CIPolicy -ErrorAction SilentlyContinue | Where-Object IsEnforced | Measure-Object | Select-Object Count
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [WDAC Status — 2026 Edition]" -ForegroundColor Cyan
    $report.CodeIntegrity | Format-List
    Write-Host "  Smart App Control: $($report.SmartAppControl.VerifiedAndReputablePolicyState)"
    if ($report.CIPolicies) { $report.CIPolicies | Format-Table -AutoSize }
    if ($report.RecentBlocks) { Write-Host "  Recent Code Integrity Events:" -ForegroundColor Yellow; $report.RecentBlocks | Select-Object -First 5 TimeCreated, LevelDisplayName | Format-Table -AutoSize }
    return $report
}

Export-ModuleMember -Function *

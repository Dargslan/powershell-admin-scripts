<#
.SYNOPSIS
    DCOM configuration audit toolkit — DCOM applications, launch permissions, access security, and attack surface assessment
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-DCOMAudit {
    <#
    .SYNOPSIS
        Audit DCOM application configuration and security
    .DESCRIPTION
        Part of Dargslan.WinDCOM (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        DCOMEnabled = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Ole" -ErrorAction SilentlyContinue).EnableDCOM
        DCOMApps = Get-CimInstance Win32_DCOMApplication -ErrorAction SilentlyContinue | Select-Object -First 30 AppID, Caption
        RPCService = Get-Service RpcSs -ErrorAction SilentlyContinue | Select-Object Status, StartType
        DCOMLaunchRestrictions = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Ole" -ErrorAction SilentlyContinue).MachineLaunchRestriction
        DCOMAccessRestrictions = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Ole" -ErrorAction SilentlyContinue).MachineAccessRestriction
        Summary = [PSCustomObject]@{ DCOMEnabled = ""; TotalApps = 0; RPCStatus = "" }
    }
    $report.Summary.DCOMEnabled = if($report.DCOMEnabled -eq "Y"){"Yes"}else{"No"}
    $report.Summary.TotalApps = ($report.DCOMApps | Measure-Object).Count
    $report.Summary.RPCStatus = $report.RPCService.Status
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [DCOM Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    $report.DCOMApps | Select-Object -First 15 | Format-Table -AutoSize
    return $report
}

Export-ModuleMember -Function *

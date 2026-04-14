<#
.SYNOPSIS
    Windows Local Group Policy editor toolkit — security options audit, user rights assignment, audit policy configuration, and local policy export (2026 Edition)

.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-LocalPolicyAudit {
    <#
    .SYNOPSIS
        Audit local security policies and user rights
    .DESCRIPTION
        Reports local security options, user rights assignments, audit policies, and security settings.
        Part of Dargslan.WinLocalGPO (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $report = [ordered]@{
        AccountPolicy = @()
        AuditPolicy = @()
        UserRights = @()
        SecurityOptions = @()
    }
    $netAccounts = net accounts 2>&1
    foreach ($line in $netAccounts) {
        if ($line -match ":\s+(.+)$") {
            $name = ($line -split ":")[0].Trim()
            $value = $Matches[1].Trim()
            $report.AccountPolicy += [PSCustomObject]@{ Setting = $name; Value = $value }
        }
    }
    $auditPol = auditpol /get /category:* 2>&1
    $report.AuditPolicy = $auditPol | Where-Object { $_ -match "^\s+\S" -and $_ -match "(Success|Failure|No Auditing)" } | ForEach-Object {
        $parts = $_ -split "\s{2,}"
        if ($parts.Count -ge 2) { [PSCustomObject]@{ Subcategory = $parts[0].Trim(); Setting = $parts[-1].Trim() } }
    }
    $secedit = secedit /export /cfg "$env:TEMP\secpol.cfg" /quiet 2>&1
    if (Test-Path "$env:TEMP\secpol.cfg") {
        $secCfg = Get-Content "$env:TEMP\secpol.cfg"
        $secCfg | Where-Object { $_ -match "^Se\w+\s*=" } | ForEach-Object {
            $parts = $_ -split "\s*=\s*"
            $report.UserRights += [PSCustomObject]@{ Right = $parts[0]; AssignedTo = $parts[1] }
        }
        Remove-Item "$env:TEMP\secpol.cfg" -Force -ErrorAction SilentlyContinue
    }
    $report.Summary = [PSCustomObject]@{ AccountPolicies = $report.AccountPolicy.Count; AuditPolicies = $report.AuditPolicy.Count; UserRights = $report.UserRights.Count }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Local Policy Audit — 2026 Edition]" -ForegroundColor Cyan
    $report.Summary | Format-List
    Write-Host "  Account Policy:" -ForegroundColor Yellow; $report.AccountPolicy | Format-Table -AutoSize
    Write-Host "  Audit Policy (non-default):" -ForegroundColor Yellow
    $report.AuditPolicy | Where-Object Setting -ne "No Auditing" | Format-Table -AutoSize
    return $report
}

Export-ModuleMember -Function *

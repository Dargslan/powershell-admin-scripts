<#
.SYNOPSIS
    Windows Group Policy audit toolkit — applied GPO listing, policy result analysis, security policy verification, and GPO export

.DESCRIPTION
    Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-GPOStatus {
    <#
    .SYNOPSIS
        Analyze applied Group Policy settings
    .DESCRIPTION
        Lists applied GPOs, checks policy results, and identifies security-relevant settings.
        Part of Dargslan.WinGPOAudit — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    Write-Host "`n  [Group Policy Audit]" -ForegroundColor Cyan
    $report = [ordered]@{}
    $rsop = gpresult /R 2>&1
    $report.RawOutput = $rsop -join "`n"
    $report.AppliedGPOs = @()
    $inGPO = $false
    foreach ($line in $rsop) {
        if ($line -match "Applied Group Policy Objects") { $inGPO = $true; continue }
        if ($inGPO -and $line -match "^\s{4,}(.+)$" -and $line -notmatch "---") { $report.AppliedGPOs += $Matches[1].Trim() }
        if ($inGPO -and $line -match "^\S") { $inGPO = $false }
    }
    $secPolicy = [ordered]@{}
    $auditPol = auditpol /get /category:* 2>&1
    $report.AuditPolicies = $auditPol | Where-Object { $_ -match "\S+\s+(Success|Failure|No Auditing|Success and Failure)" } | ForEach-Object {
        if ($_ -match "^\s+(.+?)\s{2,}(Success|Failure|No Auditing|Success and Failure)") {
            [PSCustomObject]@{ Category = $Matches[1].Trim(); Setting = $Matches[2] }
        }
    }
    $report.SecurityOptions = [PSCustomObject]@{
        PasswordComplexity = (net accounts 2>&1 | Select-String "Minimum password length").ToString().Trim()
        LockoutThreshold = (net accounts 2>&1 | Select-String "Lockout threshold").ToString().Trim()
        AccountLockout = (net accounts 2>&1 | Select-String "Lockout duration").ToString().Trim()
    }
    $report.Summary = [PSCustomObject]@{ AppliedGPOs = $report.AppliedGPOs.Count; AuditPolicies = ($report.AuditPolicies | Measure-Object).Count }
    if ($Json) { return $report | ConvertTo-Json -Depth 4 }
    $report.Summary | Format-List
    if ($report.AppliedGPOs) { Write-Host "  Applied GPOs:" -ForegroundColor Yellow; $report.AppliedGPOs | ForEach-Object { Write-Host "    - $_" } }
    $report.SecurityOptions | Format-List
    return $report
}

Export-ModuleMember -Function *

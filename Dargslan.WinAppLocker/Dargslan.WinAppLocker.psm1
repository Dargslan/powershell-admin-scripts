<#
.SYNOPSIS
    Windows AppLocker policy audit toolkit — rule inventory, policy effectiveness testing, event log analysis, and compliance reporting (2026 Edition)

.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-AppLockerAudit {
    <#
    .SYNOPSIS
        Audit AppLocker policies and enforcement
    .DESCRIPTION
        Reports AppLocker rules, enforcement mode, recent blocks, and policy effectiveness.
        Part of Dargslan.WinAppLocker (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([int]$EventDays = 7, [switch]$Json)

    $report = [ordered]@{
        ServiceStatus = Get-Service AppIDSvc -ErrorAction SilentlyContinue | Select-Object Status, StartType
        Policies = @()
        RecentBlocks = @()
        Summary = [PSCustomObject]@{ RuleCollections = 0; TotalRules = 0; EnforcedCollections = 0; BlockedEvents = 0 }
    }
    $collections = @("Exe","Msi","Script","Dll","Appx")
    foreach ($col in $collections) {
        $policy = Get-AppLockerPolicy -Effective -ErrorAction SilentlyContinue | Select-Object -ExpandProperty RuleCollections | Where-Object RuleCollectionType -eq $col
        if ($policy) {
            $report.Policies += [PSCustomObject]@{
                Collection = $col; Mode = $policy.EnforcementMode
                RuleCount = ($policy | Select-Object -ExpandProperty Rules -ErrorAction SilentlyContinue | Measure-Object).Count
            }
            $report.Summary.RuleCollections++
            $report.Summary.TotalRules += ($policy | Select-Object -ExpandProperty Rules -ErrorAction SilentlyContinue | Measure-Object).Count
            if ($policy.EnforcementMode -eq "Enabled") { $report.Summary.EnforcedCollections++ }
        }
    }
    $since = (Get-Date).AddDays(-$EventDays)
    $blockEvents = Get-WinEvent -FilterHashtable @{LogName="Microsoft-Windows-AppLocker/EXE and DLL";StartTime=$since;Level=3} -MaxEvents 20 -ErrorAction SilentlyContinue
    $report.RecentBlocks = $blockEvents | Select-Object TimeCreated, @{N="User";E={$_.Properties[0].Value}}, @{N="File";E={$_.Properties[1].Value}}, Message
    $report.Summary.BlockedEvents = ($blockEvents | Measure-Object).Count
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [AppLocker Audit — 2026 Edition]" -ForegroundColor Cyan
    Write-Host "  Service: $($report.ServiceStatus.Status)"
    $report.Policies | Format-Table -AutoSize
    Write-Host "  Blocked events (last $EventDays days): $($report.Summary.BlockedEvents)"
    if ($report.RecentBlocks) { $report.RecentBlocks | Select-Object -First 5 TimeCreated, File | Format-Table -AutoSize }
    return $report
}

Export-ModuleMember -Function *

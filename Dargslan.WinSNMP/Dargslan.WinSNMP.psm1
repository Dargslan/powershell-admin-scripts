function Get-SNMPAudit {
    <#
    .SYNOPSIS
        Audit SNMP configuration and community strings
    .DESCRIPTION
        Windows SNMP service audit toolkit — SNMP communities, trap destinations, permitted managers, agent configuration, and security
        Part of the Dargslan Windows Admin Toolkit — https://dargslan.com
    .PARAMETER Json
        Output results as JSON
    .EXAMPLE
        Get-SNMPAudit
    .EXAMPLE
        Get-SNMPAudit -Json
    .LINK
        https://dargslan.com
    .LINK
        https://www.powershellgallery.com/profiles/Dargslan
    #>
    [CmdletBinding()]
    param([switch]$Json)

    $report = [ordered]@{
        Service = Get-Service SNMP -ErrorAction SilentlyContinue | Select-Object Status, StartType
        TrapService = Get-Service SNMPTRAP -ErrorAction SilentlyContinue | Select-Object Status, StartType
        Communities = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\ValidCommunities" -ErrorAction SilentlyContinue).PSObject.Properties | Where-Object { $_.Name -notmatch "^PS" } | ForEach-Object { [PSCustomObject]@{ Community = $_.Name; AccessLevel = $_.Value } }
        PermittedManagers = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\PermittedManagers" -ErrorAction SilentlyContinue).PSObject.Properties | Where-Object { $_.Name -match "^\d" } | ForEach-Object { $_.Value }
        TrapConfig = Get-ChildItem "HKLM:\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\TrapConfiguration" -ErrorAction SilentlyContinue | ForEach-Object { [PSCustomObject]@{ Community = $_.PSChildName; Destinations = (Get-ItemProperty $_.PSPath -ErrorAction SilentlyContinue).PSObject.Properties | Where-Object { $_.Name -match "^\d" } | ForEach-Object { $_.Value } } }
        Warnings = @()
    }
    $report.Communities | Where-Object { $_.Community -match "^(public|private|community)$" } | ForEach-Object { $report.Warnings += "Default community string detected: $($_.Community)" }
    $report.Summary = [PSCustomObject]@{ ServiceRunning = $report.Service.Status -eq "Running"; CommunityCount = ($report.Communities | Measure-Object).Count; TrapServiceRunning = $report.TrapService.Status -eq "Running" }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [SNMP Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.Communities) { $report.Communities | Format-Table -AutoSize }
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function Get-SNMPAudit

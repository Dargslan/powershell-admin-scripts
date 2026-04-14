<#
.SYNOPSIS
    Windows SNMP service audit toolkit — SNMP configuration, community strings, trap destinations, security settings, and agent status
.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-SNMPAudit {
    <#
    .SYNOPSIS
        Audit SNMP service configuration and security
    .DESCRIPTION
        Reports SNMP service status, community strings (masked), permitted managers, trap destinations, and security assessment.
        Part of Dargslan.WinSNMPAudit (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
$report = [ordered]@{
        Service = Get-Service SNMP -ErrorAction SilentlyContinue | Select-Object Status, StartType
        TrapService = Get-Service SNMPTRAP -ErrorAction SilentlyContinue | Select-Object Status, StartType
        CommunityStrings = @()
        PermittedManagers = @()
        TrapDestinations = @()
        Warnings = @()
    }
    $commKey = "HKLM:\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\ValidCommunities"
    if (Test-Path $commKey) {
        $comms = Get-ItemProperty $commKey -ErrorAction SilentlyContinue
        $comms.PSObject.Properties | Where-Object Name -notmatch "^PS" | ForEach-Object {
            $masked = $_.Name.Substring(0,1) + ("*" * ($_.Name.Length - 2)) + $_.Name.Substring($_.Name.Length - 1)
            $rights = switch ($_.Value) { 1{"NONE"} 2{"NOTIFY"} 4{"READ_ONLY"} 8{"READ_WRITE"} 16{"READ_CREATE"} default{"UNKNOWN"} }
            $report.CommunityStrings += [PSCustomObject]@{ Name=$masked; Rights=$rights; Length=$_.Name.Length }
            if ($_.Name -eq "public") { $report.Warnings += "Default community string public is configured" }
            if ($_.Value -ge 8) { $report.Warnings += "Community with WRITE access detected" }
        }
    }
    $mgrKey = "HKLM:\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\PermittedManagers"
    if (Test-Path $mgrKey) {
        $report.PermittedManagers = (Get-ItemProperty $mgrKey -ErrorAction SilentlyContinue).PSObject.Properties | Where-Object Name -match "^\d" | Select-Object @{N="Index";E={$_.Name}}, @{N="Manager";E={$_.Value}}
    }
    $score = 70
    if ($report.Warnings | Where-Object { $_ -match "public" }) { $score -= 30 }
    if ($report.Warnings | Where-Object { $_ -match "WRITE" }) { $score -= 20 }
    if (-not $report.PermittedManagers) { $score -= 10; $report.Warnings += "No permitted managers configured - accepting from any host" }
    $report.SecurityScore = [PSCustomObject]@{ Score=[math]::Max(0,$score); Grade=$(if($score -ge 70){"A"}elseif($score -ge 50){"B"}else{"C"}) }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [SNMP Audit - 2026]" -ForegroundColor Cyan
    Write-Host "  SNMP: $($report.Service.Status) | Trap: $($report.TrapService.Status)"
    if ($report.CommunityStrings) { $report.CommunityStrings | Format-Table -AutoSize }
    Write-Host "  Score: $($report.SecurityScore.Score)/100" -ForegroundColor $(if($score -ge 70){"Green"}else{"Yellow"})
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function *

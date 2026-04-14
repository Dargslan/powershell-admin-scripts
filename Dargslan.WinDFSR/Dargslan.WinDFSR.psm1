function Get-DFSRAudit {
    <#
    .SYNOPSIS
        Audit DFS Replication groups and health
    .DESCRIPTION
        Windows DFS Replication audit toolkit — replication groups, folders, connections, backlog, health, and throttling
        Part of the Dargslan Windows Admin Toolkit — https://dargslan.com
    .PARAMETER Json
        Output results as JSON
    .EXAMPLE
        Get-DFSRAudit
    .EXAMPLE
        Get-DFSRAudit -Json
    .LINK
        https://dargslan.com
    #>
    [CmdletBinding()]
    param([switch]$Json)

    $report = [ordered]@{
        Service = Get-Service DFSR -ErrorAction SilentlyContinue | Select-Object Status, StartType
        Groups = Get-DfsReplicationGroup -ErrorAction SilentlyContinue | Select-Object GroupName, DomainName, Description
        Folders = Get-DfsReplicatedFolder -ErrorAction SilentlyContinue | Select-Object GroupName, FolderName, DfsnPath
        Connections = Get-DfsrConnection -ErrorAction SilentlyContinue | Select-Object GroupName, SourceComputerName, DestinationComputerName, Enabled | Select-Object -First 20
        Members = Get-DfsrMember -ErrorAction SilentlyContinue | Select-Object GroupName, ComputerName, DnsName
        Warnings = @()
    }
    if ($report.Service.Status -ne "Running") { $report.Warnings += "DFSR service is not running" }
    $report.Summary = [PSCustomObject]@{ ServiceRunning = $report.Service.Status -eq "Running"; GroupCount = ($report.Groups | Measure-Object).Count; FolderCount = ($report.Folders | Measure-Object).Count }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [DFSR Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.Groups) { $report.Groups | Format-Table -AutoSize }
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function Get-DFSRAudit

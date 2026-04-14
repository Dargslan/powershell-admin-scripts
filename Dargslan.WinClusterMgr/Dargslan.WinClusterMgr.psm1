<#
.SYNOPSIS
    Windows Failover Cluster management toolkit — cluster health, node status, resource group monitoring, quorum, and shared volume audit

.DESCRIPTION
    Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-ClusterReport {
    <#
    .SYNOPSIS
        Generate Windows Failover Cluster health report
    .DESCRIPTION
        Reports cluster status, node health, resource groups, quorum configuration, and CSV status.
        Part of Dargslan.WinClusterMgr — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $cluster = Get-Cluster -ErrorAction SilentlyContinue
    if (-not $cluster) { Write-Warning "No cluster configured or Failover Clustering not installed"; return }
    $report = [ordered]@{
        Cluster = [PSCustomObject]@{ Name = $cluster.Name; Domain = $cluster.Domain; SharedVolumesEnabled = $cluster.SharedVolumesRoot }
        Nodes = Get-ClusterNode -ErrorAction SilentlyContinue | Select-Object Name, State, NodeWeight, DynamicWeight
        Groups = Get-ClusterGroup -ErrorAction SilentlyContinue | Select-Object Name, State, OwnerNode, Priority, AutoFailbackType
        Resources = Get-ClusterResource -ErrorAction SilentlyContinue | Select-Object Name, ResourceType, State, OwnerGroup, OwnerNode
        Quorum = Get-ClusterQuorum -ErrorAction SilentlyContinue | Select-Object @{N="Type";E={$_.QuorumType}}, @{N="Resource";E={$_.QuorumResource.Name}}
        CSVs = Get-ClusterSharedVolume -ErrorAction SilentlyContinue | ForEach-Object {
            $info = $_ | Select-Object -ExpandProperty SharedVolumeInfo
            [PSCustomObject]@{ Name = $_.Name; State = $_.State; Node = $_.OwnerNode.Name; Path = $info.FriendlyVolumeName; FreeGB = [math]::Round($info.Partition.FreeSpace/1GB,1); SizeGB = [math]::Round($info.Partition.Size/1GB,1) }
        }
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Cluster Report: $($report.Cluster.Name)]" -ForegroundColor Cyan
    $report.Nodes | Format-Table -AutoSize
    $report.Groups | Format-Table -AutoSize
    if ($report.CSVs) { Write-Host "  Cluster Shared Volumes:" -ForegroundColor Yellow; $report.CSVs | Format-Table -AutoSize }
    return $report
}

Export-ModuleMember -Function *

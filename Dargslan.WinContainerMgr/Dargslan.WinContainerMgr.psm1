<#
.SYNOPSIS
    Windows container and Docker Desktop management toolkit — container inventory, image audit, network inspection, volume management, and resource monitoring (2026 Edition)

.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-ContainerReport {
    <#
    .SYNOPSIS
        Generate Windows container environment report
    .DESCRIPTION
        Reports Docker/container status, running containers, images, volumes, networks, and resource usage.
        Part of Dargslan.WinContainerMgr (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $dockerPath = Get-Command docker -ErrorAction SilentlyContinue
    if (-not $dockerPath) { Write-Warning "Docker not found. Install Docker Desktop or Docker Engine."; return }
    $report = [ordered]@{
        DockerInfo = docker info --format "{{json .}}" 2>$null | ConvertFrom-Json -ErrorAction SilentlyContinue | Select-Object ServerVersion, OperatingSystem, OSType, Architecture, NCPU, MemTotal, ContainersRunning, ContainersPaused, ContainersStopped, Images
        Containers = docker ps -a --format "{{json .}}" 2>$null | ForEach-Object { $_ | ConvertFrom-Json } | Select-Object Names, Image, Status, Ports, Size, State, CreatedAt
        Images = docker images --format "{{json .}}" 2>$null | ForEach-Object { $_ | ConvertFrom-Json } | Select-Object Repository, Tag, Size, CreatedAt, ID
        Volumes = docker volume ls --format "{{json .}}" 2>$null | ForEach-Object { $_ | ConvertFrom-Json } | Select-Object Name, Driver, Mountpoint
        Networks = docker network ls --format "{{json .}}" 2>$null | ForEach-Object { $_ | ConvertFrom-Json } | Select-Object Name, Driver, Scope, ID
        DiskUsage = docker system df --format "{{json .}}" 2>$null | ForEach-Object { $_ | ConvertFrom-Json }
        Summary = [PSCustomObject]@{
            Running = (docker ps -q 2>$null | Measure-Object).Count
            Stopped = (docker ps -aq --filter "status=exited" 2>$null | Measure-Object).Count
            Images = (docker images -q 2>$null | Measure-Object).Count
            Volumes = (docker volume ls -q 2>$null | Measure-Object).Count
            DanglingImages = (docker images -f "dangling=true" -q 2>$null | Measure-Object).Count
        }
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 4 }
    Write-Host "`n  [Container Report — 2026 Edition]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.Containers) { Write-Host "  Containers:" -ForegroundColor Yellow; $report.Containers | Format-Table Names, Image, Status, Ports -AutoSize }
    if ($report.Summary.DanglingImages -gt 0) { Write-Host "  Warning: $($report.Summary.DanglingImages) dangling images found — run docker image prune" -ForegroundColor Yellow }
    Write-Host "`n  dargslan.com — Windows Admin Toolkit 2026" -ForegroundColor DarkGray
    return $report
}

function Invoke-ContainerCleanup {
    <#
    .SYNOPSIS
        Clean up unused Docker resources
    .DESCRIPTION
        Removes stopped containers, dangling images, unused volumes and networks to reclaim disk space.
        Part of Dargslan.WinContainerMgr (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding(SupportsShouldProcess)] param([switch]$All, [switch]$Force)

    Write-Host "  [Container Cleanup]" -ForegroundColor Cyan
    if ($PSCmdlet.ShouldProcess("Stopped containers", "Remove")) {
        $stopped = docker ps -aq --filter "status=exited" 2>$null
        if ($stopped) { docker rm $stopped 2>$null; Write-Host "  Removed stopped containers" -ForegroundColor Green }
    }
    if ($PSCmdlet.ShouldProcess("Dangling images", "Remove")) {
        docker image prune -f 2>$null | Out-Null; Write-Host "  Pruned dangling images" -ForegroundColor Green
    }
    if ($All -and $PSCmdlet.ShouldProcess("All unused resources", "Remove")) {
        $forceFlag = if ($Force) { "--force" } else { "" }
        docker system prune -a $forceFlag 2>$null; Write-Host "  Full system prune complete" -ForegroundColor Green
    }
    Write-Host "  Cleanup complete" -ForegroundColor Cyan
}

Export-ModuleMember -Function *

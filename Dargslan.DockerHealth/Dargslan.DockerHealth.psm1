<#
.SYNOPSIS
    Check Docker Desktop and container engine health on Windows

.DESCRIPTION
    Part of the Dargslan Windows Admin Tools collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
    Linux & DevOps Books: https://dargslan.com/books

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-DockerHealth {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Docker Health
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $docker = Get-Command docker -ErrorAction SilentlyContinue; if (-not $docker) { Write-Host "Docker not installed" -ForegroundColor Red; return }; $version = docker version --format "{{.Server.Version}}" 2>$null; $info = docker info --format "{{.ContainersRunning}} running, {{.ContainersStopped}} stopped, {{.Images}} images" 2>$null; Write-Host "`n[Docker] Version: $version" -ForegroundColor Yellow; Write-Host "[Docker] $info" -ForegroundColor Cyan; docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}" 2>$null
}


Export-ModuleMember -Function *

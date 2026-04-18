<#
.SYNOPSIS
    Audit Docker and container security on Windows

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

function Get-ContainerAudit {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Container Security Auditor                    ║
║  More tools: https://dargslan.com                       ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $docker = Get-Command docker -ErrorAction SilentlyContinue
    if (-not $docker) { Write-Host "Docker not found on this system" -ForegroundColor Red; return }
    $containers = docker ps -a --format "{{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}" 2>$null
    $images = docker images --format "{{.Repository}}\t{{.Tag}}\t{{.Size}}\t{{.CreatedAt}}" 2>$null
    Write-Host "`n[Containers]" -ForegroundColor Yellow
    if ($containers) { $containers | ForEach-Object { Write-Host "  $_" } } else { Write-Host "  No containers found" }
    Write-Host "`n[Images]" -ForegroundColor Yellow
    if ($images) { $images | ForEach-Object { Write-Host "  $_" } } else { Write-Host "  No images found" }
    $danglingImages = docker images -f "dangling=true" -q 2>$null
    if ($danglingImages) { Write-Host "`n[Warning] $(@($danglingImages).Count) dangling image(s) found" -ForegroundColor Red }
}

Export-ModuleMember -Function *

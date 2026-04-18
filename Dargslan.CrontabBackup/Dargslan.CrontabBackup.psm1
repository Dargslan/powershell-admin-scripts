<#
.SYNOPSIS
    Backup and export Windows scheduled task definitions

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

function Backup-ScheduledTasks {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Crontab Backup
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $outDir = Join-Path $PWD "task-backups"; if (-not (Test-Path $outDir)) { New-Item -ItemType Directory -Path $outDir | Out-Null }; $tasks = Get-ScheduledTask -ErrorAction SilentlyContinue; $count = 0; foreach ($t in $tasks) { try { Export-ScheduledTask -TaskName $t.TaskName -TaskPath $t.TaskPath | Out-File (Join-Path $outDir "$($t.TaskName).xml") -Force; $count++ } catch {} }; Write-Host "`n[Backup] Exported $count task(s) to $outDir" -ForegroundColor Green
}


Export-ModuleMember -Function *

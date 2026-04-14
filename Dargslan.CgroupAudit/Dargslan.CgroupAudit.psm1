<#
.SYNOPSIS
    Audit Windows Job Objects and resource control groups

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

function Get-ResourceLimits {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Cgroup Audit
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $procs = Get-Process | Where-Object { $_.PriorityClass } | Group-Object PriorityClass | Select-Object @{N="Priority";E={$_.Name}}, Count | Sort-Object Count -Descending; Write-Host "`n[Process Priorities]" -ForegroundColor Yellow; $procs | Format-Table -AutoSize
}


Export-ModuleMember -Function *

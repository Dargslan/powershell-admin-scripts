<#
.SYNOPSIS
    Analyze system load, CPU queue length, and bottlenecks

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

function Get-SystemLoad {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Load Average
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $cpu = Get-CimInstance Win32_Processor | Measure-Object -Property LoadPercentage -Average; $os = Get-CimInstance Win32_OperatingSystem; $memUsed = [math]::Round(($os.TotalVisibleMemorySize - $os.FreePhysicalMemory) / $os.TotalVisibleMemorySize * 100, 1); $procs = (Get-Process).Count; $threads = (Get-Process | ForEach-Object { $_.Threads.Count } | Measure-Object -Sum).Sum; [PSCustomObject]@{"CPU Load%" = [math]::Round($cpu.Average, 1); "Memory Used%" = $memUsed; Processes = $procs; Threads = $threads; Uptime = ((Get-Date) - $os.LastBootUpTime).ToString("dd\.hh\:mm")} | Format-List
}


Export-ModuleMember -Function *

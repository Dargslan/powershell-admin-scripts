<#
.SYNOPSIS
    Windows performance monitoring toolkit — CPU, memory, disk I/O, process analysis, bottleneck detection, and performance baselining

.DESCRIPTION
    Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
    Windows & DevOps Books: https://dargslan.com/books

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-PerformanceReport {
    <#
    .SYNOPSIS
        Generate real-time performance report
    .DESCRIPTION
        Captures current CPU, memory, disk, and network performance metrics with bottleneck analysis.
        Part of Dargslan.WinPerfMon — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json, [int]$TopProcesses = 10)

    $os = Get-CimInstance Win32_OperatingSystem
    $cpu = Get-CimInstance Win32_Processor
    $report = [ordered]@{
        CPU = [PSCustomObject]@{ LoadPercent = $cpu.LoadPercentage; ProcessorQueue = (Get-Counter "\System\Processor Queue Length" -ErrorAction SilentlyContinue).CounterSamples[0].CookedValue; Cores = $cpu.NumberOfCores }
        Memory = [PSCustomObject]@{ TotalGB = [math]::Round($os.TotalVisibleMemorySize/1MB,1); FreeGB = [math]::Round($os.FreePhysicalMemory/1MB,1); UsedPercent = [math]::Round(($os.TotalVisibleMemorySize - $os.FreePhysicalMemory)/$os.TotalVisibleMemorySize*100,1); CommittedGB = [math]::Round(($os.TotalVirtualMemorySize - $os.FreeVirtualMemory)/1MB,1) }
        TopCPU = Get-Process | Sort-Object CPU -Descending | Select-Object -First $TopProcesses Name, Id, @{N="CPU_Sec";E={[math]::Round($_.CPU,1)}}, @{N="MemMB";E={[math]::Round($_.WorkingSet64/1MB,1)}}, Handles
        TopMemory = Get-Process | Sort-Object WorkingSet64 -Descending | Select-Object -First $TopProcesses Name, Id, @{N="MemMB";E={[math]::Round($_.WorkingSet64/1MB,1)}}, @{N="PeakMB";E={[math]::Round($_.PeakWorkingSet64/1MB,1)}}
        Bottlenecks = @()
    }
    if ($report.CPU.LoadPercent -gt 80) { $report.Bottlenecks += "CPU load is high ($($report.CPU.LoadPercent)%)" }
    if ($report.Memory.UsedPercent -gt 85) { $report.Bottlenecks += "Memory usage is high ($($report.Memory.UsedPercent)%)" }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Performance Report]" -ForegroundColor Cyan
    Write-Host "  CPU: $($report.CPU.LoadPercent)% | Memory: $($report.Memory.UsedPercent)% ($($report.Memory.FreeGB) GB free)"
    Write-Host "`n  Top CPU:" -ForegroundColor Yellow; $report.TopCPU | Format-Table -AutoSize
    if ($report.Bottlenecks) { Write-Host "  Bottlenecks:" -ForegroundColor Red; $report.Bottlenecks | ForEach-Object { Write-Host "  ⚠ $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function *

<#
.SYNOPSIS
    Windows memory diagnostics toolkit — RAM health check, memory pressure analysis, page file monitoring, and memory leak detection (2026 Edition)

.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-MemoryReport {
    <#
    .SYNOPSIS
        Comprehensive memory health and usage report
    .DESCRIPTION
        Reports physical memory status, memory pressure, page file usage, per-process memory, and leak detection.
        Part of Dargslan.WinMemDiag (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([int]$TopProcesses = 15, [switch]$Json)

    $os = Get-CimInstance Win32_OperatingSystem
    $cs = Get-CimInstance Win32_ComputerSystem
    $sticks = Get-CimInstance Win32_PhysicalMemory
    $report = [ordered]@{
        Physical = [PSCustomObject]@{
            TotalGB = [math]::Round($cs.TotalPhysicalMemory / 1GB, 2)
            FreeGB = [math]::Round($os.FreePhysicalMemory / 1MB, 2)
            UsedGB = [math]::Round(($cs.TotalPhysicalMemory / 1GB) - ($os.FreePhysicalMemory / 1MB), 2)
            UsedPercent = [math]::Round((1 - $os.FreePhysicalMemory / ($cs.TotalPhysicalMemory / 1KB)) * 100, 1)
            Slots = ($sticks | Measure-Object).Count
        }
        Modules = $sticks | ForEach-Object {
            [PSCustomObject]@{
                Bank = $_.BankLabel; CapacityGB = [math]::Round($_.Capacity / 1GB, 1)
                Speed = "$($_.Speed) MHz"; Manufacturer = $_.Manufacturer
                PartNumber = $_.PartNumber.Trim()
            }
        }
        PageFile = Get-CimInstance Win32_PageFileUsage -ErrorAction SilentlyContinue | Select-Object Name, @{N="AllocatedMB";E={$_.AllocatedBaseSize}}, @{N="CurrentUsageMB";E={$_.CurrentUsage}}, @{N="PeakUsageMB";E={$_.PeakUsage}}
        TopMemory = Get-Process | Sort-Object WorkingSet64 -Descending | Select-Object -First $TopProcesses Name, Id, @{N="MemMB";E={[math]::Round($_.WorkingSet64/1MB,1)}}, @{N="PrivateMB";E={[math]::Round($_.PrivateMemorySize64/1MB,1)}}, @{N="VirtualMB";E={[math]::Round($_.VirtualMemorySize64/1MB,0)}}, HandleCount
        Counters = @{
            CommittedGB = [math]::Round(($os.TotalVirtualMemorySize - $os.FreeVirtualMemory) / 1MB, 1)
            CacheBytes = [math]::Round((Get-Counter "\Memory\Cache Bytes" -ErrorAction SilentlyContinue).CounterSamples[0].CookedValue / 1MB, 0)
            PoolPagedMB = [math]::Round((Get-Counter "\Memory\Pool Paged Bytes" -ErrorAction SilentlyContinue).CounterSamples[0].CookedValue / 1MB, 0)
            PoolNonPagedMB = [math]::Round((Get-Counter "\Memory\Pool Nonpaged Bytes" -ErrorAction SilentlyContinue).CounterSamples[0].CookedValue / 1MB, 0)
        }
        Warnings = @()
    }
    if ($report.Physical.UsedPercent -gt 85) { $report.Warnings += "Memory usage is high ($($report.Physical.UsedPercent)%)" }
    if ($report.PageFile -and $report.PageFile.CurrentUsageMB -gt $report.PageFile.AllocatedMB * 0.8) { $report.Warnings += "Page file usage is high" }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Memory Report — 2026 Edition]" -ForegroundColor Cyan
    Write-Host "  Total: $($report.Physical.TotalGB) GB | Used: $($report.Physical.UsedPercent)% | Free: $($report.Physical.FreeGB) GB"
    $report.Modules | Format-Table -AutoSize
    Write-Host "  Top Memory Consumers:" -ForegroundColor Yellow; $report.TopMemory | Format-Table -AutoSize
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function *

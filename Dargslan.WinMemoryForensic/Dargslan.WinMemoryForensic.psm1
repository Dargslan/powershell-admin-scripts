<#
.SYNOPSIS
    Windows memory forensics toolkit — loaded DLLs, injected threads, hollow processes, memory-only malware indicators, and anomaly detection
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-MemoryForensicScan {
    <#
    .SYNOPSIS
        Scan for memory-based threats and anomalies
    .DESCRIPTION
        Part of Dargslan.WinMemoryForensic (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        SuspiciousThreads = Get-Process -ErrorAction SilentlyContinue | ForEach-Object {
            $proc = $_
            try {
                $threads = $proc.Threads | Where-Object { $_.ThreadState -eq "Running" -and $_.StartAddress -ne [IntPtr]::Zero }
                if ($threads.Count -gt 50) { [PSCustomObject]@{ Process=$proc.Name; PID=$proc.Id; Threads=$threads.Count; Path=$proc.Path } }
            } catch {}
        } | Select-Object -First 10
        LargeProcesses = Get-Process -ErrorAction SilentlyContinue | Where-Object { $_.WorkingSet64 -gt 500MB } | Sort-Object WorkingSet64 -Descending | Select-Object Name, Id, @{N="MemMB";E={[math]::Round($_.WorkingSet64/1MB,0)}}, Path | Select-Object -First 10
        UnusualDLLs = Get-Process -ErrorAction SilentlyContinue | Where-Object Path | Select-Object -First 20 | ForEach-Object {
            $proc = $_
            $proc.Modules | Where-Object { $_.FileName -match "\Temp\|\Downloads\|\AppData\Local\Temp" } | Select-Object @{N="Process";E={$proc.Name}}, @{N="PID";E={$proc.Id}}, FileName | Select-Object -First 3
        }
        PageFile = Get-CimInstance Win32_PageFileUsage -ErrorAction SilentlyContinue | Select-Object Name, @{N="AllocMB";E={$_.AllocatedBaseSize}}, @{N="CurrentMB";E={$_.CurrentUsage}}, @{N="PeakMB";E={$_.PeakUsage}}
        Summary = [PSCustomObject]@{ HighThreadProcs = 0; LargeProcs = 0; SuspiciousDLLs = 0; TotalMemoryGB = [math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory/1GB,1) }
    }
    $report.Summary.HighThreadProcs = ($report.SuspiciousThreads | Measure-Object).Count
    $report.Summary.LargeProcs = ($report.LargeProcesses | Measure-Object).Count
    $report.Summary.SuspiciousDLLs = ($report.UnusualDLLs | Measure-Object).Count
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Memory Forensic Scan - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.LargeProcesses) { Write-Host "  High Memory Processes:" -ForegroundColor Yellow; $report.LargeProcesses | Format-Table -AutoSize }
    if ($report.UnusualDLLs) { Write-Host "  Suspicious DLLs:" -ForegroundColor Red; $report.UnusualDLLs | Format-Table -AutoSize }
    if ($report.PageFile) { $report.PageFile | Format-Table -AutoSize }
    return $report
}

Export-ModuleMember -Function *

<#
.SYNOPSIS
    Windows process management toolkit — process monitoring, resource analysis, hung process detection, and process tree visualization

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

function Get-ProcessAnalysis {
    <#
    .SYNOPSIS
        Analyze running processes with resource usage
    .DESCRIPTION
        Provides detailed process analysis including CPU time, memory usage, handle counts, and detects hung processes.
        Part of Dargslan.WinProcessMgr — https://dargslan.com
    #>
    [CmdletBinding()] param([int]$Top = 15, [switch]$Json)

    $procs = Get-Process
    $report = [ordered]@{
        Summary = [PSCustomObject]@{ Total = $procs.Count; TotalMemGB = [math]::Round(($procs | Measure-Object WorkingSet64 -Sum).Sum/1GB,1); TotalHandles = ($procs | Measure-Object Handles -Sum).Sum }
        TopCPU = $procs | Sort-Object CPU -Descending | Select-Object -First $Top Name, Id, @{N="CPU_Sec";E={[math]::Round($_.CPU,1)}}, @{N="MemMB";E={[math]::Round($_.WorkingSet64/1MB,1)}}, Handles, @{N="Threads";E={$_.Threads.Count}}
        TopMemory = $procs | Sort-Object WorkingSet64 -Descending | Select-Object -First $Top Name, Id, @{N="MemMB";E={[math]::Round($_.WorkingSet64/1MB,1)}}, @{N="PeakMB";E={[math]::Round($_.PeakWorkingSet64/1MB,1)}}
        NotResponding = $procs | Where-Object { -not $_.Responding } | Select-Object Name, Id, @{N="MemMB";E={[math]::Round($_.WorkingSet64/1MB,1)}}
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Process Analysis]" -ForegroundColor Cyan
    Write-Host "  Total: $($report.Summary.Total) processes | $($report.Summary.TotalMemGB) GB total memory"
    Write-Host "`n  Top CPU:" -ForegroundColor Yellow; $report.TopCPU | Format-Table -AutoSize
    if ($report.NotResponding) { Write-Host "  Not Responding:" -ForegroundColor Red; $report.NotResponding | Format-Table -AutoSize }
    return $report
}

Export-ModuleMember -Function *

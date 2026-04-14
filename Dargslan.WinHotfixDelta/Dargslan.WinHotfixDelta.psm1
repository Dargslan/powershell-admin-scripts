<#
.SYNOPSIS
    Windows hotfix delta analysis toolkit — patch gap detection, superseded updates, rollback history, and servicing stack analysis
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-HotfixDeltaAnalysis {
    <#
    .SYNOPSIS
        Analyze hotfix gaps, superseded patches, and servicing
    .DESCRIPTION
        Part of Dargslan.WinHotfixDelta (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        AllHotfixes = Get-HotFix -ErrorAction SilentlyContinue | Sort-Object InstalledOn -Descending | Select-Object HotFixID, Description, InstalledOn, InstalledBy
        PatchGaps = @()
        ServicingStack = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing" -ErrorAction SilentlyContinue)
        PendingReboot = [PSCustomObject]@{
            ComponentBased = Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\RebootPending"
            WindowsUpdate = Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired"
            PendingRename = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager" -ErrorAction SilentlyContinue).PendingFileRenameOperations -ne $null
        }
        Summary = [PSCustomObject]@{ TotalHotfixes = 0; OldestPatch = ""; NewestPatch = ""; PatchSpanDays = 0; RebootPending = $false }
    }
    $hf = $report.AllHotfixes | Where-Object InstalledOn
    $report.Summary.TotalHotfixes = ($report.AllHotfixes | Measure-Object).Count
    if ($hf.Count -gt 0) {
        $oldest = ($hf | Sort-Object InstalledOn | Select-Object -First 1).InstalledOn
        $newest = ($hf | Sort-Object InstalledOn -Descending | Select-Object -First 1).InstalledOn
        $report.Summary.OldestPatch = $oldest.ToString("yyyy-MM-dd")
        $report.Summary.NewestPatch = $newest.ToString("yyyy-MM-dd")
        $report.Summary.PatchSpanDays = [math]::Round(($newest - $oldest).TotalDays, 0)
        $sorted = $hf | Sort-Object InstalledOn
        for ($i = 1; $i -lt [math]::Min($sorted.Count, 30); $i++) {
            $gap = ($sorted[$i].InstalledOn - $sorted[$i-1].InstalledOn).TotalDays
            if ($gap -gt 45) { $report.PatchGaps += [PSCustomObject]@{ From=$sorted[$i-1].InstalledOn.ToString("yyyy-MM-dd"); To=$sorted[$i].InstalledOn.ToString("yyyy-MM-dd"); DaysGap=[math]::Round($gap,0) } }
        }
    }
    $report.Summary.RebootPending = $report.PendingReboot.ComponentBased -or $report.PendingReboot.WindowsUpdate
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Hotfix Delta Analysis - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.PatchGaps) { Write-Host "  Patch Gaps (>45 days):" -ForegroundColor Yellow; $report.PatchGaps | Format-Table -AutoSize }
    $report.PendingReboot | Format-List
    $report.AllHotfixes | Select-Object -First 10 | Format-Table -AutoSize
    return $report
}

Export-ModuleMember -Function *

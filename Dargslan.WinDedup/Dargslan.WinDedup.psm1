function Get-DedupAudit {
    <#
    .SYNOPSIS
        Audit Data Deduplication volumes and savings
    .DESCRIPTION
        Windows Data Deduplication audit toolkit — volumes, savings ratios, jobs, schedules, and dedup optimization status
        Part of the Dargslan Windows Admin Toolkit — https://dargslan.com
    .PARAMETER Json
        Output results as JSON
    .EXAMPLE
        Get-DedupAudit
    .EXAMPLE
        Get-DedupAudit -Json
    .LINK
        https://dargslan.com
    .LINK
        https://www.powershellgallery.com/profiles/Dargslan
    #>
    [CmdletBinding()]
    param([switch]$Json)

    $report = [ordered]@{
        Volumes = Get-DedupVolume -ErrorAction SilentlyContinue | Select-Object Volume, Enabled, SavingsRate, SavedSpace, OptimizedFilesCount, InPolicyFilesCount
        Status = Get-DedupStatus -ErrorAction SilentlyContinue | Select-Object Volume, OptimizedFilesCount, InPolicyFilesCount, SavingsRate, FreeSpace, UsedSpace
        Jobs = Get-DedupJob -ErrorAction SilentlyContinue | Select-Object Volume, Type, State, Progress
        Schedule = Get-DedupSchedule -ErrorAction SilentlyContinue | Select-Object Name, Type, Enabled, Days, Start, DurationHours
        Warnings = @()
    }
    $report.Volumes | Where-Object { $_.SavingsRate -lt 10 -and $_.Enabled } | ForEach-Object { $report.Warnings += "Volume $($_.Volume) has low savings: $($_.SavingsRate)%" }
    $report.Summary = [PSCustomObject]@{ EnabledVolumes = ($report.Volumes | Where-Object Enabled | Measure-Object).Count; ActiveJobs = ($report.Jobs | Measure-Object).Count; Schedules = ($report.Schedule | Measure-Object).Count }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Data Dedup Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.Volumes) { $report.Volumes | Format-Table -AutoSize }
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function Get-DedupAudit

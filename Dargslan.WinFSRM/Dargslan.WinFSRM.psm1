function Get-FSRMAudit {
    <#
    .SYNOPSIS
        Audit FSRM quotas and file screening policies
    .DESCRIPTION
        Windows File Server Resource Manager audit toolkit — quotas, file screens, classification rules, storage reports
        Part of the Dargslan Windows Admin Toolkit — https://dargslan.com
    .PARAMETER Json
        Output results as JSON
    .EXAMPLE
        Get-FSRMAudit
    .EXAMPLE
        Get-FSRMAudit -Json
    .LINK
        https://dargslan.com
    .LINK
        https://www.powershellgallery.com/profiles/Dargslan
    #>
    [CmdletBinding()]
    param([switch]$Json)

    $report = [ordered]@{
        Quotas = Get-FsrmQuota -ErrorAction SilentlyContinue | Select-Object Path, Size, Usage, Template, SoftLimit | Select-Object -First 30
        FileScreens = Get-FsrmFileScreen -ErrorAction SilentlyContinue | Select-Object Path, Active, Template, IncludeGroup
        FileGroups = Get-FsrmFileGroup -ErrorAction SilentlyContinue | Select-Object Name, IncludePattern, ExcludePattern
        Reports = Get-FsrmStorageReport -ErrorAction SilentlyContinue | Select-Object Name, Namespace, ReportType, Schedule
        Classification = Get-FsrmClassificationRule -ErrorAction SilentlyContinue | Select-Object Name, Property, PropertyValue, Namespace
        Warnings = @()
    }
    $report.Quotas | Where-Object { $_.Usage -and $_.Size -and ($_.Usage / $_.Size * 100) -gt 85 } | ForEach-Object { $report.Warnings += "Quota near limit: $($_.Path)" }
    $report.Summary = [PSCustomObject]@{ QuotaCount = ($report.Quotas | Measure-Object).Count; FileScreenCount = ($report.FileScreens | Measure-Object).Count; FileGroupCount = ($report.FileGroups | Measure-Object).Count }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [FSRM Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.Quotas) { $report.Quotas | Format-Table Path, Size, Usage -AutoSize }
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function Get-FSRMAudit

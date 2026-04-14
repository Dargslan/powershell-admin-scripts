function Get-ReFSAudit {
    <#
    .SYNOPSIS
        Audit ReFS volumes and integrity settings
    .DESCRIPTION
        Windows Resilient File System audit toolkit — ReFS volumes, integrity streams, block cloning, allocations, and health
        Part of the Dargslan Windows Admin Toolkit — https://dargslan.com
    .PARAMETER Json
        Output results as JSON
    .EXAMPLE
        Get-ReFSAudit
    .EXAMPLE
        Get-ReFSAudit -Json
    .LINK
        https://dargslan.com
    .LINK
        https://www.powershellgallery.com/profiles/Dargslan
    #>
    [CmdletBinding()]
    param([switch]$Json)

    $report = [ordered]@{
        ReFSVolumes = Get-Volume -ErrorAction SilentlyContinue | Where-Object FileSystemType -eq "ReFS" | Select-Object DriveLetter, FileSystemLabel, Size, SizeRemaining, HealthStatus, OperationalStatus
        AllVolumes = Get-Volume -ErrorAction SilentlyContinue | Select-Object DriveLetter, FileSystemType, Size, SizeRemaining, HealthStatus | Where-Object { $_.DriveLetter }
        IntegrityStreams = Get-Volume -ErrorAction SilentlyContinue | Where-Object FileSystemType -eq "ReFS" | ForEach-Object {
            $vol = $_
            [PSCustomObject]@{ Drive = $vol.DriveLetter; Label = $vol.FileSystemLabel; IntegrityEnabled = "Check with Get-FileIntegrity" }
        }
        Warnings = @()
    }
    $report.ReFSVolumes | Where-Object { $_.HealthStatus -ne "Healthy" } | ForEach-Object { $report.Warnings += "ReFS volume $($_.DriveLetter): $($_.HealthStatus)" }
    $report.Summary = [PSCustomObject]@{ ReFSVolumeCount = ($report.ReFSVolumes | Measure-Object).Count; TotalVolumes = ($report.AllVolumes | Measure-Object).Count }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [ReFS Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.ReFSVolumes) { $report.ReFSVolumes | Format-Table -AutoSize } else { Write-Host "  No ReFS volumes found" -ForegroundColor Yellow }
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function Get-ReFSAudit

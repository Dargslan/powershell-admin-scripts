<#
.SYNOPSIS
    SQL Server health check toolkit — instance monitoring, database status, backup verification, job history, and performance metrics

.DESCRIPTION
    Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-SQLHealthReport {
    <#
    .SYNOPSIS
        Check SQL Server instance health
    .DESCRIPTION
        Reports SQL Server instance status, database health, backup freshness, agent job results, and key performance metrics.
        Part of Dargslan.WinSQLHealth — https://dargslan.com
    #>
    [CmdletBinding()] param([string]$Instance = ".", [switch]$Json)

    Import-Module SQLPS -DisableNameChecking -ErrorAction SilentlyContinue
    if (-not (Get-Module SQLPS -ErrorAction SilentlyContinue)) {
        try { Import-Module SqlServer -ErrorAction Stop } catch { Write-Warning "SQL Server module not available"; return }
    }
    $report = [ordered]@{}
    try {
        $server = New-Object Microsoft.SqlServer.Management.Smo.Server($Instance)
        $report.Instance = [PSCustomObject]@{
            Name = $server.Name; Version = $server.VersionString; Edition = $server.Edition
            ProductLevel = $server.ProductLevel; Collation = $server.Collation
            MaxMemoryMB = $server.Configuration.MaxServerMemory.ConfigValue
            MaxDOP = $server.Configuration.MaxDegreeOfParallelism.ConfigValue
        }
        $report.Databases = $server.Databases | ForEach-Object {
            [PSCustomObject]@{
                Name = $_.Name; Status = $_.Status; RecoveryModel = $_.RecoveryModel
                SizeMB = [math]::Round($_.Size,1); SpaceAvailableMB = [math]::Round($_.SpaceAvailable/1KB,1)
                LastBackup = $_.LastBackupDate; LastLogBackup = $_.LastLogBackupDate
                BackupAgeDays = if($_.LastBackupDate -gt "1900-01-01"){[math]::Round(((Get-Date)-$_.LastBackupDate).TotalDays,0)}else{"Never"}
                Compatibility = $_.CompatibilityLevel
            }
        }
        $report.AgentJobs = $server.JobServer.Jobs | Select-Object -First 20 Name, IsEnabled, LastRunDate, LastRunOutcome, CurrentRunStatus, @{N="NextRun";E={$_.NextRunDate}}
        $report.Warnings = @()
        $report.Databases | Where-Object { $_.BackupAgeDays -eq "Never" -or [int]$_.BackupAgeDays -gt 7 } | ForEach-Object { $report.Warnings += "Database $($_.Name): backup is $($_.BackupAgeDays) days old" }
        $report.AgentJobs | Where-Object LastRunOutcome -eq "Failed" | ForEach-Object { $report.Warnings += "Job $($_.Name) last run FAILED" }
    } catch { Write-Warning "Could not connect to SQL Server: $_"; return }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [SQL Server Health: $($report.Instance.Name)]" -ForegroundColor Cyan
    $report.Instance | Format-List
    $report.Databases | Format-Table Name, Status, SizeMB, RecoveryModel, BackupAgeDays -AutoSize
    if ($report.Warnings) { Write-Host "  Warnings:" -ForegroundColor Red; $report.Warnings | ForEach-Object { Write-Host "  ⚠ $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function *

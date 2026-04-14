<#
.SYNOPSIS
    Windows disk management toolkit — disk health, SMART monitoring, space analysis, cleanup automation, and partition management

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

function Get-DiskReport {
    <#
    .SYNOPSIS
        Generate comprehensive disk health and space report
    .DESCRIPTION
        Reports physical disk health, SMART status, volume space usage, and identifies potential issues.
        Part of Dargslan.WinDiskMgr — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json, [int]$WarningThreshold = 85)

    $report = [ordered]@{
        PhysicalDisks = Get-PhysicalDisk | ForEach-Object {
            $rel = $_ | Get-StorageReliabilityCounter -ErrorAction SilentlyContinue
            [PSCustomObject]@{
                Name = $_.FriendlyName; MediaType = $_.MediaType; SizeGB = [math]::Round($_.Size/1GB,1)
                Health = $_.HealthStatus; Operational = $_.OperationalStatus; BusType = $_.BusType
                Temperature = if ($rel) { "$($rel.Temperature)°C" } else { "N/A" }
                ReadErrors = if ($rel) { $rel.ReadErrorsTotal } else { 0 }
                WriteErrors = if ($rel) { $rel.WriteErrorsTotal } else { 0 }
                Wear = if ($rel) { "$($rel.Wear)%" } else { "N/A" }
            }
        }
        Volumes = Get-Volume | Where-Object { $_.DriveLetter -and $_.DriveType -eq "Fixed" } | ForEach-Object {
            $pct = [math]::Round(($_.Size - $_.SizeRemaining) / $_.Size * 100, 1)
            [PSCustomObject]@{
                Drive = "$($_.DriveLetter):"; SizeGB = [math]::Round($_.Size/1GB,1)
                FreeGB = [math]::Round($_.SizeRemaining/1GB,1); UsedPercent = $pct
                Status = if ($pct -ge $WarningThreshold) { "WARNING" } else { "OK" }
                Health = $_.HealthStatus; FileSystem = $_.FileSystem
            }
        }
        Warnings = @()
    }
    $report.Volumes | Where-Object { $_.UsedPercent -ge $WarningThreshold } | ForEach-Object { $report.Warnings += "Drive $($_.Drive) is $($_.UsedPercent)% full" }
    $report.PhysicalDisks | Where-Object { $_.Health -ne "Healthy" } | ForEach-Object { $report.Warnings += "Disk $($_.Name) health: $($_.Health)" }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Disk Health Report]" -ForegroundColor Cyan
    $report.PhysicalDisks | Format-Table -AutoSize
    $report.Volumes | Format-Table -AutoSize
    if ($report.Warnings) { Write-Host "`n  Warnings:" -ForegroundColor Red; $report.Warnings | ForEach-Object { Write-Host "  ⚠ $_" -ForegroundColor Yellow } }
    return $report
}

function Invoke-DiskCleanup {
    <#
    .SYNOPSIS
        Clean temporary files and reclaim disk space
    .DESCRIPTION
        Removes temp files, Windows Update cache, recycle bin contents, and other cleanable data.
        Part of Dargslan.WinDiskMgr — https://dargslan.com
    #>
    [CmdletBinding(SupportsShouldProcess)] param([switch]$IncludeWindowsUpdate, [switch]$IncludeRecycleBin)

    $freed = 0
    $tempDirs = @($env:TEMP, "$env:WINDIR\Temp", "$env:LOCALAPPDATA\Temp")
    foreach ($dir in $tempDirs) {
        if (Test-Path $dir) {
            $size = (Get-ChildItem $dir -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum
            if ($PSCmdlet.ShouldProcess($dir, "Clean")) {
                Remove-Item "$dir\*" -Recurse -Force -ErrorAction SilentlyContinue
                $freed += $size
                Write-Host "  Cleaned: $dir ($([math]::Round($size/1MB,1)) MB)" -ForegroundColor Green
            }
        }
    }
    if ($IncludeWindowsUpdate -and $PSCmdlet.ShouldProcess("Windows Update Cache", "Clean")) {
        Stop-Service wuauserv -Force -ErrorAction SilentlyContinue
        $wuSize = (Get-ChildItem "$env:WINDIR\SoftwareDistribution\Download" -Recurse -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum
        Remove-Item "$env:WINDIR\SoftwareDistribution\Download\*" -Recurse -Force -ErrorAction SilentlyContinue
        Start-Service wuauserv -ErrorAction SilentlyContinue
        $freed += $wuSize
        Write-Host "  Cleaned: Windows Update cache ($([math]::Round($wuSize/1MB,1)) MB)" -ForegroundColor Green
    }
    if ($IncludeRecycleBin -and $PSCmdlet.ShouldProcess("Recycle Bin", "Empty")) {
        Clear-RecycleBin -Force -ErrorAction SilentlyContinue
        Write-Host "  Cleaned: Recycle Bin" -ForegroundColor Green
    }
    Write-Host "`n  Total freed: $([math]::Round($freed/1MB,1)) MB" -ForegroundColor Cyan
}

Export-ModuleMember -Function *

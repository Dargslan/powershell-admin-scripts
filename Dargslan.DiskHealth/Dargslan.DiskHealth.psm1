<#
.SYNOPSIS
    Monitor disk health, SMART status, and storage performance

.DESCRIPTION
    Part of the Dargslan Windows Admin Tools collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
    Linux & DevOps Books: https://dargslan.com/books

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-DiskHealthReport {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Disk Health Monitor                           ║
║  More tools: https://dargslan.com                       ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $disks = Get-PhysicalDisk -ErrorAction SilentlyContinue
    $results = @()
    foreach ($disk in $disks) {
        $reliability = Get-PhysicalDisk -UniqueId $disk.UniqueId | Get-StorageReliabilityCounter -ErrorAction SilentlyContinue
        $results += [PSCustomObject]@{
            Disk = $disk.FriendlyName; Media = $disk.MediaType; Size = "$([math]::Round($disk.Size / 1GB, 0)) GB"
            Health = $disk.HealthStatus; Status = $disk.OperationalStatus
            ReadErrors = $(if ($reliability) { $reliability.ReadErrorsTotal } else { "N/A" })
            WriteErrors = $(if ($reliability) { $reliability.WriteErrorsTotal } else { "N/A" })
            Temp = $(if ($reliability -and $reliability.Temperature) { "$($reliability.Temperature)°C" } else { "N/A" })
            PowerOn = $(if ($reliability -and $reliability.PowerOnHours) { "$($reliability.PowerOnHours)h" } else { "N/A" })
        }
    }
    Write-Host ""
    if ($Json) { $results | ConvertTo-Json } else { $results | Format-Table -AutoSize }
    $volumes = Get-Volume | Where-Object { $_.DriveLetter -and $_.DriveType -eq 'Fixed' } | ForEach-Object {
        $pctFree = if ($_.Size -gt 0) { [math]::Round($_.SizeRemaining / $_.Size * 100, 1) } else { 0 }
        [PSCustomObject]@{ Drive = "$($_.DriveLetter):"; Label = $_.FileSystemLabel; FS = $_.FileSystem; SizeGB = [math]::Round($_.Size/1GB,1); FreeGB = [math]::Round($_.SizeRemaining/1GB,1); "Free%" = $pctFree }
    }
    Write-Host "`n[Volumes]" -ForegroundColor Yellow
    $volumes | Format-Table -AutoSize
}

Export-ModuleMember -Function *

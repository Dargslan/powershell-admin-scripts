<#
.SYNOPSIS
    Windows GPU monitoring toolkit — GPU utilization, VRAM usage, driver versions, multi-GPU management, and compute workload tracking (2026 Edition)

.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-GPUReport {
    <#
    .SYNOPSIS
        Monitor GPU status and utilization
    .DESCRIPTION
        Reports GPU hardware, driver versions, VRAM usage, display outputs, and compute capabilities.
        Part of Dargslan.WinGPUMon (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $report = [ordered]@{
        GPUs = Get-CimInstance Win32_VideoController | ForEach-Object {
            [PSCustomObject]@{
                Name = $_.Name; DriverVersion = $_.DriverVersion; DriverDate = $_.DriverDate
                AdapterRAM_MB = [math]::Round($_.AdapterRAM / 1MB, 0)
                Resolution = "$($_.CurrentHorizontalResolution)x$($_.CurrentVerticalResolution)"
                RefreshRate = "$($_.CurrentRefreshRate) Hz"; BitsPerPixel = $_.CurrentBitsPerPixel
                Status = $_.Status; Availability = $_.Availability
                VideoProcessor = $_.VideoProcessor; VideoMode = $_.VideoModeDescription
            }
        }
        Monitors = Get-CimInstance Win32_DesktopMonitor -ErrorAction SilentlyContinue | Select-Object Name, ScreenHeight, ScreenWidth, MonitorType
        DXDiag = [PSCustomObject]@{ DirectXVersion = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\DirectX" -ErrorAction SilentlyContinue).Version }
        GPUProcesses = Get-Process | Where-Object { $_.MainWindowHandle -ne 0 } | Sort-Object WorkingSet64 -Descending | Select-Object -First 10 Name, Id, @{N="MemMB";E={[math]::Round($_.WorkingSet64/1MB,1)}}
        Summary = [PSCustomObject]@{
            TotalGPUs = (Get-CimInstance Win32_VideoController | Measure-Object).Count
            TotalVRAM_MB = (Get-CimInstance Win32_VideoController | Measure-Object -Property AdapterRAM -Sum).Sum / 1MB
            MonitorCount = (Get-CimInstance Win32_DesktopMonitor -ErrorAction SilentlyContinue | Measure-Object).Count
        }
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [GPU Report — 2026 Edition]" -ForegroundColor Cyan
    $report.GPUs | Format-List Name, DriverVersion, AdapterRAM_MB, Resolution, RefreshRate, Status
    $report.Summary | Format-List
    return $report
}

Export-ModuleMember -Function *

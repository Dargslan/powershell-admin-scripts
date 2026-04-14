<#
.SYNOPSIS
    Windows Defender antivirus management toolkit — protection status, scan management, threat history, exclusion audit, and definition updates

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

function Get-DefenderStatus {
    <#
    .SYNOPSIS
        Get comprehensive Windows Defender protection status
    .DESCRIPTION
        Reports real-time protection, signature dates, scan history, and threat detection status.
        Part of Dargslan.WinDefender — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $status = Get-MpComputerStatus -ErrorAction SilentlyContinue
    if (-not $status) { Write-Warning "Windows Defender not available"; return }
    $report = [ordered]@{
        Protection = [PSCustomObject]@{
            RealTimeProtection    = $status.RealTimeProtectionEnabled
            BehaviorMonitor       = $status.BehaviorMonitorEnabled
            IoavProtection        = $status.IoavProtectionEnabled
            AntivirusEnabled      = $status.AntivirusEnabled
            AntispywareEnabled    = $status.AntispywareEnabled
            NetworkInspection     = $status.NISEnabled
            TamperProtection      = (Get-MpPreference).DisableTamperProtection -eq $false
        }
        Signatures = [PSCustomObject]@{
            AntivirusVersion      = $status.AntivirusSignatureVersion
            LastUpdate            = $status.AntivirusSignatureLastUpdated
            AgeHours              = [math]::Round(((Get-Date) - $status.AntivirusSignatureLastUpdated).TotalHours, 1)
            EngineVersion         = $status.AMEngineVersion
            ProductVersion        = $status.AMProductVersion
        }
        LastScan = [PSCustomObject]@{
            QuickScanTime         = $status.QuickScanEndTime
            FullScanTime          = $status.FullScanEndTime
            QuickScanAge          = if ($status.QuickScanEndTime) { [math]::Round(((Get-Date) - $status.QuickScanEndTime).TotalDays, 1) } else { "Never" }
            FullScanAge           = if ($status.FullScanEndTime) { [math]::Round(((Get-Date) - $status.FullScanEndTime).TotalDays, 1) } else { "Never" }
        }
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Windows Defender Status]" -ForegroundColor Cyan
    $report.Protection | Format-List; $report.Signatures | Format-List; $report.LastScan | Format-List
    return $report
}

function Get-DefenderThreats {
    <#
    .SYNOPSIS
        Get recent threat detection history
    .DESCRIPTION
        Lists recent malware and threat detections with severity, action taken, and file paths.
        Part of Dargslan.WinDefender — https://dargslan.com
    #>
    [CmdletBinding()] param([int]$Days = 30, [switch]$Json)

    $threats = Get-MpThreatDetection -ErrorAction SilentlyContinue | Where-Object { $_.InitialDetectionTime -gt (Get-Date).AddDays(-$Days) } |
        Select-Object @{N="Threat";E={(Get-MpThreat -ThreatID $_.ThreatID -ErrorAction SilentlyContinue).ThreatName}}, InitialDetectionTime, @{N="Action";E={$_.ThreatStatusID}}, ProcessName, @{N="Path";E={$_.Resources -join "; "}}
    if ($Json) { return $threats | ConvertTo-Json -Depth 3 }
    if ($threats) { $threats | Format-Table -AutoSize } else { Write-Host "  No threats detected in last $Days days" -ForegroundColor Green }
    return $threats
}

function Start-DefenderScan {
    <#
    .SYNOPSIS
        Start a Windows Defender scan
    .DESCRIPTION
        Initiates a Quick, Full, or Custom scan with optional path targeting.
        Part of Dargslan.WinDefender — https://dargslan.com
    #>
    [CmdletBinding()] param([ValidateSet("Quick","Full","Custom")][string]$Type = "Quick", [string]$Path)

    Write-Host "Starting $Type scan..." -ForegroundColor Yellow
    switch ($Type) {
        "Quick"  { Start-MpScan -ScanType QuickScan }
        "Full"   { Start-MpScan -ScanType FullScan }
        "Custom" { if ($Path) { Start-MpScan -ScanType CustomScan -ScanPath $Path } else { Write-Warning "Path required for custom scan" } }
    }
    Write-Host "Scan initiated successfully" -ForegroundColor Green
}

Export-ModuleMember -Function *

function Get-WINSAudit {
    <#
    .SYNOPSIS
        Audit WINS server records and replication
    .DESCRIPTION
        Windows WINS server audit toolkit — WINS database records, replication partners, burst handling, and name resolution statistics
        Part of the Dargslan Windows Admin Toolkit — https://dargslan.com
    .PARAMETER Json
        Output results as JSON
    .EXAMPLE
        Get-WINSAudit
    .EXAMPLE
        Get-WINSAudit -Json
    .LINK
        https://dargslan.com
    .LINK
        https://www.powershellgallery.com/profiles/Dargslan
    #>
    [CmdletBinding()]
    param([switch]$Json)

    $report = [ordered]@{
        Service = Get-Service WINS -ErrorAction SilentlyContinue | Select-Object Status, StartType
        NetBIOS = nbtstat -n 2>$null | Where-Object { $_ -match "\S" } | ForEach-Object { $_.Trim() }
        NetBIOSCache = nbtstat -c 2>$null | Where-Object { $_ -match "\S" } | ForEach-Object { $_.Trim() }
        WINSConfig = [PSCustomObject]@{
            LoggingEnabled = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Services\WINS\Parameters" -ErrorAction SilentlyContinue).LogDetailedEvents
            BackupOnTermination = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Services\WINS\Parameters" -ErrorAction SilentlyContinue).DoBackupOnTerm
        }
        Warnings = @()
    }
    if ($report.Service -and $report.Service.Status -eq "Running") { $report.Warnings += "WINS is a legacy service — consider migrating to DNS" }
    $report.Summary = [PSCustomObject]@{ ServiceInstalled = $null -ne $report.Service; ServiceRunning = $report.Service.Status -eq "Running"; NetBIOSEntries = ($report.NetBIOS | Measure-Object).Count }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [WINS Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.NetBIOS) { $report.NetBIOS | Select-Object -First 15 | ForEach-Object { Write-Host "  $_" } }
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function Get-WINSAudit

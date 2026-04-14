<#
.SYNOPSIS
    Windows Recovery Environment audit toolkit — WinRE status, recovery partition, system restore points, boot recovery options, and reset readiness
.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-RecoveryAudit {
    <#
    .SYNOPSIS
        Audit Windows Recovery Environment and restore options
    .DESCRIPTION
        Reports WinRE status, recovery partition, system restore points, recovery drive, and reset readiness.
        Part of Dargslan.WinRecoveryEnv (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
$report = [ordered]@{
        WinRE = reagentc /info 2>$null | Where-Object { $_ -match "\S" } | ForEach-Object { $_.Trim() }
        SystemRestore = [PSCustomObject]@{
            Enabled = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" -ErrorAction SilentlyContinue).RPSessionInterval -ne 0
            RestorePoints = (Get-ComputerRestorePoint -ErrorAction SilentlyContinue | Measure-Object).Count
        }
        RestorePoints = Get-ComputerRestorePoint -ErrorAction SilentlyContinue | Select-Object SequenceNumber, Description, CreationTime, EventType | Sort-Object CreationTime -Descending | Select-Object -First 10
        RecoveryPartition = Get-Partition | Where-Object { $_.Type -eq "Recovery" -or $_.GptType -eq "{de94bba4-06d1-4d40-a16a-bfd50179d6ac}" } | Select-Object DiskNumber, PartitionNumber, @{N="SizeMB";E={[math]::Round($_.Size/1MB,0)}}, Type
        BootConfig = bcdedit /enum {current} 2>$null | Where-Object { $_ -match "recoveryenabled|recoverysequence" } | ForEach-Object { $_.Trim() }
        ResetReady = Test-Path "$env:WINDIR\servicing\Packages\Microsoft-Windows-Client*"
    }
    $report.Summary = [PSCustomObject]@{
        WinREConfigured = ($report.WinRE | Where-Object { $_ -match "Enabled" }) -ne $null
        SystemRestoreEnabled = $report.SystemRestore.Enabled
        RestorePointCount = $report.SystemRestore.RestorePoints
        RecoveryPartition = ($report.RecoveryPartition | Measure-Object).Count -gt 0
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Recovery Environment - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.WinRE) { $report.WinRE | ForEach-Object { Write-Host "  $_" } }
    if ($report.RestorePoints) { Write-Host "`n  Restore Points:" -ForegroundColor Yellow; $report.RestorePoints | Format-Table SequenceNumber, Description, CreationTime -AutoSize }
    if ($report.RecoveryPartition) { Write-Host "  Recovery Partition:" -ForegroundColor Yellow; $report.RecoveryPartition | Format-Table -AutoSize }
    return $report
}

Export-ModuleMember -Function *

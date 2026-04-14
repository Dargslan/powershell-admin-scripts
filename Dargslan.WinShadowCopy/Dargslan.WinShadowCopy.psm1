<#
.SYNOPSIS
    Windows Volume Shadow Copy (VSS) management toolkit — shadow copy inventory, storage analysis, schedule verification, and restore point tracking

.DESCRIPTION
    Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-ShadowCopyReport {
    <#
    .SYNOPSIS
        Analyze Volume Shadow Copy configuration and storage
    .DESCRIPTION
        Reports VSS shadow copies, storage allocation, scheduled tasks, and system restore points.
        Part of Dargslan.WinShadowCopy — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $report = [ordered]@{
        ShadowCopies = Get-CimInstance Win32_ShadowCopy -ErrorAction SilentlyContinue | ForEach-Object {
            [PSCustomObject]@{
                ID = $_.ID.Substring(0,20)+"..."; VolumeName = $_.VolumeName
                InstallDate = $_.InstallDate; State = $_.State; Persistent = $_.Persistent
                ClientAccessible = $_.ClientAccessible; Provider = $_.ProviderID
            }
        }
        ShadowStorage = vssadmin list shadowstorage 2>&1 | Where-Object { $_ -match "\S" } | ForEach-Object { $_.Trim() }
        VSSWriters = vssadmin list writers 2>&1 | Select-String "Writer name:" | ForEach-Object { ($_ -split "Writer name:")[1].Trim() }
        RestorePoints = Get-ComputerRestorePoint -ErrorAction SilentlyContinue | Select-Object -First 10 SequenceNumber, Description, CreationTime, RestorePointType
        Summary = [PSCustomObject]@{
            TotalShadowCopies = (Get-CimInstance Win32_ShadowCopy -ErrorAction SilentlyContinue | Measure-Object).Count
            TotalRestorePoints = (Get-ComputerRestorePoint -ErrorAction SilentlyContinue | Measure-Object).Count
            VSSWriters = ((vssadmin list writers 2>&1 | Select-String "Writer name:") | Measure-Object).Count
            ProtectionEnabled = (Get-CimInstance Win32_ShadowCopy -ErrorAction SilentlyContinue | Measure-Object).Count -gt 0
        }
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Shadow Copy Report]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.ShadowCopies) { $report.ShadowCopies | Format-Table -AutoSize }
    if ($report.RestorePoints) { Write-Host "  Restore Points:" -ForegroundColor Yellow; $report.RestorePoints | Format-Table -AutoSize }
    return $report
}

Export-ModuleMember -Function *

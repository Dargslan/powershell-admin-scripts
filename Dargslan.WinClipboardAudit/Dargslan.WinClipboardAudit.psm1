<#
.SYNOPSIS
    Windows clipboard and data transfer security toolkit — clipboard history, cloud clipboard, cross-device sync, and data leakage prevention
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-ClipboardAudit {
    <#
    .SYNOPSIS
        Audit clipboard and data transfer security settings
    .DESCRIPTION
        Part of Dargslan.WinClipboardAudit (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        ClipboardHistory = [PSCustomObject]@{
            Enabled = (Get-ItemProperty "HKCU:\Software\Microsoft\Clipboard" -ErrorAction SilentlyContinue).EnableClipboardHistory
            SyncEnabled = (Get-ItemProperty "HKCU:\Software\Microsoft\Clipboard" -ErrorAction SilentlyContinue).EnableCloudClipboard
            SyncAcrossDevices = (Get-ItemProperty "HKCU:\Software\Microsoft\Clipboard" -ErrorAction SilentlyContinue).CloudClipboardAutomaticUpload
        }
        PolicySettings = [PSCustomObject]@{
            AllowClipboardHistory = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -ErrorAction SilentlyContinue).AllowClipboardHistory
            AllowCrossDeviceClipboard = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -ErrorAction SilentlyContinue).AllowCrossDeviceClipboard
        }
        NearbySharing = [PSCustomObject]@{
            Enabled = (Get-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\CDP" -ErrorAction SilentlyContinue).NearShareChannelUserAuthzPolicy
            FileTransfer = (Get-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\CDP" -ErrorAction SilentlyContinue).CdpSessionUserAuthzPolicy
        }
        Warnings = @()
    }
    if ($report.ClipboardHistory.SyncEnabled -eq 1) { $report.Warnings += "Cloud clipboard sync is enabled — data may leave the device" }
    if ($report.ClipboardHistory.Enabled -eq 1) { $report.Warnings += "Clipboard history is enabled — sensitive data may be retained" }
    $report.Summary = [PSCustomObject]@{
        ClipboardHistory = if($report.ClipboardHistory.Enabled -eq 1){"Enabled"}else{"Disabled"}
        CloudSync = if($report.ClipboardHistory.SyncEnabled -eq 1){"Enabled"}else{"Disabled"}
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Clipboard Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    $report.ClipboardHistory | Format-List
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function *

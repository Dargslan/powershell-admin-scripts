<#
.SYNOPSIS
    Windows ransomware protection audit toolkit — Controlled Folder Access, protected folders, allowed apps, and ransomware defense scoring
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-RansomwareProtection {
    <#
    .SYNOPSIS
        Audit ransomware protection and Controlled Folder Access
    .DESCRIPTION
        Part of Dargslan.WinRansomGuard (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        ControlledFolderAccess = (Get-MpPreference -ErrorAction SilentlyContinue).EnableControlledFolderAccess
        ProtectedFolders = (Get-MpPreference -ErrorAction SilentlyContinue).ControlledFolderAccessProtectedFolders
        AllowedApps = (Get-MpPreference -ErrorAction SilentlyContinue).ControlledFolderAccessAllowedApplications
        RansomwareBlocks = Get-WinEvent -FilterHashtable @{LogName="Microsoft-Windows-Windows Defender/Operational";Id=1123,1124,1127} -MaxEvents 20 -ErrorAction SilentlyContinue | Select-Object TimeCreated, Id, @{N="App";E={$_.Properties[0].Value}}, @{N="Folder";E={$_.Properties[1].Value}}
        TamperProtection = (Get-MpComputerStatus -ErrorAction SilentlyContinue).IsTamperProtected
        CloudProtection = (Get-MpPreference -ErrorAction SilentlyContinue).MAPSReporting
        Warnings = @()
    }
    $cfaStatus = switch($report.ControlledFolderAccess) { 0{"Disabled"} 1{"Enabled"} 2{"Audit"} default{"Unknown"} }
    if ($report.ControlledFolderAccess -ne 1) { $report.Warnings += "Controlled Folder Access is not in Block mode" }
    if (-not $report.TamperProtection) { $report.Warnings += "Tamper Protection is not enabled" }
    $score = 40
    if ($report.ControlledFolderAccess -eq 1) { $score += 30 }
    if ($report.TamperProtection) { $score += 15 }
    if ($report.CloudProtection -ge 2) { $score += 15 }
    $report.Summary = [PSCustomObject]@{
        CFA = $cfaStatus; ProtectedFolders = ($report.ProtectedFolders | Measure-Object).Count
        AllowedApps = ($report.AllowedApps | Measure-Object).Count
        RecentBlocks = ($report.RansomwareBlocks | Measure-Object).Count
        TamperProtection = $report.TamperProtection
        Score = "$score/100"
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Ransomware Protection - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    Write-Host "  Score: $score/100" -ForegroundColor $(if($score -ge 80){"Green"}elseif($score -ge 60){"Yellow"}else{"Red"})
    if ($report.RansomwareBlocks) { Write-Host "  Recent Blocks:" -ForegroundColor Yellow; $report.RansomwareBlocks | Select-Object -First 5 | Format-Table -AutoSize }
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function *

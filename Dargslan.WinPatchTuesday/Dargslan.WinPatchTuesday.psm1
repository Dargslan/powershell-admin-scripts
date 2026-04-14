<#
.SYNOPSIS
    Windows Patch Tuesday analysis toolkit — installed KBs, missing critical patches, patch age analysis, and update compliance scoring
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-PatchTuesdayAudit {
    <#
    .SYNOPSIS
        Analyze patch compliance and missing critical updates
    .DESCRIPTION
        Part of Dargslan.WinPatchTuesday (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        InstalledHotfixes = Get-HotFix -ErrorAction SilentlyContinue | Sort-Object InstalledOn -Descending | Select-Object -First 30 HotFixID, Description, InstalledOn, InstalledBy
        LastPatchDate = (Get-HotFix -ErrorAction SilentlyContinue | Sort-Object InstalledOn -Descending | Select-Object -First 1).InstalledOn
        PendingUpdates = (New-Object -ComObject Microsoft.Update.Session -ErrorAction SilentlyContinue).CreateUpdateSearcher().Search("IsInstalled=0").Updates | Select-Object -First 15 Title, @{N="KB";E={$_.KBArticleIDs -join ","}}, @{N="Severity";E={$_.MsrcSeverity}}, IsDownloaded
        OSBuild = [System.Environment]::OSVersion.Version
        WindowsVersion = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion" -ErrorAction SilentlyContinue) | Select-Object ProductName, DisplayVersion, CurrentBuild, UBR
        Summary = [PSCustomObject]@{ InstalledPatches = 0; PendingUpdates = 0; DaysSinceLastPatch = 0; LastPatch = "" }
    }
    $report.Summary.InstalledPatches = ($report.InstalledHotfixes | Measure-Object).Count
    $report.Summary.PendingUpdates = ($report.PendingUpdates | Measure-Object).Count
    if ($report.LastPatchDate) {
        $report.Summary.DaysSinceLastPatch = [math]::Round(((Get-Date) - $report.LastPatchDate).TotalDays, 0)
        $report.Summary.LastPatch = $report.LastPatchDate.ToString("yyyy-MM-dd")
    }
    $score = 100
    if ($report.Summary.DaysSinceLastPatch -gt 30) { $score -= 20 }
    if ($report.Summary.DaysSinceLastPatch -gt 60) { $score -= 30 }
    if ($report.Summary.PendingUpdates -gt 5) { $score -= 20 }
    $report.ComplianceScore = [PSCustomObject]@{ Score=[math]::Max(0,$score); Grade=$(if($score -ge 80){"A"}elseif($score -ge 60){"B"}else{"C"}) }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Patch Tuesday Analysis - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    $report.WindowsVersion | Format-List ProductName, DisplayVersion, CurrentBuild, UBR
    Write-Host "  Compliance: $($report.ComplianceScore.Score)/100 ($($report.ComplianceScore.Grade))" -ForegroundColor $(if($score -ge 80){"Green"}elseif($score -ge 60){"Yellow"}else{"Red"})
    if ($report.InstalledHotfixes) { $report.InstalledHotfixes | Select-Object -First 10 | Format-Table -AutoSize }
    if ($report.PendingUpdates) { Write-Host "  Pending Updates:" -ForegroundColor Yellow; $report.PendingUpdates | Format-Table Title, KB, Severity -AutoSize }
    return $report
}

Export-ModuleMember -Function *

<#
.SYNOPSIS
    Volume Shadow Copy Service administration toolkit — VSS writers audit, provider inventory, shadow storage analysis, and writer failure detection
.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-VSSAdminReport {
    <#
    .SYNOPSIS
        Comprehensive VSS administration report
    .DESCRIPTION
        Reports VSS writers status, providers, shadow storage allocation, shadow copies, and writer failures.
        Part of Dargslan.WinVSSAdmin (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
$report = [ordered]@{
        Writers = vssadmin list writers 2>$null | ForEach-Object -Begin {$w=@{}} -Process {
            if ($_ -match "Writer name:\s+\x27(.+)\x27") { $w=@{Name=$Matches[1]} }
            elseif ($_ -match "State:\s+\[(\d+)\]\s+(.+)") { $w.StateCode=$Matches[1]; $w.State=$Matches[2] }
            elseif ($_ -match "Last error:\s+(.+)") { $w.LastError=$Matches[1]; [PSCustomObject]$w }
        }
        Providers = vssadmin list providers 2>$null | Where-Object { $_ -match "Provider name|Provider type|Provider Id" } | ForEach-Object { $_.Trim() }
        ShadowStorage = vssadmin list shadowstorage 2>$null | Where-Object { $_ -match "Used|Allocated|Maximum" } | ForEach-Object { $_.Trim() }
        Shadows = (vssadmin list shadows 2>$null | Select-String "Shadow Copy ID" | Measure-Object).Count
        FailedWriters = @()
    }
    $report.FailedWriters = $report.Writers | Where-Object { $_.State -notmatch "Stable" }
    $report.Summary = [PSCustomObject]@{
        TotalWriters = ($report.Writers | Measure-Object).Count
        HealthyWriters = ($report.Writers | Where-Object State -match "Stable" | Measure-Object).Count
        FailedWriters = ($report.FailedWriters | Measure-Object).Count
        ShadowCopies = $report.Shadows
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [VSS Admin Report - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.FailedWriters) { Write-Host "  FAILED Writers:" -ForegroundColor Red; $report.FailedWriters | Format-Table Name, State, LastError -AutoSize }
    $report.Writers | Where-Object State -match "Stable" | Select-Object -First 10 Name, State | Format-Table -AutoSize
    return $report
}

Export-ModuleMember -Function *

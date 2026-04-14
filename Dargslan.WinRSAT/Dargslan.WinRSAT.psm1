<#
.SYNOPSIS
    Remote Server Administration Tools audit toolkit — installed RSAT features, available tools, and management console inventory
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-RSATAudit {
    <#
    .SYNOPSIS
        Audit installed Remote Server Administration Tools
    .DESCRIPTION
        Part of Dargslan.WinRSAT (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        InstalledRSAT = Get-WindowsCapability -Online -Name "RSAT*" -ErrorAction SilentlyContinue | Where-Object State -eq "Installed" | Select-Object Name, State
        AvailableRSAT = Get-WindowsCapability -Online -Name "RSAT*" -ErrorAction SilentlyContinue | Where-Object State -ne "Installed" | Select-Object Name, State
        MMCSnapins = Get-ChildItem "$env:SystemRoot\System32\*.msc" -ErrorAction SilentlyContinue | Select-Object Name, @{N="SizeKB";E={[math]::Round($_.Length/1KB,0)}}, LastWriteTime
        AdminTools = Get-ChildItem "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools" -ErrorAction SilentlyContinue | Select-Object Name, LastWriteTime
        Summary = [PSCustomObject]@{ InstalledRSAT = 0; AvailableRSAT = 0; MMCSnapins = 0; AdminTools = 0 }
    }
    $report.Summary.InstalledRSAT = ($report.InstalledRSAT | Measure-Object).Count
    $report.Summary.AvailableRSAT = ($report.AvailableRSAT | Measure-Object).Count
    $report.Summary.MMCSnapins = ($report.MMCSnapins | Measure-Object).Count
    $report.Summary.AdminTools = ($report.AdminTools | Measure-Object).Count
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [RSAT Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.InstalledRSAT) { Write-Host "  Installed RSAT:" -ForegroundColor Green; $report.InstalledRSAT | Format-Table -AutoSize }
    if ($report.AvailableRSAT) { Write-Host "  Available to Install:" -ForegroundColor Yellow; $report.AvailableRSAT | Format-Table -AutoSize }
    return $report
}

Export-ModuleMember -Function *

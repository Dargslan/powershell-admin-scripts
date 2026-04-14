<#
.SYNOPSIS
    COM hijacking detection toolkit — orphaned CLSIDs, suspicious InprocServer32 entries, phantom COM objects, and DLL side-loading risks
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-COMHijackAudit {
    <#
    .SYNOPSIS
        Detect potential COM hijacking and suspicious CLSID entries
    .DESCRIPTION
        Part of Dargslan.WinCOMHijack (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $suspiciousPaths = @("\Temp\","\AppData\Local\Temp","\Downloads\","\Users\Public\","\ProgramData\")
    $report = [ordered]@{
        SuspiciousCOM = Get-ChildItem "HKCU:\SOFTWARE\Classes\CLSID" -ErrorAction SilentlyContinue | ForEach-Object {
            $clsid = $_.PSChildName
            $server = (Get-ItemProperty "$($_.PSPath)\InprocServer32" -ErrorAction SilentlyContinue)."(default)"
            if ($server) {
                $isSuspicious = $false
                foreach ($p in $suspiciousPaths) { if ($server -match [regex]::Escape($p)) { $isSuspicious = $true; break } }
                if ($isSuspicious) { [PSCustomObject]@{ CLSID=$clsid; Server=$server; Location="HKCU" } }
            }
        }
        OrphanedCOM = Get-ChildItem "HKLM:\SOFTWARE\Classes\CLSID" -ErrorAction SilentlyContinue | Select-Object -First 200 | ForEach-Object {
            $server = (Get-ItemProperty "$($_.PSPath)\InprocServer32" -ErrorAction SilentlyContinue)."(default)"
            if ($server -and -not (Test-Path $server -ErrorAction SilentlyContinue) -and $server -notmatch "%") {
                [PSCustomObject]@{ CLSID=$_.PSChildName; MissingDLL=$server }
            }
        } | Select-Object -First 10
        Summary = [PSCustomObject]@{ SuspiciousCOM = 0; OrphanedCOM = 0 }
    }
    $report.Summary.SuspiciousCOM = ($report.SuspiciousCOM | Measure-Object).Count
    $report.Summary.OrphanedCOM = ($report.OrphanedCOM | Measure-Object).Count
    $report.ThreatLevel = if($report.Summary.SuspiciousCOM -gt 0){"HIGH"}elseif($report.Summary.OrphanedCOM -gt 5){"MEDIUM"}else{"LOW"}
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [COM Hijack Detection - 2026]" -ForegroundColor Cyan
    Write-Host "  Threat Level: $($report.ThreatLevel)" -ForegroundColor $(if($report.ThreatLevel -eq "LOW"){"Green"}elseif($report.ThreatLevel -eq "MEDIUM"){"Yellow"}else{"Red"})
    $report.Summary | Format-List
    if ($report.SuspiciousCOM) { Write-Host "  SUSPICIOUS COM entries:" -ForegroundColor Red; $report.SuspiciousCOM | Format-Table -AutoSize }
    if ($report.OrphanedCOM) { Write-Host "  Orphaned COM (missing DLLs):" -ForegroundColor Yellow; $report.OrphanedCOM | Format-Table -AutoSize }
    return $report
}

Export-ModuleMember -Function *

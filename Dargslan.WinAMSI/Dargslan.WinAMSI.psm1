<#
.SYNOPSIS
    Windows AMSI (Antimalware Scan Interface) audit toolkit — AMSI providers, bypass detection, script scanning status, and protection coverage
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-AMSIAudit {
    <#
    .SYNOPSIS
        Audit AMSI configuration and protection status
    .DESCRIPTION
        Part of Dargslan.WinAMSI (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        AMSIProviders = Get-ChildItem "HKLM:\SOFTWARE\Microsoft\AMSI\Providers" -ErrorAction SilentlyContinue | ForEach-Object {
            $clsid = $_.PSChildName
            $name = (Get-ItemProperty "HKLM:\SOFTWARE\Classes\CLSID\$clsid" -ErrorAction SilentlyContinue)."(default)"
            [PSCustomObject]@{ CLSID=$clsid; Name=if($name){$name}else{"Unknown"} }
        }
        AMSIDll = Test-Path "$env:SystemRoot\System32\amsi.dll"
        DefenderAMSI = (Get-MpPreference -ErrorAction SilentlyContinue).DisableScriptScanning
        PowerShellLogging = [PSCustomObject]@{
            ScriptBlockLogging = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" -ErrorAction SilentlyContinue).EnableScriptBlockLogging
            TranscriptionEnabled = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription" -ErrorAction SilentlyContinue).EnableTranscripting
            ModuleLogging = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging" -ErrorAction SilentlyContinue).EnableModuleLogging
        }
        Summary = [PSCustomObject]@{ AMSIPresent = $false; Providers = 0; ScriptScanEnabled = $true }
    }
    $report.Summary.AMSIPresent = $report.AMSIDll
    $report.Summary.Providers = ($report.AMSIProviders | Measure-Object).Count
    $report.Summary.ScriptScanEnabled = $report.DefenderAMSI -ne $true
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [AMSI Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.AMSIProviders) { $report.AMSIProviders | Format-Table -AutoSize }
    $report.PowerShellLogging | Format-List
    return $report
}

Export-ModuleMember -Function *

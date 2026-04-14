<#
.SYNOPSIS
    Windows Print Spooler security audit toolkit — PrintNightmare mitigations, spooler service, Point and Print restrictions, driver isolation
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-PrintSpoolerSecurity {
    <#
    .SYNOPSIS
        Audit Print Spooler security and PrintNightmare mitigations
    .DESCRIPTION
        Part of Dargslan.WinPrintNightmare (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        SpoolerService = Get-Service Spooler -ErrorAction SilentlyContinue | Select-Object Status, StartType
        PointAndPrint = [PSCustomObject]@{
            NoWarningNoElevationOnInstall = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers\PointAndPrint" -ErrorAction SilentlyContinue).NoWarningNoElevationOnInstall
            RestrictDriverInstallationToAdministrators = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers\PointAndPrint" -ErrorAction SilentlyContinue).RestrictDriverInstallationToAdministrators
            UpdatePromptSettings = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers\PointAndPrint" -ErrorAction SilentlyContinue).UpdatePromptSettings
        }
        RemoteAccess = [PSCustomObject]@{
            AllowRemote = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers" -ErrorAction SilentlyContinue).RegisterSpoolerRemoteRpcEndPoint
            RpcAuthLevel = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Printers\RPC" -ErrorAction SilentlyContinue).ForceGuardForNewConnections
        }
        Drivers = Get-PrinterDriver -ErrorAction SilentlyContinue | Select-Object Name, PrinterEnvironment, MajorVersion | Select-Object -First 20
        Warnings = @()
    }
    if ($report.SpoolerService.Status -eq "Running") { $report.Warnings += "Print Spooler is running — disable if not needed" }
    if ($report.PointAndPrint.RestrictDriverInstallationToAdministrators -ne 1) { $report.Warnings += "Driver installation not restricted to admins" }
    $score = 70
    if ($report.SpoolerService.StartType -eq "Disabled") { $score += 15 }
    if ($report.PointAndPrint.RestrictDriverInstallationToAdministrators -eq 1) { $score += 15 }
    $report.SecurityScore = [PSCustomObject]@{ Score=$score; Grade=$(if($score -ge 80){"A"}elseif($score -ge 60){"B"}else{"C"}) }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Print Spooler Security - 2026]" -ForegroundColor Cyan
    Write-Host "  Spooler: $($report.SpoolerService.Status) ($($report.SpoolerService.StartType))"
    $report.PointAndPrint | Format-List
    Write-Host "  Score: $score/100 ($($report.SecurityScore.Grade))" -ForegroundColor $(if($score -ge 80){"Green"}else{"Yellow"})
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function *

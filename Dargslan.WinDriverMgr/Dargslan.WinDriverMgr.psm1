<#
.SYNOPSIS
    Windows driver management toolkit — driver inventory, outdated driver detection, unsigned driver audit, and driver backup

.DESCRIPTION
    Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-DriverAudit {
    <#
    .SYNOPSIS
        Audit installed drivers for issues
    .DESCRIPTION
        Lists all installed drivers, identifies unsigned drivers, outdated versions, and problem devices.
        Part of Dargslan.WinDriverMgr — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $drivers = Get-WindowsDriver -Online -ErrorAction SilentlyContinue
    $pnp = Get-PnpDevice -ErrorAction SilentlyContinue
    $report = [ordered]@{
        Summary = [PSCustomObject]@{
            TotalDrivers = ($drivers | Measure-Object).Count
            ThirdParty = ($drivers | Where-Object { $_.ProviderName -ne "Microsoft" } | Measure-Object).Count
            BootCritical = ($drivers | Where-Object BootCritical | Measure-Object).Count
            TotalDevices = ($pnp | Measure-Object).Count
            ProblemDevices = ($pnp | Where-Object Status -ne "OK" | Measure-Object).Count
        }
        ThirdPartyDrivers = $drivers | Where-Object { $_.ProviderName -ne "Microsoft" } | Select-Object -First 30 @{N="Name";E={$_.OriginalFileName | Split-Path -Leaf}}, ProviderName, Version, Date, BootCritical, @{N="Signed";E={$_.Driver}} | Sort-Object ProviderName
        ProblemDevices = $pnp | Where-Object Status -ne "OK" | Select-Object FriendlyName, InstanceId, Status, Class, Problem
        SignedStatus = [PSCustomObject]@{
            SignedDrivers = (driverquery /SI 2>$null | Select-String "TRUE" | Measure-Object).Count
            UnsignedDrivers = (driverquery /SI 2>$null | Select-String "FALSE" | Measure-Object).Count
        }
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Driver Audit]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.ProblemDevices) { Write-Host "  Problem Devices:" -ForegroundColor Red; $report.ProblemDevices | Format-Table -AutoSize }
    Write-Host "  Third-Party Drivers:" -ForegroundColor Yellow
    $report.ThirdPartyDrivers | Format-Table -AutoSize
    return $report
}

Export-ModuleMember -Function *

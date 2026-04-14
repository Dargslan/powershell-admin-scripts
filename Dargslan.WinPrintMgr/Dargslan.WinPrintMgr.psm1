<#
.SYNOPSIS
    Windows print management toolkit — printer inventory, print queue monitoring, driver audit, spooler health, and print job tracking

.DESCRIPTION
    Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-PrinterAudit {
    <#
    .SYNOPSIS
        Audit all printers, queues, and print spooler health
    .DESCRIPTION
        Lists installed printers, checks print queue status, audits drivers, and verifies spooler service health.
        Part of Dargslan.WinPrintMgr — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $report = [ordered]@{
        Spooler = Get-Service Spooler | Select-Object Status, StartType
        Printers = Get-Printer -ErrorAction SilentlyContinue | Select-Object Name, Type, DriverName, PortName, Shared, Published, @{N="Status";E={$_.PrinterStatus}}
        PrintJobs = Get-PrintJob -PrinterName (Get-Printer | Select-Object -First 5 -ExpandProperty Name) -ErrorAction SilentlyContinue | Select-Object PrinterName, DocumentName, UserName, SubmittedTime, Size, JobStatus
        Ports = Get-PrinterPort -ErrorAction SilentlyContinue | Select-Object Name, Description, PortType
        Drivers = Get-PrinterDriver -ErrorAction SilentlyContinue | Select-Object Name, Manufacturer, PrinterEnvironment
        Summary = [PSCustomObject]@{
            TotalPrinters = (Get-Printer -ErrorAction SilentlyContinue | Measure-Object).Count
            NetworkPrinters = (Get-Printer -ErrorAction SilentlyContinue | Where-Object Type -eq "Connection" | Measure-Object).Count
            SharedPrinters = (Get-Printer -ErrorAction SilentlyContinue | Where-Object Shared | Measure-Object).Count
            PendingJobs = (Get-PrintJob -PrinterName (Get-Printer -ErrorAction SilentlyContinue | Select-Object -First 10 -ExpandProperty Name) -ErrorAction SilentlyContinue | Measure-Object).Count
            SpoolerRunning = (Get-Service Spooler).Status -eq "Running"
        }
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Printer Audit]" -ForegroundColor Cyan
    $report.Summary | Format-List
    $report.Printers | Format-Table Name, Type, DriverName, PortName, Shared -AutoSize
    return $report
}

Export-ModuleMember -Function *

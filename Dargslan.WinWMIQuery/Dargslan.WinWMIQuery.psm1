<#
.SYNOPSIS
    Windows WMI query toolkit — hardware enumeration, software inventory, system configuration queries, and WMI class explorer

.DESCRIPTION
    Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-WMIInventory {
    <#
    .SYNOPSIS
        Generate complete system inventory via WMI
    .DESCRIPTION
        Queries WMI for comprehensive hardware, software, and system configuration data.
        Part of Dargslan.WinWMIQuery — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json, [string]$ExportPath)

    $report = [ordered]@{
        ComputerSystem = Get-CimInstance Win32_ComputerSystem | Select-Object Name, Domain, Manufacturer, Model, SystemType, TotalPhysicalMemory, NumberOfProcessors, NumberOfLogicalProcessors
        OperatingSystem = Get-CimInstance Win32_OperatingSystem | Select-Object Caption, Version, BuildNumber, OSArchitecture, InstallDate, LastBootUpTime, RegisteredUser, Organization
        Processor = Get-CimInstance Win32_Processor | Select-Object Name, NumberOfCores, NumberOfLogicalProcessors, MaxClockSpeed, CurrentClockSpeed, L2CacheSize, L3CacheSize
        PhysicalMemory = Get-CimInstance Win32_PhysicalMemory | Select-Object Manufacturer, Capacity, Speed, MemoryType, FormFactor, BankLabel
        DiskDrives = Get-CimInstance Win32_DiskDrive | Select-Object Model, Size, InterfaceType, MediaType, Partitions, Status, SerialNumber
        NetworkAdapters = Get-CimInstance Win32_NetworkAdapterConfiguration | Where-Object IPEnabled | Select-Object Description, MACAddress, IPAddress, DefaultIPGateway, DNSServerSearchOrder, DHCPEnabled
        VideoController = Get-CimInstance Win32_VideoController | Select-Object Name, DriverVersion, AdapterRAM, CurrentHorizontalResolution, CurrentVerticalResolution
        BaseBoard = Get-CimInstance Win32_BaseBoard | Select-Object Manufacturer, Product, SerialNumber, Version
        InstalledSoftware = Get-CimInstance Win32_Product -ErrorAction SilentlyContinue | Select-Object -First 50 Name, Version, Vendor, InstallDate | Sort-Object Name
    }
    if ($ExportPath) {
        $report | ConvertTo-Json -Depth 5 | Out-File $ExportPath -Encoding UTF8
        Write-Host "  Inventory exported to: $ExportPath" -ForegroundColor Green
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 5 }
    Write-Host "`n  [WMI System Inventory]" -ForegroundColor Cyan
    foreach ($section in $report.Keys) {
        Write-Host "`n  [$section]" -ForegroundColor Yellow
        $data = $report[$section]
        if ($data -is [array] -and $data.Count -gt 3) { $data | Select-Object -First 5 | Format-Table -AutoSize }
        elseif ($data -is [array]) { $data | Format-Table -AutoSize }
        else { $data | Format-List }
    }
    return $report
}

Export-ModuleMember -Function *

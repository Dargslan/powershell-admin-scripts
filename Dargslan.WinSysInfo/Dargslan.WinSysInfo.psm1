<#
.SYNOPSIS
    Comprehensive Windows system information collector — OS details, hardware inventory, CPU, memory, disk, network, GPU, and BIOS data with export capabilities

.DESCRIPTION
    Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
    Windows & DevOps Books: https://dargslan.com/books

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-WinSystemReport {
    <#
    .SYNOPSIS
        Generate a comprehensive Windows system information report
    .DESCRIPTION
        Collects OS version, CPU, memory, disk, network adapter, GPU, and BIOS information. Supports JSON, CSV, and HTML export.
        Part of Dargslan.WinSysInfo — https://dargslan.com
    #>
    [CmdletBinding()]
    param(
        [switch]$Cpu,
        [switch]$Memory,
        [switch]$Disk,
        [switch]$Network,
        [switch]$Gpu,
        [switch]$Bios,
        [switch]$All,
        [switch]$Json,
        [string]$ExportPath
    )

    $banner = @"
╔══════════════════════════════════════════════════════════════╗
║  Dargslan Windows System Information Tool v1.0               ║
║  More tools: https://dargslan.com                            ║
║  Free Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan

    $showAll = $All -or (-not $Cpu -and -not $Memory -and -not $Disk -and -not $Network -and -not $Gpu -and -not $Bios)
    $report = [ordered]@{}

    $os = Get-CimInstance Win32_OperatingSystem
    $cs = Get-CimInstance Win32_ComputerSystem
    $report["System"] = [PSCustomObject]@{
        Hostname     = $env:COMPUTERNAME
        OS           = $os.Caption
        Version      = $os.Version
        Build        = $os.BuildNumber
        Architecture = $os.OSArchitecture
        Domain       = $cs.Domain
        Manufacturer = $cs.Manufacturer
        Model        = $cs.Model
        Uptime       = ((Get-Date) - $os.LastBootUpTime).ToString("dd\.hh\:mm\:ss")
        LastBoot     = $os.LastBootUpTime.ToString("yyyy-MM-dd HH:mm:ss")
    }

    if ($showAll -or $Cpu) {
        $proc = Get-CimInstance Win32_Processor
        $report["CPU"] = [PSCustomObject]@{
            Model      = $proc.Name
            Cores      = $proc.NumberOfCores
            Threads    = $proc.NumberOfLogicalProcessors
            MaxSpeed   = "$($proc.MaxClockSpeed) MHz"
            CurrentMHz = $proc.CurrentClockSpeed
            Load       = "$($proc.LoadPercentage)%"
            L2Cache    = "$([math]::Round($proc.L2CacheSize/1024,1)) MB"
            L3Cache    = "$([math]::Round($proc.L3CacheSize/1024,1)) MB"
            Socket     = $proc.SocketDesignation
        }
    }

    if ($showAll -or $Memory) {
        $totalGB = [math]::Round($os.TotalVisibleMemorySize / 1MB, 2)
        $freeGB = [math]::Round($os.FreePhysicalMemory / 1MB, 2)
        $usedGB = [math]::Round($totalGB - $freeGB, 2)
        $sticks = Get-CimInstance Win32_PhysicalMemory
        $report["Memory"] = [PSCustomObject]@{
            TotalGB      = $totalGB
            UsedGB       = $usedGB
            FreeGB       = $freeGB
            UsedPercent  = [math]::Round($usedGB / $totalGB * 100, 1)
            Slots        = ($sticks | Measure-Object).Count
            MaxCapacity  = "$([math]::Round(($cs.TotalPhysicalMemory)/1GB,0)) GB"
            Type         = ($sticks | Select-Object -First 1).MemoryType
            Speed        = ($sticks | Select-Object -First 1).Speed
        }
    }

    if ($showAll -or $Disk) {
        $report["Disks"] = Get-Volume | Where-Object { $_.DriveLetter -and $_.DriveType -eq "Fixed" } |
            ForEach-Object {
                [PSCustomObject]@{
                    Drive       = "$($_.DriveLetter):"
                    Label       = $_.FileSystemLabel
                    FileSystem  = $_.FileSystem
                    SizeGB      = [math]::Round($_.Size / 1GB, 1)
                    FreeGB      = [math]::Round($_.SizeRemaining / 1GB, 1)
                    UsedPercent = [math]::Round(($_.Size - $_.SizeRemaining) / $_.Size * 100, 1)
                    Health      = $_.HealthStatus
                }
            }
    }

    if ($showAll -or $Network) {
        $report["Network"] = Get-NetAdapter -Physical -ErrorAction SilentlyContinue |
            Where-Object Status -eq "Up" |
            ForEach-Object {
                $ip = Get-NetIPAddress -InterfaceIndex $_.ifIndex -AddressFamily IPv4 -ErrorAction SilentlyContinue
                $dns = Get-DnsClientServerAddress -InterfaceIndex $_.ifIndex -AddressFamily IPv4 -ErrorAction SilentlyContinue
                [PSCustomObject]@{
                    Name    = $_.Name
                    Speed   = $_.LinkSpeed
                    MAC     = $_.MacAddress
                    IP      = $(if ($ip) { $ip.IPAddress } else { "N/A" })
                    DNS     = $(if ($dns) { $dns.ServerAddresses -join ", " } else { "N/A" })
                    Driver  = $_.DriverInformation
                }
            }
    }

    if ($showAll -or $Gpu) {
        $report["GPU"] = Get-CimInstance Win32_VideoController | ForEach-Object {
            [PSCustomObject]@{
                Name       = $_.Name
                Driver     = $_.DriverVersion
                Resolution = "$($_.CurrentHorizontalResolution)x$($_.CurrentVerticalResolution)"
                VRAM_MB    = [math]::Round($_.AdapterRAM / 1MB, 0)
                Status     = $_.Status
            }
        }
    }

    if ($showAll -or $Bios) {
        $bios = Get-CimInstance Win32_BIOS
        $report["BIOS"] = [PSCustomObject]@{
            Manufacturer = $bios.Manufacturer
            Version      = $bios.SMBIOSBIOSVersion
            SerialNumber = $bios.SerialNumber
            ReleaseDate  = $bios.ReleaseDate
        }
    }

    if ($Json) {
        $jsonOutput = $report | ConvertTo-Json -Depth 5
        if ($ExportPath) {
            $jsonOutput | Out-File -FilePath $ExportPath -Encoding UTF8
            Write-Host "`nReport exported to: $ExportPath" -ForegroundColor Green
        }
        return $jsonOutput
    }

    if (-not $Json) {
        foreach ($section in $report.Keys) {
            Write-Host "`n  [$section]" -ForegroundColor Yellow
            $data = $report[$section]
            if ($data -is [array]) {
                $data | Format-Table -AutoSize | Out-String | Write-Host
            } else {
                $data | Format-List | Out-String | Write-Host
            }
        }
        Write-Host ("-" * 60)
        Write-Host "  dargslan.com — Windows Admin Tools & eBooks" -ForegroundColor DarkGray
        Write-Host ("=" * 60)
    }

    if ($ExportPath -and -not $Json) {
        $report | ConvertTo-Json -Depth 5 | Out-File -FilePath $ExportPath -Encoding UTF8
        Write-Host "`nReport exported to: $ExportPath" -ForegroundColor Green
    }

    return $report
}

function Get-WinHardwareInventory {
    <#
    .SYNOPSIS
        Export complete hardware inventory to CSV or JSON
    .DESCRIPTION
        Collects detailed hardware information suitable for asset management and inventory tracking.
        Part of Dargslan.WinSysInfo — https://dargslan.com
    #>
    [CmdletBinding()]
    param(
        [string]$ExportPath = "hardware-inventory.json",
        [ValidateSet("JSON","CSV")]
        [string]$Format = "JSON"
    )

    $inventory = [ordered]@{
        CollectedAt = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
        Hostname    = $env:COMPUTERNAME
        OS          = (Get-CimInstance Win32_OperatingSystem).Caption
        CPU         = (Get-CimInstance Win32_Processor).Name
        RAM_GB      = [math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 1)
        Disks       = @(Get-PhysicalDisk | Select-Object FriendlyName, MediaType, @{N="SizeGB";E={[math]::Round($_.Size/1GB,1)}}, HealthStatus)
        Network     = @(Get-NetAdapter -Physical | Select-Object Name, MacAddress, LinkSpeed, Status)
        GPU         = @(Get-CimInstance Win32_VideoController | Select-Object Name, DriverVersion)
    }

    if ($Format -eq "JSON") {
        $inventory | ConvertTo-Json -Depth 5 | Out-File -FilePath $ExportPath -Encoding UTF8
    } else {
        $csvPath = $ExportPath -replace "\.json$", ".csv"
        $flat = [PSCustomObject]@{
            Hostname = $inventory.Hostname; OS = $inventory.OS
            CPU = $inventory.CPU; RAM_GB = $inventory.RAM_GB
        }
        $flat | Export-Csv -Path $csvPath -NoTypeInformation
        $ExportPath = $csvPath
    }
    Write-Host "Hardware inventory exported to: $ExportPath" -ForegroundColor Green
    return $inventory
}

Export-ModuleMember -Function *

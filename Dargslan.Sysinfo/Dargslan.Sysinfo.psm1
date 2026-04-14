<#
.SYNOPSIS
    Comprehensive Windows system information — CPU, memory, disk, network

.DESCRIPTION
    Part of the Dargslan Windows Admin Tools collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
    Linux & DevOps Books: https://dargslan.com/books

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-SystemReport {
    [CmdletBinding()]
    param([switch]$Cpu, [switch]$Memory, [switch]$Disk, [switch]$Network, [switch]$All, [switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan System Information Tool                       ║
║  More tools: https://dargslan.com                       ║
║  Free Cheat Sheets: https://dargslan.com/cheat-sheets   ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $showAll = $All -or (-not $Cpu -and -not $Memory -and -not $Disk -and -not $Network)
    $report = @{}
    if ($showAll -or $Cpu) {
        $os = Get-CimInstance Win32_OperatingSystem
        $proc = Get-CimInstance Win32_Processor
        $report["System"] = [PSCustomObject]@{ Hostname = $env:COMPUTERNAME; OS = $os.Caption; Version = $os.Version; Architecture = $os.OSArchitecture; Uptime = ((Get-Date) - $os.LastBootUpTime).ToString("dd\.hh\:mm\:ss") }
        $report["CPU"] = [PSCustomObject]@{ Model = $proc.Name; Cores = $proc.NumberOfCores; Threads = $proc.NumberOfLogicalProcessors; Speed = "$($proc.MaxClockSpeed) MHz"; Load = "$($proc.LoadPercentage)%" }
        if (-not $Json) { Write-Host "`n[System]" -ForegroundColor Yellow; $report["System"] | Format-List; Write-Host "[CPU]" -ForegroundColor Yellow; $report["CPU"] | Format-List }
    }
    if ($showAll -or $Memory) {
        $os = Get-CimInstance Win32_OperatingSystem
        $totalGB = [math]::Round($os.TotalVisibleMemorySize / 1MB, 1); $freeGB = [math]::Round($os.FreePhysicalMemory / 1MB, 1); $usedGB = $totalGB - $freeGB
        $report["Memory"] = [PSCustomObject]@{ TotalGB = $totalGB; UsedGB = $usedGB; FreeGB = $freeGB; "Used%" = [math]::Round($usedGB / $totalGB * 100, 1) }
        if (-not $Json) { Write-Host "`n[Memory]" -ForegroundColor Yellow; $report["Memory"] | Format-List }
    }
    if ($showAll -or $Disk) {
        $report["Disks"] = Get-Volume | Where-Object { $_.DriveLetter -and $_.DriveType -eq 'Fixed' } | ForEach-Object { [PSCustomObject]@{ Drive = "$($_.DriveLetter):"; SizeGB = [math]::Round($_.Size/1GB,1); FreeGB = [math]::Round($_.SizeRemaining/1GB,1); "Free%" = [math]::Round($_.SizeRemaining/$_.Size*100,1) } }
        if (-not $Json) { Write-Host "`n[Disks]" -ForegroundColor Yellow; $report["Disks"] | Format-Table -AutoSize }
    }
    if ($showAll -or $Network) {
        $report["Network"] = Get-NetAdapter -Physical -ErrorAction SilentlyContinue | Where-Object Status -eq 'Up' | ForEach-Object { $ip = Get-NetIPAddress -InterfaceIndex $_.ifIndex -AddressFamily IPv4 -ErrorAction SilentlyContinue; [PSCustomObject]@{ Adapter = $_.Name; Speed = $_.LinkSpeed; MAC = $_.MacAddress; IP = $(if ($ip) { $ip.IPAddress } else { "N/A" }) } }
        if (-not $Json) { Write-Host "`n[Network]" -ForegroundColor Yellow; $report["Network"] | Format-Table -AutoSize }
    }
    if ($Json) { $report | ConvertTo-Json -Depth 5 }
}

Export-ModuleMember -Function *

<#
.SYNOPSIS
    Display detailed hostname and system identity information

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

function Get-HostInfo {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Hostname Info
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $os = Get-CimInstance Win32_OperatingSystem; $cs = Get-CimInstance Win32_ComputerSystem; [PSCustomObject]@{Hostname=$env:COMPUTERNAME; OS=$os.Caption; Build=$os.BuildNumber; Domain=$cs.Domain; Manufacturer=$cs.Manufacturer; Model=$cs.Model; TotalRAM="$([math]::Round($cs.TotalPhysicalMemory/1GB,1)) GB"; SerialNumber=(Get-CimInstance Win32_BIOS).SerialNumber} | Format-List
}


Export-ModuleMember -Function *

<#
.SYNOPSIS
    Generate system uptime and availability report

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

function Get-UptimeReport {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Uptime Report
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $os = Get-CimInstance Win32_OperatingSystem; $uptime = (Get-Date) - $os.LastBootUpTime; Write-Host "`n[Uptime Report]" -ForegroundColor Yellow; [PSCustomObject]@{Hostname=$env:COMPUTERNAME; OS=$os.Caption; LastBoot=$os.LastBootUpTime.ToString("yyyy-MM-dd HH:mm:ss"); Uptime="$($uptime.Days)d $($uptime.Hours)h $($uptime.Minutes)m"; "Uptime%"=[math]::Round($uptime.TotalHours/($uptime.TotalHours+0.01)*100,2)} | Format-List; $shutdowns = Get-WinEvent -FilterHashtable @{LogName="System"; Id=@(1074,6006,6008)} -MaxEvents 5 -ErrorAction SilentlyContinue; if ($shutdowns) { Write-Host "[Recent Shutdowns/Reboots]" -ForegroundColor Yellow; $shutdowns | Select-Object TimeCreated, Id, @{N="Msg";E={($_.Message -split "`n")[0].Substring(0,[Math]::Min(60,($_.Message -split "`n")[0].Length))}} | Format-Table -AutoSize }
}


Export-ModuleMember -Function *

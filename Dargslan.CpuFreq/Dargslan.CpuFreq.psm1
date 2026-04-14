<#
.SYNOPSIS
    Monitor CPU frequency, performance, and power states

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

function Get-CpuFrequency {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Cpu Freq
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $proc = Get-CimInstance Win32_Processor; $results = $proc | Select-Object Name, NumberOfCores, NumberOfLogicalProcessors, @{N="CurrentMHz";E={$_.CurrentClockSpeed}}, @{N="MaxMHz";E={$_.MaxClockSpeed}}, @{N="Load%";E={$_.LoadPercentage}}; Write-Host "`n[CPU Frequency]" -ForegroundColor Yellow; if ($Json) { $results | ConvertTo-Json } else { $results | Format-List }
}


Export-ModuleMember -Function *

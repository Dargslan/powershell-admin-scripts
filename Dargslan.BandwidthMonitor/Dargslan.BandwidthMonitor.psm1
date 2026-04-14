<#
.SYNOPSIS
    Monitor network interface bandwidth and throughput statistics

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

function Get-BandwidthReport {
    [CmdletBinding()]
    param([int]$Seconds = 5, [switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Bandwidth Monitor                             ║
║  More tools: https://dargslan.com                       ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $adapters = Get-NetAdapter -Physical -ErrorAction SilentlyContinue | Where-Object Status -eq 'Up'
    $before = Get-NetAdapterStatistics -ErrorAction SilentlyContinue
    Write-Host "Measuring for $Seconds seconds..." -ForegroundColor Yellow
    Start-Sleep -Seconds $Seconds
    $after = Get-NetAdapterStatistics -ErrorAction SilentlyContinue
    $results = @()
    foreach ($adapter in $adapters) {
        $b = $before | Where-Object Name -eq $adapter.Name
        $a = $after | Where-Object Name -eq $adapter.Name
        if ($b -and $a) {
            $rxRate = [math]::Round(($a.ReceivedBytes - $b.ReceivedBytes) / $Seconds / 1KB, 1)
            $txRate = [math]::Round(($a.SentBytes - $b.SentBytes) / $Seconds / 1KB, 1)
            $results += [PSCustomObject]@{ Adapter = $adapter.Name; Speed = $adapter.LinkSpeed; "RX KB/s" = $rxRate; "TX KB/s" = $txRate; TotalRxMB = [math]::Round($a.ReceivedBytes / 1MB, 1); TotalTxMB = [math]::Round($a.SentBytes / 1MB, 1) }
        }
    }
    if ($Json) { $results | ConvertTo-Json } else { $results | Format-Table -AutoSize }
}

Export-ModuleMember -Function *

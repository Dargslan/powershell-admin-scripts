<#
.SYNOPSIS
    Monitor network interface status and error counters

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

function Get-InterfaceReport {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Interface Monitor
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $adapters = Get-NetAdapter | Select-Object Name, Status, LinkSpeed, MediaType; $stats = Get-NetAdapterStatistics -ErrorAction SilentlyContinue; $results = foreach ($a in $adapters) { $s = $stats | Where-Object Name -eq $a.Name; [PSCustomObject]@{Name=$a.Name; Status=$a.Status; Speed=$a.LinkSpeed; RxBytes=$(if($s){[math]::Round($s.ReceivedBytes/1MB,1)}else{0}); TxBytes=$(if($s){[math]::Round($s.SentBytes/1MB,1)}else{0}); Errors=$(if($s){$s.ReceivedPacketErrors + $s.OutboundPacketErrors}else{0})} }; if ($Json) { $results | ConvertTo-Json } else { $results | Format-Table -AutoSize }
}


Export-ModuleMember -Function *

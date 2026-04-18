<#
.SYNOPSIS
    Measure network latency and packet loss to targets

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

function Test-NetworkLatency {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Network Latency
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $targets = @("8.8.8.8","1.1.1.1","dargslan.com","github.com"); $results = foreach ($t in $targets) { $ping = Test-Connection -ComputerName $t -Count 4 -ErrorAction SilentlyContinue; if ($ping) { [PSCustomObject]@{Target=$t; Min=[math]::Round(($ping.Latency | Measure-Object -Min).Minimum,1); Avg=[math]::Round(($ping.Latency | Measure-Object -Average).Average,1); Max=[math]::Round(($ping.Latency | Measure-Object -Max).Maximum,1); Loss="0%"} } else { [PSCustomObject]@{Target=$t; Min="N/A"; Avg="N/A"; Max="N/A"; Loss="100%"} } }; if ($Json) { $results | ConvertTo-Json } else { $results | Format-Table -AutoSize }
}


Export-ModuleMember -Function *

<#
.SYNOPSIS
    Scan local network for active hosts and open ports

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

function Invoke-NetworkScan {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Net Scanner
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    param([string]$Subnet = "") ; if (-not $Subnet) { $ip = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.IPAddress -notlike "127.*" } | Select-Object -First 1).IPAddress; $parts = $ip.Split("."); $Subnet = "$($parts[0]).$($parts[1]).$($parts[2])" }; Write-Host "`n[Network Scan] Scanning $Subnet.1-254..." -ForegroundColor Yellow; $results = 1..254 | ForEach-Object -Parallel { $target = "$using:Subnet.$_"; if (Test-Connection -ComputerName $target -Count 1 -Quiet -TimeoutSeconds 1) { [PSCustomObject]@{IP=$target; Status="Up"} } } -ThrottleLimit 50 -ErrorAction SilentlyContinue; Write-Host "Found $($results.Count) host(s)" -ForegroundColor Green; $results | Format-Table -AutoSize
}


Export-ModuleMember -Function *

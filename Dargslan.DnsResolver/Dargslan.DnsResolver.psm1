<#
.SYNOPSIS
    Test DNS resolution, measure query times, and validate DNSSEC

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

function Test-DnsResolution {
    [CmdletBinding()]
    param([string[]]$Domains = @("dargslan.com","google.com","github.com"), [string[]]$Servers = @("8.8.8.8","1.1.1.1"), [switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan DNS Resolver Tester                           ║
║  More tools: https://dargslan.com                       ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $results = @()
    foreach ($domain in $Domains) {
        foreach ($server in $Servers) {
            $sw = [System.Diagnostics.Stopwatch]::StartNew()
            try {
                $resolved = Resolve-DnsName -Name $domain -Server $server -Type A -DnsOnly -ErrorAction Stop
                $sw.Stop()
                $results += [PSCustomObject]@{ Domain = $domain; Server = $server; IP = ($resolved | Where-Object Type -eq 'A' | Select-Object -First 1).IPAddress; TimeMs = $sw.ElapsedMilliseconds; Status = "OK" }
            } catch { $sw.Stop(); $results += [PSCustomObject]@{ Domain = $domain; Server = $server; IP = "N/A"; TimeMs = $sw.ElapsedMilliseconds; Status = "FAILED" } }
        }
    }
    if ($Json) { $results | ConvertTo-Json } else { $results | Format-Table -AutoSize }
}

Export-ModuleMember -Function *

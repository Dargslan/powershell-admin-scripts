<#
.SYNOPSIS
    Monitor open TCP/UDP ports and listening services

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

function Get-PortReport {
    [CmdletBinding()]
    param([switch]$ListeningOnly, [switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Port Monitor                                  ║
║  More tools: https://dargslan.com                       ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $connections = Get-NetTCPConnection -ErrorAction SilentlyContinue
    if ($ListeningOnly) { $connections = $connections | Where-Object State -eq 'Listen' }
    $results = $connections | ForEach-Object {
        $proc = Get-Process -Id $_.OwningProcess -ErrorAction SilentlyContinue
        [PSCustomObject]@{ LocalAddr = $_.LocalAddress; LocalPort = $_.LocalPort; RemoteAddr = $_.RemoteAddress; RemotePort = $_.RemotePort; State = $_.State; Process = $(if ($proc) { $proc.ProcessName } else { "N/A" }); PID = $_.OwningProcess }
    } | Sort-Object LocalPort
    Write-Host "`n[TCP] Total connections: $($results.Count) | Listening: $(($results | Where-Object State -eq 'Listen').Count)" -ForegroundColor Yellow
    if ($Json) { $results | ConvertTo-Json } else { $results | Format-Table -AutoSize }
}

function Test-PortOpen {
    [CmdletBinding()]
    param([Parameter(Mandatory=$true)][string]$Host, [Parameter(Mandatory=$true)][int[]]$Ports, [int]$Timeout = 2)
    $results = @()
    foreach ($port in $Ports) {
        $tcp = New-Object System.Net.Sockets.TcpClient
        try { $result = $tcp.BeginConnect($Host, $port, $null, $null); $wait = $result.AsyncWaitHandle.WaitOne($Timeout * 1000, $false)
            $results += [PSCustomObject]@{ Host = $Host; Port = $port; Status = $(if ($wait) { "OPEN" } else { "CLOSED" }) }
        } catch { $results += [PSCustomObject]@{ Host = $Host; Port = $port; Status = "ERROR" } } finally { $tcp.Close() }
    }
    $results | Format-Table -AutoSize
}

Export-ModuleMember -Function *

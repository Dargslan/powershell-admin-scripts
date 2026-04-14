<#
.SYNOPSIS
    Windows network diagnostics toolkit — connectivity testing, DNS analysis, port scanning, latency measurement, and network adapter monitoring

.DESCRIPTION
    Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
    Windows & DevOps Books: https://dargslan.com/books

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Test-NetworkHealth {
    <#
    .SYNOPSIS
        Comprehensive network health check
    .DESCRIPTION
        Tests internet connectivity, DNS resolution, gateway reachability, and measures latency to common endpoints.
        Part of Dargslan.WinNetworkDiag — https://dargslan.com
    #>
    [CmdletBinding()] param([string[]]$Targets = @("8.8.8.8","1.1.1.1","google.com","microsoft.com"), [switch]$Json)

    $report = [ordered]@{
        Adapters = Get-NetAdapter -Physical | Where-Object Status -eq "Up" | Select-Object Name, LinkSpeed, MacAddress, Status
        Gateway = Get-NetRoute -DestinationPrefix "0.0.0.0/0" -ErrorAction SilentlyContinue | Select-Object -First 1 NextHop, InterfaceAlias
        DNS = Get-DnsClientServerAddress -AddressFamily IPv4 | Where-Object ServerAddresses | Select-Object InterfaceAlias, ServerAddresses
        ConnectivityTests = $Targets | ForEach-Object {
            $result = Test-Connection -ComputerName $_ -Count 2 -ErrorAction SilentlyContinue
            [PSCustomObject]@{
                Target = $_; Reachable = [bool]$result
                AvgMs = if ($result) { [math]::Round(($result | Measure-Object -Property Latency -Average).Average, 1) } else { "N/A" }
                Loss = if ($result) { "0%" } else { "100%" }
            }
        }
        DnsResolution = @("dargslan.com","google.com","github.com") | ForEach-Object {
            $start = Get-Date
            try { $resolved = Resolve-DnsName $_ -ErrorAction Stop; $ms = [math]::Round(((Get-Date) - $start).TotalMilliseconds, 1)
                [PSCustomObject]@{ Domain = $_; Resolved = $true; IP = ($resolved | Where-Object Type -eq "A" | Select-Object -First 1).IPAddress; TimeMs = $ms }
            } catch { [PSCustomObject]@{ Domain = $_; Resolved = $false; IP = "N/A"; TimeMs = "N/A" } }
        }
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Network Health]" -ForegroundColor Cyan
    $report.Adapters | Format-Table -AutoSize
    $report.ConnectivityTests | Format-Table -AutoSize
    $report.DnsResolution | Format-Table -AutoSize
    return $report
}

function Test-PortScan {
    <#
    .SYNOPSIS
        Scan TCP ports on a target host
    .DESCRIPTION
        Tests TCP port connectivity to a target host. Useful for verifying firewall rules and service availability.
        Part of Dargslan.WinNetworkDiag — https://dargslan.com
    #>
    [CmdletBinding()] param([string]$Target = "localhost", [int[]]$Ports = @(21,22,25,53,80,110,135,139,143,443,445,993,1433,3306,3389,5432,8080), [int]$Timeout = 1000)

    Write-Host "  Scanning $Target..." -ForegroundColor Yellow
    $results = $Ports | ForEach-Object {
        $tcp = New-Object System.Net.Sockets.TcpClient
        $connect = $tcp.BeginConnect($Target, $_, $null, $null)
        $wait = $connect.AsyncWaitHandle.WaitOne($Timeout, $false)
        $open = $false
        if ($wait) { try { $tcp.EndConnect($connect); $open = $true } catch {} }
        $tcp.Close()
        [PSCustomObject]@{ Port = $_; Open = $open; Service = switch ($_) { 21 {"FTP"} 22 {"SSH"} 25 {"SMTP"} 53 {"DNS"} 80 {"HTTP"} 135 {"RPC"} 139 {"NetBIOS"} 143 {"IMAP"} 443 {"HTTPS"} 445 {"SMB"} 1433 {"MSSQL"} 3306 {"MySQL"} 3389 {"RDP"} 5432 {"PostgreSQL"} 8080 {"HTTP-Alt"} default {"Unknown"} } }
    }
    $results | Where-Object Open | Format-Table -AutoSize
    Write-Host "  Open: $(($results | Where-Object Open | Measure-Object).Count) / $($Ports.Count) ports" -ForegroundColor Cyan
    return $results
}

Export-ModuleMember -Function *

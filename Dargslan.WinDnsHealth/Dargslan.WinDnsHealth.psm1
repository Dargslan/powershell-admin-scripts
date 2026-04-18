<#
.SYNOPSIS
    Audit Windows DNS Server health: zones, scavenging, recursion, root hints, forwarders. JSON / HTML report.

.DESCRIPTION
    Part of the Dargslan Windows Admin Tools collection.
    Free Cheat Sheet: https://dargslan.com/cheat-sheets/windows-dns-server-health-2026
    Full Guide:       https://dargslan.com/blog/windows-dns-server-health-powershell-2026
    More tools:       https://dargslan.com

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

$script:Banner = @"
+----------------------------------------------------------+
|  Dargslan Windows DNS Health Audit                      
|  https://dargslan.com - Free cheat sheets & eBooks       |
+----------------------------------------------------------+
"@

function Get-DargslanDnsZones {
    <#
    .SYNOPSIS
        List all DNS zones with type, dynamic-update setting and scavenging.
    #>
    [CmdletBinding()]
    param([string]$ComputerName = $env:COMPUTERNAME)
    Get-DnsServerZone -ComputerName $ComputerName |
        Select ZoneName, ZoneType, IsAutoCreated, IsDsIntegrated, DynamicUpdate, IsReverseLookupZone
}

function Get-DargslanDnsServerSettings {
    <#
    .SYNOPSIS
        Return recursion, root hints and forwarder configuration.
    #>
    [CmdletBinding()]
    param([string]$ComputerName = $env:COMPUTERNAME)
    $set = Get-DnsServerSetting -ComputerName $ComputerName -All
    $rec = Get-DnsServerRecursion -ComputerName $ComputerName
    $fw  = Get-DnsServerForwarder -ComputerName $ComputerName
    [pscustomobject]@{
        ComputerName  = $ComputerName
        Recursion     = $rec.Enable
        SecureResp    = $set.EnableDnsSec
        ForwardersIp  = ($fw.IPAddress -join ',')
        ForwardingTimeout = $fw.Timeout
        ListenAddresses = ($set.ListeningIPAddress -join ',')
        Version       = $set.MajorVersion
    }
}

function Get-DargslanDnsScavengingStatus {
    <#
    .SYNOPSIS
        Server-level scavenging settings + per-zone aging.
    #>
    [CmdletBinding()]
    param([string]$ComputerName = $env:COMPUTERNAME)
    $srv = Get-DnsServerScavenging -ComputerName $ComputerName
    $zones = Get-DnsServerZone -ComputerName $ComputerName |
        Where-Object ZoneType -eq 'Primary' |
        ForEach-Object {
            $age = Get-DnsServerZoneAging -Name $_.ZoneName -ComputerName $ComputerName -ErrorAction SilentlyContinue
            [pscustomobject]@{
                Zone          = $_.ZoneName
                AgingEnabled  = $age.AgingEnabled
                NoRefresh     = $age.NoRefreshInterval
                Refresh       = $age.RefreshInterval
            }
        }
    [pscustomobject]@{
        Server = [pscustomobject]@{
            ScavengingState  = $srv.ScavengingState
            ScavengingInterval = $srv.ScavengingInterval
        }
        Zones = $zones
    }
}

function Get-DargslanDnsHealthReport {
    <#
    .SYNOPSIS
        Combined DNS audit with PASS / WARN / FAIL verdict.
    #>
    [CmdletBinding()]
    param([string]$ComputerName = $env:COMPUTERNAME)
    $zones = @(Get-DargslanDnsZones -ComputerName $ComputerName)
    $set   = Get-DargslanDnsServerSettings -ComputerName $ComputerName
    $scav  = Get-DargslanDnsScavengingStatus -ComputerName $ComputerName
    $primary = ($zones | Where-Object ZoneType -eq 'Primary').Count
    $secureZones = ($zones | Where-Object DynamicUpdate -eq 'Secure').Count
    $score = 0
    if ($primary -gt 0)                    { $score++ }
    if ($secureZones -ge 1)                { $score++ }
    if ($set.ForwardersIp)                  { $score++ }
    if ($scav.Server.ScavengingState)        { $score++ }
    $verdict = if ($score -ge 3) { 'PASS' } elseif ($score -ge 1) { 'WARN' } else { 'FAIL' }
    [pscustomobject]@{
        ComputerName  = $ComputerName
        ZoneCount     = $zones.Count
        PrimaryZones  = $primary
        SecureZones   = $secureZones
        Settings      = $set
        Scavenging    = $scav
        Score         = $score
        Verdict       = $verdict
        TimeStamp     = (Get-Date).ToString('s')
    }
}

function Export-DargslanDnsHealthReport {
    <#
    .SYNOPSIS
        Export the DNS audit to HTML and JSON.
    #>
    [CmdletBinding()]
    param([string]$ComputerName = $env:COMPUTERNAME, [string]$OutDir = (Join-Path $env:TEMP 'DargslanDnsAudit'))
    if (-not (Test-Path $OutDir)) { New-Item -Type Directory -Path $OutDir | Out-Null }
    $r = Get-DargslanDnsHealthReport -ComputerName $ComputerName
    $json = Join-Path $OutDir ('dns-' + $ComputerName + '.json')
    $html = Join-Path $OutDir ('dns-' + $ComputerName + '.html')
    $r | ConvertTo-Json -Depth 6 | Set-Content $json -Encoding UTF8
    $body  = "<h1>DNS Health - $($r.ComputerName)</h1>"
    $body += "<p>Verdict: <b>$($r.Verdict)</b> ($($r.Score)/4)</p>"
    $body += '<h2>Settings</h2>'  + ($r.Settings | ConvertTo-Html -Fragment)
    $body += '<h2>Scavenging</h2><pre>' + ($r.Scavenging | ConvertTo-Json -Depth 4) + '</pre>'
    ConvertTo-Html -Body $body -Title 'DNS Health' | Set-Content $html -Encoding UTF8
    [pscustomobject]@{ Json = $json; Html = $html; Verdict = $r.Verdict }
}


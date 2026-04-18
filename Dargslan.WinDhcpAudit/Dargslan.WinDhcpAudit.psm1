<#
.SYNOPSIS
    Audit Windows DHCP scopes, failover and exhaustion. JSON / HTML report.

.DESCRIPTION
    Part of the Dargslan Windows Admin Tools collection.
    Free Cheat Sheet: https://dargslan.com/cheat-sheets/windows-dhcp-audit-2026
    Full Guide:       https://dargslan.com/blog/windows-dhcp-audit-powershell-2026
    More tools:       https://dargslan.com

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

$script:Banner = @"
+----------------------------------------------------------+
|  Dargslan Windows DHCP Audit                            
|  https://dargslan.com - Free cheat sheets & eBooks       |
+----------------------------------------------------------+
"@

function Get-DargslanDhcpScopes {
    <#
    .SYNOPSIS
        List every DHCP scope with state, lease duration and reservations.
    #>
    [CmdletBinding()]
    param([string]$ComputerName = $env:COMPUTERNAME)
    Get-DhcpServerv4Scope -ComputerName $ComputerName |
        Select ScopeId, Name, State, StartRange, EndRange, SubnetMask, LeaseDuration
}

function Get-DargslanDhcpFailover {
    <#
    .SYNOPSIS
        Return DHCP failover relationships.
    #>
    [CmdletBinding()]
    param([string]$ComputerName = $env:COMPUTERNAME)
    try {
        Get-DhcpServerv4Failover -ComputerName $ComputerName -ErrorAction Stop |
            Select Name, Mode, PartnerServer, ScopeId, State
    } catch {
        @()
    }
}

function Get-DargslanDhcpScopeUsage {
    <#
    .SYNOPSIS
        Return per-scope usage % (free vs in use vs reserved).
    #>
    [CmdletBinding()]
    param([string]$ComputerName = $env:COMPUTERNAME)
    Get-DhcpServerv4Scope -ComputerName $ComputerName | ForEach-Object {
        $stat = Get-DhcpServerv4ScopeStatistics -ComputerName $ComputerName -ScopeId $_.ScopeId
        [pscustomobject]@{
            ScopeId        = $_.ScopeId
            Name           = $_.Name
            Free           = $stat.Free
            InUse          = $stat.InUse
            Reserved       = $stat.Reserved
            PercentageInUse= $stat.PercentageInUse
        }
    }
}

function Get-DargslanDhcpAuditReport {
    <#
    .SYNOPSIS
        Combined DHCP audit with PASS / WARN / FAIL verdict.
    #>
    [CmdletBinding()]
    param([string]$ComputerName = $env:COMPUTERNAME)
    $scopes = @(Get-DargslanDhcpScopes -ComputerName $ComputerName)
    $fo     = @(Get-DargslanDhcpFailover -ComputerName $ComputerName)
    $usage  = @(Get-DargslanDhcpScopeUsage -ComputerName $ComputerName)
    $exhausted = @($usage | Where-Object PercentageInUse -ge 90)
    $active    = ($scopes | Where-Object State -eq 'Active').Count
    $score = 0
    if ($active -gt 0)         { $score++ }
    if ($fo.Count -gt 0)       { $score++ }
    if ($exhausted.Count -eq 0){ $score++ }
    $verdict = if ($score -eq 3) { 'PASS' } elseif ($score -ge 1) { 'WARN' } else { 'FAIL' }
    [pscustomobject]@{
        ComputerName  = $ComputerName
        Scopes        = $scopes
        Failover      = $fo
        Usage         = $usage
        Exhausted     = $exhausted
        ActiveScopes  = $active
        Score         = $score
        Verdict       = $verdict
        TimeStamp     = (Get-Date).ToString('s')
    }
}

function Export-DargslanDhcpAuditReport {
    <#
    .SYNOPSIS
        Export the DHCP audit to HTML and JSON.
    #>
    [CmdletBinding()]
    param([string]$ComputerName = $env:COMPUTERNAME, [string]$OutDir = (Join-Path $env:TEMP 'DargslanDhcpAudit'))
    if (-not (Test-Path $OutDir)) { New-Item -Type Directory -Path $OutDir | Out-Null }
    $r = Get-DargslanDhcpAuditReport -ComputerName $ComputerName
    $json = Join-Path $OutDir ('dhcp-' + $ComputerName + '.json')
    $html = Join-Path $OutDir ('dhcp-' + $ComputerName + '.html')
    $r | ConvertTo-Json -Depth 6 | Set-Content $json -Encoding UTF8
    $body  = "<h1>DHCP Audit - $($r.ComputerName)</h1>"
    $body += "<p>Verdict: <b>$($r.Verdict)</b> ($($r.Score)/3)</p>"
    $body += '<h2>Scopes</h2>'    + ($r.Scopes   | ConvertTo-Html -Fragment)
    $body += '<h2>Failover</h2>' + ($r.Failover | ConvertTo-Html -Fragment)
    $body += '<h2>Usage</h2>'    + ($r.Usage    | ConvertTo-Html -Fragment)
    ConvertTo-Html -Body $body -Title 'DHCP Audit' | Set-Content $html -Encoding UTF8
    [pscustomobject]@{ Json = $json; Html = $html; Verdict = $r.Verdict }
}


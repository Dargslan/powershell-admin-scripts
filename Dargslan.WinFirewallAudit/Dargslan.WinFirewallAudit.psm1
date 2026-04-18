<#
.SYNOPSIS
    Audit Windows Firewall profiles and rules. Detect risky Allow Any Any rules, disabled profiles and GPO overrides. JSON / HTML compliance report.

.DESCRIPTION
    Part of the Dargslan Windows Admin Tools collection.
    Free Cheat Sheet: https://dargslan.com/cheat-sheets/windows-firewall-audit-2026
    Full Guide:       https://dargslan.com/blog/windows-firewall-audit-powershell-2026
    More tools:       https://dargslan.com

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

$script:Banner = @"
+----------------------------------------------------------+
|  Dargslan Windows Firewall Audit                        
|  https://dargslan.com - Free cheat sheets & eBooks       |
+----------------------------------------------------------+
"@

function Get-DargslanFirewallProfile {
    <#
    .SYNOPSIS
        Return the state of all three firewall profiles (Domain / Private / Public).
    #>
    [CmdletBinding()]
    param()
    Get-NetFirewallProfile | Select-Object Name, Enabled, DefaultInboundAction, DefaultOutboundAction, AllowInboundRules, NotifyOnListen, LogAllowed, LogBlocked, LogFileName
}

function Get-DargslanFirewallRules {
    <#
    .SYNOPSIS
        Return enabled inbound rules with the resolved port / protocol / address.
    #>
    [CmdletBinding()]
    param([ValidateSet('Inbound','Outbound')]$Direction = 'Inbound')
    Get-NetFirewallRule -Direction $Direction -Enabled True |
        ForEach-Object {
            $f = $_ | Get-NetFirewallPortFilter -ErrorAction SilentlyContinue
            $a = $_ | Get-NetFirewallAddressFilter -ErrorAction SilentlyContinue
            [pscustomobject]@{
                Name        = $_.DisplayName
                Action      = $_.Action
                Profile     = $_.Profile
                Protocol    = $f.Protocol
                LocalPort   = ($f.LocalPort -join ',')
                RemoteAddr  = ($a.RemoteAddress -join ',')
                Program     = ($_ | Get-NetFirewallApplicationFilter -ErrorAction SilentlyContinue).Program
            }
        }
}

function Get-DargslanFirewallRiskyRules {
    <#
    .SYNOPSIS
        Detect Allow rules that are too permissive (Any protocol, Any address, Any port).
    #>
    [CmdletBinding()]
    param()
    Get-DargslanFirewallRules -Direction Inbound | Where-Object {
        $_.Action -eq 'Allow' -and
        ($_.RemoteAddr -eq 'Any' -or [string]::IsNullOrEmpty($_.RemoteAddr)) -and
        ($_.LocalPort -eq 'Any' -or [string]::IsNullOrEmpty($_.LocalPort))
    }
}

function Get-DargslanFirewallAuditReport {
    <#
    .SYNOPSIS
        Combined audit object with score and PASS / WARN / FAIL verdict.
    #>
    [CmdletBinding()]
    param()
    $profiles = Get-DargslanFirewallProfile
    $risky    = @(Get-DargslanFirewallRiskyRules)
    $enabled  = ($profiles | Where-Object Enabled).Count
    $score = 0
    if ($enabled -eq 3) { $score++ }
    if (($profiles | Where-Object DefaultInboundAction -eq 'Block').Count -eq 3) { $score++ }
    if ($risky.Count -eq 0) { $score++ }
    if (($profiles | Where-Object LogBlocked -eq 'True').Count -ge 1) { $score++ }
    $verdict = if ($score -ge 4) { 'PASS' } elseif ($score -ge 2) { 'WARN' } else { 'FAIL' }
    [pscustomobject]@{
        ComputerName = $env:COMPUTERNAME
        TimeStamp    = (Get-Date).ToString('s')
        ProfilesEnabled = $enabled
        RiskyRuleCount  = $risky.Count
        Score        = $score
        Verdict      = $verdict
        Profiles     = $profiles
        RiskyRules   = $risky
    }
}

function Export-DargslanFirewallAuditReport {
    <#
    .SYNOPSIS
        Export the audit report to HTML and JSON.
    #>
    [CmdletBinding()]
    param([string]$OutDir = (Join-Path $env:TEMP 'DargslanFirewallAudit'))
    if (-not (Test-Path $OutDir)) { New-Item -Type Directory -Path $OutDir | Out-Null }
    $r = Get-DargslanFirewallAuditReport
    $json = Join-Path $OutDir ('firewall-' + $env:COMPUTERNAME + '.json')
    $html = Join-Path $OutDir ('firewall-' + $env:COMPUTERNAME + '.html')
    $r | ConvertTo-Json -Depth 6 | Set-Content -Path $json -Encoding UTF8
    $body = "<h1>Firewall Audit - $($r.ComputerName)</h1><p>Verdict: <b>$($r.Verdict)</b> ($($r.Score)/4)</p>"
    $body += ($r.Profiles | ConvertTo-Html -Fragment)
    $body += '<h2>Risky Rules</h2>'
    $body += ($r.RiskyRules | ConvertTo-Html -Fragment)
    ConvertTo-Html -Body $body -Title 'Firewall Audit' | Set-Content -Path $html -Encoding UTF8
    [pscustomobject]@{ Json = $json; Html = $html; Verdict = $r.Verdict }
}


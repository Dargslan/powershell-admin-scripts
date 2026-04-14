<#
.SYNOPSIS
    Windows TLS/SSL protocol audit toolkit — cipher suite analysis, protocol version checking, Schannel configuration, and HTTPS endpoint testing (2026 Edition)

.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-TLSAudit {
    <#
    .SYNOPSIS
        Audit TLS/SSL configuration and cipher suites
    .DESCRIPTION
        Analyzes Schannel protocols, cipher suites, certificate bindings, and tests HTTPS endpoint security.
        Part of Dargslan.WinTLSAudit (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([string]$TestEndpoint, [switch]$Json)

    $report = [ordered]@{
        Protocols = @()
        CipherSuites = Get-TlsCipherSuite -ErrorAction SilentlyContinue | Select-Object -First 20 Name, @{N="Protocol";E={$_.Protocols -join ","}}, CipherBlockChaining, KeyExchangeAlgorithm
        SchannelConfig = @{}
        Warnings = @()
    }
    $protocols = @("SSL 2.0","SSL 3.0","TLS 1.0","TLS 1.1","TLS 1.2","TLS 1.3")
    foreach ($proto in $protocols) {
        $protoClean = $proto.Replace(" ","").Replace(".","")
        $serverKey = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\$proto\Server"
        $clientKey = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\$proto\Client"
        $serverEnabled = if (Test-Path $serverKey) { (Get-ItemProperty $serverKey -ErrorAction SilentlyContinue).Enabled } else { "Default" }
        $clientEnabled = if (Test-Path $clientKey) { (Get-ItemProperty $clientKey -ErrorAction SilentlyContinue).Enabled } else { "Default" }
        $report.Protocols += [PSCustomObject]@{ Protocol = $proto; ServerEnabled = $serverEnabled; ClientEnabled = $clientEnabled }
        if ($proto -match "SSL|TLS 1\.0|TLS 1\.1" -and $serverEnabled -ne 0 -and $serverEnabled -ne "Default") {
            $report.Warnings += "$proto is explicitly enabled — consider disabling for security"
        }
    }
    if ($TestEndpoint) {
        try {
            $tcp = New-Object System.Net.Sockets.TcpClient($TestEndpoint, 443)
            $ssl = New-Object System.Net.Security.SslStream($tcp.GetStream())
            $ssl.AuthenticateAsClient($TestEndpoint)
            $report.EndpointTest = [PSCustomObject]@{
                Host = $TestEndpoint; Protocol = $ssl.SslProtocol; CipherAlgorithm = $ssl.CipherAlgorithm
                CipherStrength = $ssl.CipherStrength; KeyExchange = $ssl.KeyExchangeAlgorithm
                Certificate = $ssl.RemoteCertificate.Subject; Expiry = $ssl.RemoteCertificate.GetExpirationDateString()
            }
            $ssl.Close(); $tcp.Close()
        } catch { $report.EndpointTest = [PSCustomObject]@{ Host = $TestEndpoint; Error = $_.Exception.Message } }
    }
    $score = 100
    $report.Protocols | Where-Object { $_.Protocol -match "SSL|TLS 1\.[01]" -and $_.ServerEnabled -ne 0 } | ForEach-Object { $score -= 15 }
    $report.SecurityScore = [PSCustomObject]@{ Score = [math]::Max(0,$score); Grade = $(if ($score -ge 80) {"A"} elseif ($score -ge 60) {"B"} else {"C"}) }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [TLS Audit — 2026 Edition]" -ForegroundColor Cyan
    $report.Protocols | Format-Table -AutoSize
    if ($report.EndpointTest) { $report.EndpointTest | Format-List }
    Write-Host "  Score: $($report.SecurityScore.Score)/100 ($($report.SecurityScore.Grade))" -ForegroundColor $(if ($score -ge 80) {"Green"} else {"Yellow"})
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  ⚠ $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function *

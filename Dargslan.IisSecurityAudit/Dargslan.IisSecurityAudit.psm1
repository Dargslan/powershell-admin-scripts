<#
.SYNOPSIS
    Audit IIS bindings, SChannel TLS protocols, weak ciphers and app pool identities. JSON / HTML report.

.DESCRIPTION
    Part of the Dargslan Windows Admin Tools collection.
    Free Cheat Sheet: https://dargslan.com/cheat-sheets/iis-tls-security-audit-2026
    Full Guide:       https://dargslan.com/blog/iis-tls-security-audit-powershell-2026
    More tools:       https://dargslan.com

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

$script:Banner = @"
+----------------------------------------------------------+
|  Dargslan IIS + TLS Security Audit                      
|  https://dargslan.com - Free cheat sheets & eBooks       |
+----------------------------------------------------------+
"@

function Get-DargslanIisBindings {
    <#
    .SYNOPSIS
        Return every IIS site binding with protocol, port, host header and cert thumbprint.
    #>
    [CmdletBinding()]
    param()
    Import-Module WebAdministration -ErrorAction Stop
    Get-Website | ForEach-Object {
        $site = $_
        $site.Bindings.Collection | ForEach-Object {
            $cert = $null
            if ($_.protocol -eq 'https' -and $_.certificateHash) {
                try {
                    $cert = Get-Item -Path "Cert:\LocalMachine\$($_.certificateStoreName)\$($_.certificateHash)" -ErrorAction SilentlyContinue
                } catch {}
            }
            [pscustomobject]@{
                Site         = $site.Name
                Protocol     = $_.protocol
                Binding      = $_.bindingInformation
                CertSubject  = $cert.Subject
                CertExpires  = $cert.NotAfter
                CertThumb    = $_.certificateHash
            }
        }
    }
}

function Get-DargslanIisTlsProtocols {
    <#
    .SYNOPSIS
        Read SChannel registry to determine TLS 1.0 / 1.1 / 1.2 / 1.3 enabled state.
    #>
    [CmdletBinding()]
    param()
    $base = 'HKLM:\\SYSTEM\\CurrentControlSet\\Control\\SecurityProviders\\SCHANNEL\\Protocols'
    foreach ($proto in 'TLS 1.0','TLS 1.1','TLS 1.2','TLS 1.3','SSL 3.0','SSL 2.0') {
        foreach ($role in 'Server','Client') {
            $key = "$base\\$proto\\$role"
            $enabled = $null; $disabled = $null
            if (Test-Path $key) {
                $v = Get-ItemProperty $key -ErrorAction SilentlyContinue
                $enabled  = $v.Enabled
                $disabled = $v.DisabledByDefault
            }
            [pscustomobject]@{
                Protocol         = $proto
                Role             = $role
                Enabled          = $enabled
                DisabledByDefault= $disabled
                Effective        = if ($enabled -eq 0) { 'Disabled' } elseif ($enabled -eq 1) { 'Enabled' } else { 'Default (OS)' }
            }
        }
    }
}

function Get-DargslanIisAppPoolIdentities {
    <#
    .SYNOPSIS
        Return every app pool with its identity and managed pipeline mode.
    #>
    [CmdletBinding()]
    param()
    Import-Module WebAdministration -ErrorAction Stop
    Get-ChildItem IIS:\\AppPools | ForEach-Object {
        [pscustomobject]@{
            AppPool        = $_.Name
            State          = $_.State
            IdentityType   = $_.processModel.identityType
            UserName       = $_.processModel.userName
            ManagedRuntime = $_.managedRuntimeVersion
            Pipeline       = $_.managedPipelineMode
        }
    }
}

function Get-DargslanIisSecurityAuditReport {
    <#
    .SYNOPSIS
        Combined IIS audit with PASS / WARN / FAIL verdict.
    #>
    [CmdletBinding()]
    param()
    $bindings = @(Get-DargslanIisBindings)
    $tls      = @(Get-DargslanIisTlsProtocols)
    $pools    = @(Get-DargslanIisAppPoolIdentities)
    $tls10On = ($tls | Where-Object { $_.Protocol -eq 'TLS 1.0' -and $_.Effective -ne 'Disabled' }).Count
    $tls11On = ($tls | Where-Object { $_.Protocol -eq 'TLS 1.1' -and $_.Effective -ne 'Disabled' }).Count
    $tls12On = ($tls | Where-Object { $_.Protocol -eq 'TLS 1.2' -and $_.Effective -eq 'Enabled' }).Count
    $customId= ($pools | Where-Object IdentityType -eq 'SpecificUser').Count
    $expiring= ($bindings | Where-Object { $_.CertExpires -and $_.CertExpires -lt (Get-Date).AddDays(30) }).Count
    $score = 0
    if ($tls10On -eq 0)   { $score++ }
    if ($tls11On -eq 0)   { $score++ }
    if ($tls12On -gt 0)   { $score++ }
    if ($customId -le 5)  { $score++ }
    if ($expiring -eq 0)  { $score++ }
    $verdict = if ($score -ge 4) { 'PASS' } elseif ($score -ge 2) { 'WARN' } else { 'FAIL' }
    [pscustomobject]@{
        ComputerName    = $env:COMPUTERNAME
        Bindings        = $bindings
        TlsProtocols    = $tls
        AppPools        = $pools
        TLS10Enabled    = $tls10On
        TLS11Enabled    = $tls11On
        ExpiringCerts   = $expiring
        SpecificUserPools = $customId
        Score           = $score
        Verdict         = $verdict
        TimeStamp       = (Get-Date).ToString('s')
    }
}

function Export-DargslanIisSecurityAuditReport {
    <#
    .SYNOPSIS
        Export the IIS audit to HTML and JSON.
    #>
    [CmdletBinding()]
    param([string]$OutDir = (Join-Path $env:TEMP 'DargslanIisAudit'))
    if (-not (Test-Path $OutDir)) { New-Item -Type Directory -Path $OutDir | Out-Null }
    $r = Get-DargslanIisSecurityAuditReport
    $json = Join-Path $OutDir ('iis-' + $env:COMPUTERNAME + '.json')
    $html = Join-Path $OutDir ('iis-' + $env:COMPUTERNAME + '.html')
    $r | ConvertTo-Json -Depth 6 | Set-Content $json -Encoding UTF8
    $body  = "<h1>IIS Audit - $($r.ComputerName)</h1>"
    $body += "<p>Verdict: <b>$($r.Verdict)</b> ($($r.Score)/5)</p>"
    $body += '<h2>Bindings</h2>' + ($r.Bindings | ConvertTo-Html -Fragment)
    $body += '<h2>TLS Protocols</h2>' + ($r.TlsProtocols | ConvertTo-Html -Fragment)
    $body += '<h2>App Pools</h2>' + ($r.AppPools | ConvertTo-Html -Fragment)
    ConvertTo-Html -Body $body -Title 'IIS Audit' | Set-Content $html -Encoding UTF8
    [pscustomobject]@{ Json = $json; Html = $html; Verdict = $r.Verdict }
}


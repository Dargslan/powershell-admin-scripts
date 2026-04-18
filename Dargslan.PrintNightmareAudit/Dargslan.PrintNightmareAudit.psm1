<#
.SYNOPSIS
    Audit Windows Print Spooler exposure (PrintNightmare): spooler state, Point-and-Print restrictions, unsigned drivers, package install policy.

.DESCRIPTION
    Part of the Dargslan Windows Admin Tools collection.
    Free Cheat Sheet: https://dargslan.com/cheat-sheets/printnightmare-print-spooler-audit-2026
    Full Guide:       https://dargslan.com/blog/printnightmare-print-spooler-audit-powershell-2026
    More tools:       https://dargslan.com

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

$script:Banner = @"
+----------------------------------------------------------+
|  Dargslan PrintNightmare Audit                          
|  https://dargslan.com - Free cheat sheets & eBooks       |
+----------------------------------------------------------+
"@

function Get-DargslanPrintSpoolerStatus {
    <#
    .SYNOPSIS
        Return spooler service state and shared printer count.
    #>
    [CmdletBinding()]
    param()
    $svc = Get-Service -Name Spooler
    $shared = @(Get-Printer -ErrorAction SilentlyContinue | Where-Object Shared)
    $isDc = (Get-WmiObject Win32_ComputerSystem).DomainRole -ge 4
    [pscustomobject]@{
        ComputerName    = $env:COMPUTERNAME
        SpoolerStatus   = $svc.Status
        SpoolerStartType= $svc.StartType
        IsDomainController = $isDc
        SharedPrinters  = $shared.Count
    }
}

function Get-DargslanPrintNightmareConfig {
    <#
    .SYNOPSIS
        Read PrintNightmare-relevant policy keys.
    #>
    [CmdletBinding()]
    param()
    $pp = 'HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Printers\\PointAndPrint'
    $nh = 'HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Printers'
    $ppk = if (Test-Path $pp) { Get-ItemProperty $pp } else { $null }
    $nhk = if (Test-Path $nh) { Get-ItemProperty $nh } else { $null }
    [pscustomobject]@{
        NoWarningNoElevationOnInstall   = $ppk.NoWarningNoElevationOnInstall
        UpdatePromptSettings            = $ppk.UpdatePromptSettings
        InForest                         = $ppk.InForest
        TrustedServers                   = $ppk.TrustedServers
        ServerList                       = $ppk.ServerList
        RestrictDriverInstallationToAdministrators = $nhk.RestrictDriverInstallationToAdministrators
    }
}

function Get-DargslanPrinterDrivers {
    <#
    .SYNOPSIS
        List installed printer drivers and check vendor + signature.
    #>
    [CmdletBinding()]
    param()
    Get-PrinterDriver -ErrorAction SilentlyContinue | ForEach-Object {
        $inf = $_.InfPath
        $signed = if ($inf -and (Test-Path $inf)) {
            (Get-AuthenticodeSignature $inf -ErrorAction SilentlyContinue).Status
        } else { 'Unknown' }
        [pscustomobject]@{
            Name    = $_.Name
            Manufacturer = $_.Manufacturer
            DriverVersion = $_.DriverVersion
            InfPath = $inf
            SignatureStatus = $signed
        }
    }
}

function Get-DargslanPrintNightmareAuditReport {
    <#
    .SYNOPSIS
        Combined report with PASS / WARN / FAIL verdict.
    #>
    [CmdletBinding()]
    param()
    $st  = Get-DargslanPrintSpoolerStatus
    $cfg = Get-DargslanPrintNightmareConfig
    $drv = @(Get-DargslanPrinterDrivers)
    $unsig = @($drv | Where-Object { $_.SignatureStatus -ne 'Valid' -and $_.SignatureStatus -ne 'Unknown' })
    $score = 0
    if ($cfg.RestrictDriverInstallationToAdministrators -eq 1) { $score++ }
    if ($cfg.NoWarningNoElevationOnInstall -ne 1) { $score++ }
    if ($cfg.UpdatePromptSettings -ne 1) { $score++ }
    if ($st.IsDomainController -and $st.SpoolerStatus -ne 'Running') { $score++ } elseif (-not $st.IsDomainController) { $score++ }
    if ($unsig.Count -eq 0) { $score++ }
    $verdict = if ($score -ge 4) { 'PASS' } elseif ($score -ge 2) { 'WARN' } else { 'FAIL' }
    [pscustomobject]@{
        ComputerName    = $env:COMPUTERNAME
        Spooler         = $st
        Config          = $cfg
        Drivers         = $drv
        UnsignedDrivers = $unsig
        Score           = $score
        Verdict         = $verdict
        TimeStamp       = (Get-Date).ToString('s')
    }
}

function Export-DargslanPrintNightmareAuditReport {
    <#
    .SYNOPSIS
        Export the audit to HTML and JSON.
    #>
    [CmdletBinding()]
    param([string]$OutDir = (Join-Path $env:TEMP 'DargslanPrintAudit'))
    if (-not (Test-Path $OutDir)) { New-Item -Type Directory -Path $OutDir | Out-Null }
    $r = Get-DargslanPrintNightmareAuditReport
    $json = Join-Path $OutDir ('print-' + $env:COMPUTERNAME + '.json')
    $html = Join-Path $OutDir ('print-' + $env:COMPUTERNAME + '.html')
    $r | ConvertTo-Json -Depth 6 | Set-Content $json -Encoding UTF8
    $body  = "<h1>PrintNightmare Audit - $($r.ComputerName)</h1>"
    $body += "<p>Verdict: <b>$($r.Verdict)</b> ($($r.Score)/5)</p>"
    $body += '<h2>Spooler</h2>' + ($r.Spooler | ConvertTo-Html -Fragment)
    $body += '<h2>Policy</h2>'  + ($r.Config  | ConvertTo-Html -Fragment)
    $body += '<h2>Drivers</h2>' + ($r.Drivers | ConvertTo-Html -Fragment)
    ConvertTo-Html -Body $body -Title 'PrintNightmare Audit' | Set-Content $html -Encoding UTF8
    [pscustomobject]@{ Json = $json; Html = $html; Verdict = $r.Verdict }
}


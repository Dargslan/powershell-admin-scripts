<#
.SYNOPSIS
    Audit Microsoft Defender configuration, ASR rule state, exclusions and tamper protection. JSON / HTML compliance report.

.DESCRIPTION
    Part of the Dargslan Windows Admin Tools collection.
    Free Cheat Sheet: https://dargslan.com/cheat-sheets/windows-defender-asr-audit-2026
    Full Guide:       https://dargslan.com/blog/windows-defender-asr-audit-powershell-2026
    More tools:       https://dargslan.com

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

$script:Banner = @"
+----------------------------------------------------------+
|  Dargslan Windows Defender + ASR Audit                  
|  https://dargslan.com - Free cheat sheets & eBooks       |
+----------------------------------------------------------+
"@

function Get-DargslanDefenderStatus {
    <#
    .SYNOPSIS
        Return real-time protection, signatures, tamper protection and engine state.
    #>
    [CmdletBinding()]
    param()
    $s = Get-MpComputerStatus
    [pscustomobject]@{
        ComputerName              = $env:COMPUTERNAME
        AntivirusEnabled          = $s.AntivirusEnabled
        RealTimeProtectionEnabled = $s.RealTimeProtectionEnabled
        BehaviorMonitorEnabled    = $s.BehaviorMonitorEnabled
        IoavProtectionEnabled     = $s.IoavProtectionEnabled
        TamperProtected           = $s.IsTamperProtected
        AMServiceEnabled          = $s.AMServiceEnabled
        SignatureAge              = $s.AntivirusSignatureAge
        EngineVersion             = $s.AMEngineVersion
        SignatureVersion          = $s.AntivirusSignatureVersion
    }
}

function Get-DargslanAsrRules {
    <#
    .SYNOPSIS
        Return all ASR rule IDs with friendly name and current state (Disabled / Block / Audit / Warn).
    #>
    [CmdletBinding()]
    param()
    $names = @{
        'BE9BA2D9-53EA-4CDC-84E5-9B1EEEE46550' = 'Block exec content from email'
        'D4F940AB-401B-4EFC-AADC-AD5F3C50688A' = 'Block child processes from Office'
        '3B576869-A4EC-4529-8536-B80A7769E899' = 'Block Office creating exec content'
        '75668C1F-73B5-4CF0-BB93-3ECF5CB7CC84' = 'Block Office injection'
        'D3E037E1-3EB8-44C8-A917-57927947596D' = 'Block JS / VBS launching exec content'
        '5BEB7EFE-FD9A-4556-801D-275E5FFC04CC' = 'Block obfuscated scripts'
        '92E97FA1-2EDF-4476-BDD6-9DD0B4DDDC7B' = 'Block Win32 imports from macros'
        '01443614-CD74-433A-B99E-2ECDC07BFC25' = 'Block exec from unsigned USB'
        'C1DB55AB-C21A-4637-BB3F-A12568109D35' = 'Use advanced ransomware protection'
        '9E6C4E1F-7D60-472F-BA1A-A39EF669E4B2' = 'Block credential stealing from LSASS'
        'D1E49AAC-8F56-4280-B9BA-993A6D77406C' = 'Block process creation from PSExec / WMI'
        'B2B3F03D-6A65-4F7B-A9C7-1C7EF74A9BA4' = 'Block untrusted USB processes'
        '26190899-1602-49E8-8B27-EB1D0A1CE869' = 'Block Office comms apps creating child'
        '7674BA52-37EB-4A4F-A9A1-F0F9A1619A2C' = 'Block Adobe Reader child processes'
        'E6DB77E5-3DF2-4CF1-B95A-636979351E5B' = 'Block persistence via WMI subscription'
    }
    $pref = Get-MpPreference
    $ids = @($pref.AttackSurfaceReductionRules_Ids)
    $st  = @($pref.AttackSurfaceReductionRules_Actions)
    $map = @{ 0 = 'Disabled'; 1 = 'Block'; 2 = 'Audit'; 6 = 'Warn' }
    $names.GetEnumerator() | ForEach-Object {
        $idx = [Array]::IndexOf($ids, $_.Key)
        $state = if ($idx -ge 0) { $map[[int]$st[$idx]] } else { 'NotConfigured' }
        [pscustomobject]@{ Id = $_.Key; Name = $_.Value; State = $state }
    }
}

function Get-DargslanDefenderExclusions {
    <#
    .SYNOPSIS
        Return all configured Defender exclusions (paths, extensions, processes, IPs).
    #>
    [CmdletBinding()]
    param()
    $p = Get-MpPreference
    [pscustomobject]@{
        Paths      = @($p.ExclusionPath)
        Extensions = @($p.ExclusionExtension)
        Processes  = @($p.ExclusionProcess)
        IpAddresses= @($p.ExclusionIpAddress)
    }
}

function Get-DargslanDefenderAuditReport {
    <#
    .SYNOPSIS
        Combined Defender audit object with PASS / WARN / FAIL verdict.
    #>
    [CmdletBinding()]
    param()
    $st  = Get-DargslanDefenderStatus
    $asr = @(Get-DargslanAsrRules)
    $ex  = Get-DargslanDefenderExclusions
    $blocked = ($asr | Where-Object State -eq 'Block').Count
    $score = 0
    if ($st.RealTimeProtectionEnabled) { $score++ }
    if ($st.TamperProtected) { $score++ }
    if ($st.SignatureAge -le 3) { $score++ }
    if ($blocked -ge 8) { $score++ }
    if ($ex.Paths.Count -le 5) { $score++ }
    $verdict = if ($score -ge 4) { 'PASS' } elseif ($score -ge 2) { 'WARN' } else { 'FAIL' }
    [pscustomobject]@{
        Status     = $st
        AsrRules   = $asr
        Exclusions = $ex
        Score      = $score
        Verdict    = $verdict
        TimeStamp  = (Get-Date).ToString('s')
    }
}

function Export-DargslanDefenderAuditReport {
    <#
    .SYNOPSIS
        Export the audit report to HTML and JSON.
    #>
    [CmdletBinding()]
    param([string]$OutDir = (Join-Path $env:TEMP 'DargslanDefenderAudit'))
    if (-not (Test-Path $OutDir)) { New-Item -Type Directory -Path $OutDir | Out-Null }
    $r = Get-DargslanDefenderAuditReport
    $json = Join-Path $OutDir ('defender-' + $env:COMPUTERNAME + '.json')
    $html = Join-Path $OutDir ('defender-' + $env:COMPUTERNAME + '.html')
    $r | ConvertTo-Json -Depth 6 | Set-Content $json -Encoding UTF8
    $body  = "<h1>Defender Audit - $($r.Status.ComputerName)</h1>"
    $body += "<p>Verdict: <b>$($r.Verdict)</b> ($($r.Score)/5)</p>"
    $body += ($r.Status   | ConvertTo-Html -Fragment)
    $body += '<h2>ASR Rules</h2>' + ($r.AsrRules | ConvertTo-Html -Fragment)
    $body += '<h2>Exclusions</h2><pre>' + (($r.Exclusions | ConvertTo-Json -Depth 4)) + '</pre>'
    ConvertTo-Html -Body $body -Title 'Defender Audit' | Set-Content $html -Encoding UTF8
    [pscustomobject]@{ Json = $json; Html = $html; Verdict = $r.Verdict }
}


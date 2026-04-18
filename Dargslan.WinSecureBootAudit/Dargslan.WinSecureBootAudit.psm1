<#
.SYNOPSIS
    Audit Windows Secure Boot, UEFI keys, TPM and BitLocker posture.

.DESCRIPTION
    Part of the Dargslan Windows Admin Tools collection.
    Free Cheat Sheet: https://dargslan.com/cheat-sheets/windows-secure-boot-audit-2026
    Full Guide:       https://dargslan.com/blog/windows-secure-boot-audit-powershell-2026
    More tools:       https://dargslan.com

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

$script:Banner = @"
+----------------------------------------------------------+
|  Dargslan Windows Secure Boot Audit                      |
|  https://dargslan.com - Free cheat sheets & eBooks       |
+----------------------------------------------------------+
"@

function Get-DargslanSecureBootStatus {
    [CmdletBinding()]
    param([switch]$Quiet)
    if (-not $Quiet) { Write-Host $script:Banner -ForegroundColor Cyan }
    $result = [ordered]@{
        ComputerName    = $env:COMPUTERNAME
        FirmwareType    = $null
        SecureBootEnabled = $null
        SetupMode       = $null
        AuditMode       = $null
        UEFIBitness     = $null
        Error           = $null
    }
    try {
        $fw = (Get-ComputerInfo -Property BiosFirmwareType -ErrorAction Stop).BiosFirmwareType
        $result.FirmwareType = $fw
        if ($fw -ne 'Uefi') {
            $result.Error = "System is not UEFI - Secure Boot is not applicable."
            return [PSCustomObject]$result
        }
        $result.SecureBootEnabled = [bool](Confirm-SecureBootUEFI -ErrorAction Stop)
        try { $result.SetupMode = (Get-SecureBootUEFI -Name SetupMode -ErrorAction Stop).Bytes[0] } catch {}
        try { $result.AuditMode = (Get-SecureBootUEFI -Name AuditMode -ErrorAction Stop).Bytes[0] } catch {}
        $result.UEFIBitness = if ([Environment]::Is64BitOperatingSystem) { 'x64' } else { 'x86' }
    } catch {
        $result.Error = $_.Exception.Message
    }
    [PSCustomObject]$result
}

function Get-DargslanSecureBootKeys {
    [CmdletBinding()]
    param()
    $keys = @('PK','KEK','db','dbx')
    foreach ($k in $keys) {
        $info = [ordered]@{ Name = $k; Present = $false; SizeBytes = 0; Note = $null }
        try {
            $v = Get-SecureBootUEFI -Name $k -ErrorAction Stop
            $info.Present   = $true
            $info.SizeBytes = $v.Bytes.Length
            switch ($k) {
                'PK'  { $info.Note = 'Platform Key — root of trust' }
                'KEK' { $info.Note = 'Key Exchange Key — typically Microsoft signed' }
                'db'  { $info.Note = 'Allowed signature database' }
                'dbx' { $info.Note = 'Forbidden signature database (revocation list)' }
            }
        } catch {
            $info.Note = $_.Exception.Message
        }
        [PSCustomObject]$info
    }
}

function Get-DargslanTpmSecurityStatus {
    [CmdletBinding()]
    param()
    $r = [ordered]@{
        Present       = $false
        Ready         = $false
        Enabled       = $null
        Activated     = $null
        Owned         = $null
        SpecVersion   = $null
        ManufacturerId= $null
        Error         = $null
    }
    try {
        $tpm = Get-Tpm -ErrorAction Stop
        $r.Present     = $true
        $r.Ready       = $tpm.TpmReady
        $r.Enabled     = $tpm.TpmEnabled
        $r.Activated   = $tpm.TpmActivated
        $r.Owned       = $tpm.TpmOwned
        $r.SpecVersion = $tpm.SpecVersion
        $r.ManufacturerId = $tpm.ManufacturerId
    } catch {
        $r.Error = $_.Exception.Message
    }
    [PSCustomObject]$r
}

function Get-DargslanBitLockerStatus {
    [CmdletBinding()]
    param()
    try {
        Get-BitLockerVolume -ErrorAction Stop | ForEach-Object {
            [PSCustomObject][ordered]@{
                MountPoint        = $_.MountPoint
                ProtectionStatus  = $_.ProtectionStatus
                EncryptionMethod  = $_.EncryptionMethod
                VolumeStatus      = $_.VolumeStatus
                EncryptionPercent = $_.EncryptionPercentage
                KeyProtector      = ($_.KeyProtector | ForEach-Object { $_.KeyProtectorType }) -join ','
            }
        }
    } catch {
        [PSCustomObject]@{ MountPoint='?'; Error=$_.Exception.Message }
    }
}

function Get-DargslanSecureBootAuditReport {
    [CmdletBinding()]
    param([switch]$Json)
    Write-Host $script:Banner -ForegroundColor Cyan
    $report = [ordered]@{
        Timestamp    = (Get-Date).ToString('o')
        Computer     = $env:COMPUTERNAME
        OS           = (Get-CimInstance Win32_OperatingSystem).Caption
        OSVersion    = (Get-CimInstance Win32_OperatingSystem).Version
        SecureBoot   = (Get-DargslanSecureBootStatus -Quiet)
        Keys         = (Get-DargslanSecureBootKeys)
        Tpm          = (Get-DargslanTpmSecurityStatus)
        BitLocker    = (Get-DargslanBitLockerStatus)
    }
    $score = 0; $max = 5; $issues = @()
    if ($report.SecureBoot.SecureBootEnabled) { $score++ } else { $issues += 'Secure Boot disabled' }
    if (($report.Keys | Where-Object Name -eq 'PK').Present) { $score++ } else { $issues += 'PK missing (Setup Mode?)' }
    if (($report.Keys | Where-Object Name -eq 'dbx').Present -and ($report.Keys | Where-Object Name -eq 'dbx').SizeBytes -gt 1024) { $score++ } else { $issues += 'dbx revocation list small or missing' }
    if ($report.Tpm.Ready) { $score++ } else { $issues += 'TPM not ready' }
    if (($report.BitLocker | Where-Object ProtectionStatus -eq 1).Count -gt 0) { $score++ } else { $issues += 'No BitLocker-protected volumes' }
    $report.Score   = "$score / $max"
    $report.Verdict = if ($score -ge 4) { 'PASS' } elseif ($score -ge 2) { 'WARN' } else { 'FAIL' }
    $report.Issues  = $issues
    if ($Json) { $report | ConvertTo-Json -Depth 6 } else { [PSCustomObject]$report }
}

function Export-DargslanSecureBootAuditReport {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)] [string]$Path,
        [ValidateSet('Json','Html')] [string]$Format = 'Html'
    )
    $r = Get-DargslanSecureBootAuditReport
    if ($Format -eq 'Json') {
        $r | ConvertTo-Json -Depth 6 | Set-Content -Path $Path -Encoding UTF8
        Write-Host "JSON report saved: $Path" -ForegroundColor Green
        return
    }
    $color = switch ($r.Verdict) { 'PASS' {'#16a34a'} 'WARN' {'#d97706'} default {'#dc2626'} }
    $issuesHtml = if ($r.Issues) { ($r.Issues | ForEach-Object { "<li>$_</li>" }) -join "" } else { "<li>None</li>" }
    $keysRows = ($r.Keys | ForEach-Object {
        $present = if ($_.Present) { 'YES' } else { 'NO' }
        "<tr><td>$($_.Name)</td><td>$present</td><td>$($_.SizeBytes)</td><td>$($_.Note)</td></tr>"
    }) -join ""
    $blRows = ($r.BitLocker | ForEach-Object {
        "<tr><td>$($_.MountPoint)</td><td>$($_.ProtectionStatus)</td><td>$($_.EncryptionMethod)</td><td>$($_.EncryptionPercent)%</td><td>$($_.KeyProtector)</td></tr>"
    }) -join ""
    $html = @"
<!doctype html>
<html><head><meta charset='utf-8'><title>Secure Boot Audit Report - $($r.Computer)</title>
<style>
body{font-family:Segoe UI,Arial,sans-serif;background:#0f172a;color:#e2e8f0;margin:0;padding:32px}
h1{color:#ff9900;margin-top:0}h2{color:#fb923c;border-bottom:1px solid #334155;padding-bottom:6px}
.card{background:#1e293b;padding:20px;border-radius:8px;margin:16px 0;border-left:4px solid $color}
.verdict{font-size:42px;font-weight:bold;color:$color}
table{width:100%;border-collapse:collapse;margin:8px 0}
th,td{text-align:left;padding:8px 12px;border-bottom:1px solid #334155}th{color:#fb923c}
.foot{margin-top:32px;padding-top:16px;border-top:1px solid #334155;color:#94a3b8;font-size:0.9em}
a{color:#fb923c}
</style></head><body>
<h1>Windows Secure Boot Audit Report</h1>
<div class='card'><div>Computer: <b>$($r.Computer)</b></div>
<div>OS: $($r.OS) ($($r.OSVersion))</div>
<div>Generated: $($r.Timestamp)</div>
<div>Score: <b>$($r.Score)</b></div>
<div class='verdict'>$($r.Verdict)</div>
<div>Issues:<ul>$issuesHtml</ul></div></div>
<h2>Secure Boot</h2>
<table><tr><th>Property</th><th>Value</th></tr>
<tr><td>FirmwareType</td><td>$($r.SecureBoot.FirmwareType)</td></tr>
<tr><td>SecureBootEnabled</td><td>$($r.SecureBoot.SecureBootEnabled)</td></tr>
<tr><td>SetupMode</td><td>$($r.SecureBoot.SetupMode)</td></tr>
<tr><td>AuditMode</td><td>$($r.SecureBoot.AuditMode)</td></tr></table>
<h2>UEFI Keys</h2>
<table><tr><th>Name</th><th>Present</th><th>Size (B)</th><th>Notes</th></tr>$keysRows</table>
<h2>TPM</h2>
<table><tr><th>Property</th><th>Value</th></tr>
<tr><td>Present</td><td>$($r.Tpm.Present)</td></tr>
<tr><td>Ready</td><td>$($r.Tpm.Ready)</td></tr>
<tr><td>Enabled</td><td>$($r.Tpm.Enabled)</td></tr>
<tr><td>Activated</td><td>$($r.Tpm.Activated)</td></tr>
<tr><td>Owned</td><td>$($r.Tpm.Owned)</td></tr>
<tr><td>SpecVersion</td><td>$($r.Tpm.SpecVersion)</td></tr></table>
<h2>BitLocker</h2>
<table><tr><th>Mount</th><th>Protection</th><th>Method</th><th>%</th><th>Protectors</th></tr>$blRows</table>
<div class='foot'>Generated by <b>Dargslan.WinSecureBootAudit</b> &mdash;
<a href='https://dargslan.com'>dargslan.com</a> |
<a href='https://dargslan.com/cheat-sheets/windows-secure-boot-audit-2026'>Cheat sheet</a> |
<a href='https://dargslan.com/blog/windows-secure-boot-audit-powershell-2026'>Full guide</a></div>
</body></html>
"@
    Set-Content -Path $Path -Value $html -Encoding UTF8
    Write-Host "HTML report saved: $Path" -ForegroundColor Green
}

Export-ModuleMember -Function *

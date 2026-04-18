<#
.SYNOPSIS
    Audit Hyper-V VMs: Secure Boot, vTPM, Shielded VM, snapshot retention, integration components. JSON / HTML report.

.DESCRIPTION
    Part of the Dargslan Windows Admin Tools collection.
    Free Cheat Sheet: https://dargslan.com/cheat-sheets/hyperv-vm-security-audit-2026
    Full Guide:       https://dargslan.com/blog/hyperv-vm-security-audit-powershell-2026
    More tools:       https://dargslan.com

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

$script:Banner = @"
+----------------------------------------------------------+
|  Dargslan Hyper-V Security Audit                        
|  https://dargslan.com - Free cheat sheets & eBooks       |
+----------------------------------------------------------+
"@

function Get-DargslanVmSecurityState {
    <#
    .SYNOPSIS
        Per-VM Secure Boot, vTPM, Shielded VM and Generation state.
    #>
    [CmdletBinding()]
    param([string]$ComputerName = $env:COMPUTERNAME)
    Get-VM -ComputerName $ComputerName | ForEach-Object {
        $fw = Get-VMFirmware -VM $_ -ErrorAction SilentlyContinue
        $sec= Get-VMSecurity -VM $_ -ErrorAction SilentlyContinue
        [pscustomobject]@{
            Host        = $ComputerName
            VM          = $_.Name
            Generation  = $_.Generation
            State       = $_.State
            SecureBoot  = $fw.SecureBoot
            SecureBootTemplate = $fw.SecureBootTemplate
            TpmEnabled  = $sec.TpmEnabled
            Shielded    = $sec.Shielded
            EncryptState= $sec.EncryptStateAndVmMigrationTraffic
        }
    }
}

function Get-DargslanVmSnapshots {
    <#
    .SYNOPSIS
        Per-VM checkpoint count and oldest checkpoint age.
    #>
    [CmdletBinding()]
    param([string]$ComputerName = $env:COMPUTERNAME)
    Get-VM -ComputerName $ComputerName | ForEach-Object {
        $snaps = @(Get-VMSnapshot -VM $_)
        $oldest = ($snaps | Sort CreationTime | Select-Object -First 1).CreationTime
        [pscustomobject]@{
            VM            = $_.Name
            CheckpointCount = $snaps.Count
            OldestSnapshot  = $oldest
            AgeDays         = if ($oldest) { [math]::Round(((Get-Date) - $oldest).TotalDays, 1) } else { $null }
        }
    }
}

function Get-DargslanVmIntegrationServices {
    <#
    .SYNOPSIS
        Integration components state per VM.
    #>
    [CmdletBinding()]
    param([string]$ComputerName = $env:COMPUTERNAME)
    Get-VM -ComputerName $ComputerName | ForEach-Object {
        $ic = Get-VMIntegrationService -VM $_
        [pscustomobject]@{
            VM        = $_.Name
            HeartBeat = ($ic | Where-Object Name -eq 'Heartbeat').Enabled
            TimeSync  = ($ic | Where-Object Name -eq 'Time Synchronization').Enabled
            Shutdown  = ($ic | Where-Object Name -eq 'Shutdown').Enabled
            Backup    = ($ic | Where-Object Name -eq 'VSS').Enabled
            GuestSvc  = ($ic | Where-Object Name -eq 'Guest Service Interface').Enabled
        }
    }
}

function Get-DargslanHyperVAuditReport {
    <#
    .SYNOPSIS
        Combined Hyper-V audit with PASS / WARN / FAIL verdict.
    #>
    [CmdletBinding()]
    param([string]$ComputerName = $env:COMPUTERNAME)
    $sec  = @(Get-DargslanVmSecurityState -ComputerName $ComputerName)
    $snap = @(Get-DargslanVmSnapshots -ComputerName $ComputerName)
    $ic   = @(Get-DargslanVmIntegrationServices -ComputerName $ComputerName)
    $gen2 = ($sec | Where-Object Generation -eq 2).Count
    $noSb = ($sec | Where-Object { $_.Generation -eq 2 -and -not $_.SecureBoot }).Count
    $noTp = ($sec | Where-Object { $_.Generation -eq 2 -and -not $_.TpmEnabled }).Count
    $oldSnaps = ($snap | Where-Object AgeDays -gt 7).Count
    $score = 0
    if ($sec.Count -gt 0)  { $score++ }
    if ($noSb -eq 0)        { $score++ }
    if ($noTp -le 1)        { $score++ }
    if ($oldSnaps -eq 0)   { $score++ }
    $verdict = if ($score -ge 3) { 'PASS' } elseif ($score -ge 1) { 'WARN' } else { 'FAIL' }
    [pscustomobject]@{
        Host          = $ComputerName
        VmCount       = $sec.Count
        Gen2Count     = $gen2
        NoSecureBoot  = $noSb
        NoTpm         = $noTp
        OldSnapshots  = $oldSnaps
        Security      = $sec
        Snapshots     = $snap
        Integration   = $ic
        Score         = $score
        Verdict       = $verdict
        TimeStamp     = (Get-Date).ToString('s')
    }
}

function Export-DargslanHyperVAuditReport {
    <#
    .SYNOPSIS
        Export the Hyper-V audit to HTML and JSON.
    #>
    [CmdletBinding()]
    param([string]$ComputerName = $env:COMPUTERNAME, [string]$OutDir = (Join-Path $env:TEMP 'DargslanHyperVAudit'))
    if (-not (Test-Path $OutDir)) { New-Item -Type Directory -Path $OutDir | Out-Null }
    $r = Get-DargslanHyperVAuditReport -ComputerName $ComputerName
    $json = Join-Path $OutDir ('hyperv-' + $ComputerName + '.json')
    $html = Join-Path $OutDir ('hyperv-' + $ComputerName + '.html')
    $r | ConvertTo-Json -Depth 6 | Set-Content $json -Encoding UTF8
    $body  = "<h1>Hyper-V Audit - $($r.Host)</h1>"
    $body += "<p>Verdict: <b>$($r.Verdict)</b> ($($r.Score)/4)</p>"
    $body += '<h2>Security</h2>'    + ($r.Security    | ConvertTo-Html -Fragment)
    $body += '<h2>Snapshots</h2>'   + ($r.Snapshots   | ConvertTo-Html -Fragment)
    $body += '<h2>Integration</h2>' + ($r.Integration | ConvertTo-Html -Fragment)
    ConvertTo-Html -Body $body -Title 'Hyper-V Audit' | Set-Content $html -Encoding UTF8
    [pscustomobject]@{ Json = $json; Html = $html; Verdict = $r.Verdict }
}


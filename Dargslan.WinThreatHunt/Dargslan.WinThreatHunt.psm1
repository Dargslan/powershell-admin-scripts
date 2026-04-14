<#
.SYNOPSIS
    Windows threat hunting toolkit — suspicious processes, network connections, unsigned DLLs, anomalous services, and IOC detection
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-ThreatHuntScan {
    <#
    .SYNOPSIS
        Run basic threat hunting checks on the local system
    .DESCRIPTION
        Part of Dargslan.WinThreatHunt (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        SuspiciousProcesses = Get-Process -ErrorAction SilentlyContinue | Where-Object {
            $_.Path -and ($_.Path -match "\Temp\" -or $_.Path -match "\AppData\Local\Temp" -or $_.Path -match "\Downloads\")
        } | Select-Object Name, Id, Path, @{N="CPU";E={[math]::Round($_.CPU,1)}} | Select-Object -First 15
        HiddenProcesses = Get-CimInstance Win32_Process -ErrorAction SilentlyContinue | Where-Object { $_.ExecutablePath -match "\\\.\|\Device\" } | Select-Object Name, ProcessId, ExecutablePath | Select-Object -First 5
        SuspiciousConnections = Get-NetTCPConnection -ErrorAction SilentlyContinue | Where-Object { $_.State -eq "Established" -and $_.RemotePort -in @(4444,5555,6666,7777,8888,9999,1234,31337) } | Select-Object LocalAddress, LocalPort, RemoteAddress, RemotePort, OwningProcess
        UnsignedServices = Get-CimInstance Win32_Service -ErrorAction SilentlyContinue | Where-Object { $_.PathName -and $_.State -eq "Running" } | ForEach-Object {
            $path = ($_.PathName -replace "^\""","" -split "\""")[0].Trim()
            if ($path -and (Test-Path $path -ErrorAction SilentlyContinue)) {
                $sig = Get-AuthenticodeSignature $path -ErrorAction SilentlyContinue
                if ($sig.Status -ne "Valid") { [PSCustomObject]@{ Name=$_.Name; Path=$path; SigStatus=$sig.Status } }
            }
        } | Select-Object -First 15
        RecentExeCreation = Get-ChildItem "$env:SystemDrive\Users\*\AppData\Local\Temp\*.exe","$env:SystemDrive\Users\*\Downloads\*.exe" -ErrorAction SilentlyContinue | Where-Object { $_.CreationTime -gt (Get-Date).AddDays(-7) } | Select-Object Name, FullName, CreationTime, @{N="SizeKB";E={[math]::Round($_.Length/1KB,0)}} | Select-Object -First 10
        Summary = [PSCustomObject]@{ SuspiciousProcs = 0; SuspiciousConns = 0; UnsignedSvcs = 0; RecentExes = 0 }
    }
    $report.Summary.SuspiciousProcs = ($report.SuspiciousProcesses | Measure-Object).Count
    $report.Summary.SuspiciousConns = ($report.SuspiciousConnections | Measure-Object).Count
    $report.Summary.UnsignedSvcs = ($report.UnsignedServices | Measure-Object).Count
    $report.Summary.RecentExes = ($report.RecentExeCreation | Measure-Object).Count
    $alerts = $report.Summary.SuspiciousProcs + $report.Summary.SuspiciousConns + $report.Summary.UnsignedSvcs
    $report.ThreatLevel = if($alerts -eq 0){"LOW"}elseif($alerts -le 3){"MEDIUM"}else{"HIGH"}
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Threat Hunt Scan - 2026]" -ForegroundColor Cyan
    Write-Host "  Threat Level: $($report.ThreatLevel)" -ForegroundColor $(if($report.ThreatLevel -eq "LOW"){"Green"}elseif($report.ThreatLevel -eq "MEDIUM"){"Yellow"}else{"Red"})
    $report.Summary | Format-List
    if ($report.SuspiciousProcesses) { Write-Host "  Suspicious Processes:" -ForegroundColor Red; $report.SuspiciousProcesses | Format-Table -AutoSize }
    if ($report.SuspiciousConnections) { Write-Host "  Suspicious Connections:" -ForegroundColor Red; $report.SuspiciousConnections | Format-Table -AutoSize }
    if ($report.UnsignedServices) { Write-Host "  Unsigned Services:" -ForegroundColor Yellow; $report.UnsignedServices | Format-Table -AutoSize }
    return $report
}

Export-ModuleMember -Function *

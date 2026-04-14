<#
.SYNOPSIS
    Windows Remote Management (WinRM) audit toolkit — WinRM configuration, trusted hosts, listener management, and security assessment (2026 Edition)

.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-WinRMAudit {
    <#
    .SYNOPSIS
        Audit WinRM configuration and security
    .DESCRIPTION
        Reports WinRM service status, listeners, trusted hosts, authentication settings, and security posture.
        Part of Dargslan.WinWinRMMgr (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $report = [ordered]@{
        Service = Get-Service WinRM -ErrorAction SilentlyContinue | Select-Object Status, StartType
        Listeners = Get-ChildItem WSMan:\localhost\Listener -ErrorAction SilentlyContinue | ForEach-Object {
            $listener = Get-ChildItem "WSMan:\localhost\Listener\$($_.Name)" -ErrorAction SilentlyContinue
            [PSCustomObject]@{
                Address = ($listener | Where-Object Name -eq "Address").Value
                Transport = ($listener | Where-Object Name -eq "Transport").Value
                Port = ($listener | Where-Object Name -eq "Port").Value
                Hostname = ($listener | Where-Object Name -eq "Hostname").Value
                CertThumbprint = ($listener | Where-Object Name -eq "CertificateThumbprint").Value
            }
        }
        TrustedHosts = (Get-Item WSMan:\localhost\Client\TrustedHosts -ErrorAction SilentlyContinue).Value
        Auth = Get-ChildItem WSMan:\localhost\Service\Auth -ErrorAction SilentlyContinue | Select-Object Name, Value
        MaxConnections = (Get-Item WSMan:\localhost\Shell\MaxConcurrentUsers -ErrorAction SilentlyContinue).Value
        MaxMemory = (Get-Item WSMan:\localhost\Shell\MaxMemoryPerShellMB -ErrorAction SilentlyContinue).Value
    }
    $score = 70
    if ($report.TrustedHosts -eq "*") { $score -= 30; $report | Add-Member -NotePropertyName "Warning" -NotePropertyValue "TrustedHosts is set to * — this is insecure" }
    $hasHTTPS = $report.Listeners | Where-Object Transport -eq "HTTPS"
    if ($hasHTTPS) { $score += 20 }
    $report.SecurityScore = [PSCustomObject]@{ Score = $score; Grade = $(if ($score -ge 80) {"A"} elseif ($score -ge 60) {"B"} else {"C"}) }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [WinRM Audit — 2026 Edition]" -ForegroundColor Cyan
    Write-Host "  Service: $($report.Service.Status) | TrustedHosts: $(if($report.TrustedHosts){$report.TrustedHosts}else{"(empty)"})"
    $report.Listeners | Format-Table -AutoSize
    Write-Host "  Auth Methods:" -ForegroundColor Yellow; $report.Auth | Format-Table -AutoSize
    Write-Host "  Score: $score/100" -ForegroundColor $(if ($score -ge 80) {"Green"} else {"Yellow"})
    return $report
}

Export-ModuleMember -Function *

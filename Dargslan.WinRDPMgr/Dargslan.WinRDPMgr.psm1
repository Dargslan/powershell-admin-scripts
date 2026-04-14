<#
.SYNOPSIS
    Windows Remote Desktop management toolkit — RDP session monitoring, configuration audit, security assessment, and connection logging

.DESCRIPTION
    Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
    Windows & DevOps Books: https://dargslan.com/books

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-RDPAudit {
    <#
    .SYNOPSIS
        Audit RDP configuration and active sessions
    .DESCRIPTION
        Reports RDP configuration, active sessions, recent login history, and security settings.
        Part of Dargslan.WinRDPMgr — https://dargslan.com
    #>
    [CmdletBinding()] param([int]$LogDays = 7, [switch]$Json)

    $report = [ordered]@{
        Config = [PSCustomObject]@{
            RDPEnabled = -not (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -ErrorAction SilentlyContinue).fDenyTSConnections
            NLA = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" -ErrorAction SilentlyContinue).UserAuthentication -eq 1
            Port = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" -ErrorAction SilentlyContinue).PortNumber
        }
        Sessions = query user 2>$null | Select-Object -Skip 1 | ForEach-Object { $parts = $_ -split "\s{2,}"; if ($parts.Count -ge 3) { [PSCustomObject]@{ User = $parts[0].Trim(); Session = $parts[1]; State = $parts[2] } } }
        RecentLogons = Get-WinEvent -FilterHashtable @{LogName="Security";ID=4624;StartTime=(Get-Date).AddDays(-$LogDays)} -MaxEvents 20 -ErrorAction SilentlyContinue | Where-Object { $_.Properties[8].Value -eq 10 } | Select-Object TimeCreated, @{N="User";E={$_.Properties[5].Value}}, @{N="Source";E={$_.Properties[18].Value}}
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [RDP Audit]" -ForegroundColor Cyan
    $report.Config | Format-List
    if ($report.Sessions) { Write-Host "  Active Sessions:" -ForegroundColor Yellow; $report.Sessions | Format-Table -AutoSize }
    return $report
}

Export-ModuleMember -Function *

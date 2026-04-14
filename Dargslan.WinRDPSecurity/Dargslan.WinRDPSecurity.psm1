function Get-RDPSecurityAudit {
    <#
    .SYNOPSIS
        Audit Remote Desktop security configuration
    .DESCRIPTION
        Windows Remote Desktop security audit toolkit — RDP settings, NLA enforcement, encryption level, certificate, session limits, and port
        Part of the Dargslan Windows Admin Toolkit — https://dargslan.com
    .PARAMETER Json
        Output results as JSON
    .EXAMPLE
        Get-RDPSecurityAudit
    .EXAMPLE
        Get-RDPSecurityAudit -Json
    .LINK
        https://dargslan.com
    .LINK
        https://www.powershellgallery.com/profiles/Dargslan
    #>
    [CmdletBinding()]
    param([switch]$Json)

    $report = [ordered]@{
        RDPEnabled = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -ErrorAction SilentlyContinue).fDenyTSConnections -eq 0
        NLA = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" -ErrorAction SilentlyContinue).UserAuthentication
        EncryptionLevel = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" -ErrorAction SilentlyContinue).MinEncryptionLevel
        SecurityLayer = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" -ErrorAction SilentlyContinue).SecurityLayer
        PortNumber = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" -ErrorAction SilentlyContinue).PortNumber
        MaxSessions = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -ErrorAction SilentlyContinue).MaxInstanceCount
        IdleTimeout = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -ErrorAction SilentlyContinue).MaxIdleTime
        Service = Get-Service TermService -ErrorAction SilentlyContinue | Select-Object Status, StartType
        FirewallRules = Get-NetFirewallRule -DisplayGroup "Remote Desktop" -ErrorAction SilentlyContinue | Select-Object DisplayName, Enabled, Direction, Action
        Warnings = @()
    }
    if ($report.NLA -ne 1) { $report.Warnings += "Network Level Authentication (NLA) is NOT enforced" }
    if ($report.PortNumber -eq 3389) { $report.Warnings += "RDP using default port 3389 — consider changing" }
    if ($report.SecurityLayer -lt 2) { $report.Warnings += "Security layer not set to SSL/TLS" }
    $score = 50
    if ($report.NLA -eq 1) { $score += 20 }
    if ($report.SecurityLayer -ge 2) { $score += 15 }
    if ($report.PortNumber -ne 3389) { $score += 10 }
    if ($report.EncryptionLevel -ge 3) { $score += 5 }
    $report.SecurityScore = [PSCustomObject]@{ Score=$score; Grade=$(if($score -ge 80){"A"}elseif($score -ge 60){"B"}elseif($score -ge 40){"C"}else{"D"}) }
    $report.Summary = [PSCustomObject]@{ RDPEnabled = $report.RDPEnabled; NLAEnforced = $report.NLA -eq 1; Port = $report.PortNumber; SecurityScore = $score }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [RDP Security Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    $report.SecurityScore | Format-List
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function Get-RDPSecurityAudit

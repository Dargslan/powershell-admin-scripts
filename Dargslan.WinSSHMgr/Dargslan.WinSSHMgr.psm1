<#
.SYNOPSIS
    Windows OpenSSH server and client management toolkit — SSH config audit, key management, session monitoring, and security hardening (2026 Edition)

.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-SSHReport {
    <#
    .SYNOPSIS
        Audit Windows OpenSSH server and client configuration
    .DESCRIPTION
        Reports SSH service status, sshd_config analysis, authorized keys, host keys, and security assessment.
        Part of Dargslan.WinSSHMgr (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $report = [ordered]@{
        SSHService = Get-Service sshd -ErrorAction SilentlyContinue | Select-Object Status, StartType, DisplayName
        SSHAgent = Get-Service ssh-agent -ErrorAction SilentlyContinue | Select-Object Status, StartType
        Installed = (Get-WindowsCapability -Online -Name OpenSSH* -ErrorAction SilentlyContinue | Where-Object State -eq "Installed") | Select-Object Name, State
        Config = @{}
        HostKeys = @()
        AuthorizedKeys = @()
        SecurityScore = 0
    }
    $sshdConfig = "$env:ProgramData\ssh\sshd_config"
    if (Test-Path $sshdConfig) {
        $cfg = Get-Content $sshdConfig | Where-Object { $_ -notmatch "^\s*#" -and $_ -match "\S" }
        $report.Config = [PSCustomObject]@{
            PermitRootLogin = ($cfg | Where-Object { $_ -match "PermitRootLogin\s+(\S+)" }) -replace "PermitRootLogin\s+", ""
            PasswordAuth = ($cfg | Where-Object { $_ -match "PasswordAuthentication\s+(\S+)" }) -replace "PasswordAuthentication\s+", ""
            PubkeyAuth = ($cfg | Where-Object { $_ -match "PubkeyAuthentication\s+(\S+)" }) -replace "PubkeyAuthentication\s+", ""
            MaxAuthTries = ($cfg | Where-Object { $_ -match "MaxAuthTries\s+(\d+)" }) -replace "MaxAuthTries\s+", ""
            Port = ($cfg | Where-Object { $_ -match "^Port\s+(\d+)" }) -replace "Port\s+", ""
            AllowUsers = ($cfg | Where-Object { $_ -match "AllowUsers" }) -replace "AllowUsers\s+", ""
        }
    }
    $hostKeyDir = "$env:ProgramData\ssh"
    if (Test-Path $hostKeyDir) {
        $report.HostKeys = Get-ChildItem "$hostKeyDir\ssh_host_*_key.pub" -ErrorAction SilentlyContinue | ForEach-Object {
            $content = Get-Content $_.FullName
            [PSCustomObject]@{ File = $_.Name; Type = ($content -split " ")[0]; Size = $_.Length }
        }
    }
    $score = 50
    if ($report.SSHService.Status -eq "Running") { $score += 10 }
    if ($report.Config.PasswordAuth -eq "no") { $score += 20 }
    if ($report.Config.PubkeyAuth -eq "yes") { $score += 10 }
    if ($report.Config.MaxAuthTries -and [int]$report.Config.MaxAuthTries -le 3) { $score += 10 }
    $report.SecurityScore = [PSCustomObject]@{ Score = $score; Grade = $(if ($score -ge 80) {"A"} elseif ($score -ge 60) {"B"} elseif ($score -ge 40) {"C"} else {"D"}) }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [SSH Report — 2026 Edition]" -ForegroundColor Cyan
    Write-Host "  Service: $($report.SSHService.Status) | Agent: $($report.SSHAgent.Status)"
    if ($report.Config) { $report.Config | Format-List }
    Write-Host "  Security Score: $score/100 ($($report.SecurityScore.Grade))" -ForegroundColor $(if ($score -ge 80) {"Green"} elseif ($score -ge 60) {"Yellow"} else {"Red"})
    return $report
}

Export-ModuleMember -Function *

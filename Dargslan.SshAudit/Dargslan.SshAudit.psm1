<#
.SYNOPSIS
    Audit OpenSSH server configuration and security settings on Windows

.DESCRIPTION
    Part of the Dargslan Windows Admin Tools collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
    Linux & DevOps Books: https://dargslan.com/books

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-SSHAudit {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan SSH Security Auditor                          ║
║  More tools: https://dargslan.com                       ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $checks = @()
    $sshService = Get-Service -Name sshd -ErrorAction SilentlyContinue
    $checks += [PSCustomObject]@{ Check = "SSH Service"; Value = $(if ($sshService) { $sshService.Status } else { "Not Installed" }); Status = $(if ($sshService -and $sshService.Status -eq 'Running') { "INFO" } else { "N/A" }) }
    $configPath = "$env:ProgramData\ssh\sshd_config"
    if (Test-Path $configPath) {
        $config = Get-Content $configPath -ErrorAction SilentlyContinue
        $rootLogin = ($config | Select-String "^PermitRootLogin\s+(\w+)" | ForEach-Object { $_.Matches.Groups[1].Value })
        $checks += [PSCustomObject]@{ Check = "Root Login"; Value = $(if ($rootLogin) { $rootLogin } else { "default" }); Status = $(if ($rootLogin -eq "no") { "PASS" } else { "WARN" }) }
        $pwAuth = ($config | Select-String "^PasswordAuthentication\s+(\w+)" | ForEach-Object { $_.Matches.Groups[1].Value })
        $checks += [PSCustomObject]@{ Check = "Password Auth"; Value = $(if ($pwAuth) { $pwAuth } else { "default(yes)" }); Status = $(if ($pwAuth -eq "no") { "PASS" } else { "WARN" }) }
        $port = ($config | Select-String "^Port\s+(\d+)" | ForEach-Object { $_.Matches.Groups[1].Value })
        $checks += [PSCustomObject]@{ Check = "SSH Port"; Value = $(if ($port) { $port } else { "22" }); Status = $(if ($port -and $port -ne "22") { "PASS" } else { "INFO" }) }
    } else { $checks += [PSCustomObject]@{ Check = "SSH Config"; Value = "Not found at $configPath"; Status = "N/A" } }
    if ($Json) { $checks | ConvertTo-Json } else { $checks | Format-Table -AutoSize }
}

Export-ModuleMember -Function *

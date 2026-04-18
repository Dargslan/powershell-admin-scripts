<#
.SYNOPSIS
    Harden OpenSSH server configuration on Windows

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

function Get-SSHHardeningReport {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Ssh Hardening
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $configPath = "$env:ProgramData\ssh\sshd_config"; if (-not (Test-Path $configPath)) { Write-Host "SSH config not found" -ForegroundColor Red; return }; $config = Get-Content $configPath; $checks = @("PermitRootLogin","PasswordAuthentication","PubkeyAuthentication","X11Forwarding","MaxAuthTries","Protocol"); foreach ($c in $checks) { $val = ($config | Select-String "^$c\s+(.+)" | ForEach-Object { $_.Matches.Groups[1].Value }); Write-Host "  $c : $(if($val){$val}else{"(default)"})" -ForegroundColor Yellow }
}


Export-ModuleMember -Function *

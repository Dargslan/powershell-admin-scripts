<#
.SYNOPSIS
    Audit SSH keys and authorized keys on Windows

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

function Get-SSHKeyAudit {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Sshkey Audit
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $sshDir = Join-Path $env:USERPROFILE ".ssh"; if (Test-Path $sshDir) { $keys = Get-ChildItem $sshDir -File; Write-Host "`n[SSH Keys in $sshDir]" -ForegroundColor Yellow; $keys | Select-Object Name, @{N="SizeB";E={$_.Length}}, LastWriteTime | Format-Table -AutoSize; $authKeys = Join-Path $sshDir "authorized_keys"; if (Test-Path $authKeys) { $count = (Get-Content $authKeys | Where-Object { $_ -match "^ssh-" }).Count; Write-Host "[Authorized Keys] $count key(s)" -ForegroundColor Cyan } } else { Write-Host "No .ssh directory found" -ForegroundColor Yellow }
}


Export-ModuleMember -Function *

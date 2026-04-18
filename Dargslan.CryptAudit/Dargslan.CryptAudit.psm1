<#
.SYNOPSIS
    Audit encryption settings, BitLocker status, and cipher suites

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

function Get-EncryptionAudit {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Crypt Audit
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $bitlocker = Get-BitLockerVolume -ErrorAction SilentlyContinue; if ($bitlocker) { Write-Host "`n[BitLocker Status]" -ForegroundColor Yellow; $bitlocker | Select-Object MountPoint, VolumeStatus, ProtectionStatus, EncryptionPercentage | Format-Table -AutoSize } else { Write-Host "BitLocker not available" -ForegroundColor Yellow }; $tls = [Net.ServicePointManager]::SecurityProtocol; Write-Host "`n[TLS Protocols] $tls" -ForegroundColor Cyan
}


Export-ModuleMember -Function *

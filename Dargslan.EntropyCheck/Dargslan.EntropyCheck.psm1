<#
.SYNOPSIS
    Check system randomness and cryptographic entropy sources

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

function Get-EntropyStatus {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Entropy Check
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $rng = [System.Security.Cryptography.RNGCryptoServiceProvider]::new(); $bytes = New-Object byte[] 1024; $sw = [Diagnostics.Stopwatch]::StartNew(); for ($i=0;$i-lt100;$i++) { $rng.GetBytes($bytes) }; $sw.Stop(); Write-Host "`n[Entropy] CSPRNG Performance: 100KB in $($sw.ElapsedMilliseconds)ms" -ForegroundColor Yellow; $tpm = Get-Tpm -ErrorAction SilentlyContinue; if ($tpm) { Write-Host "[TPM] Present: $($tpm.TpmPresent) | Ready: $($tpm.TpmReady) | Version: $($tpm.ManufacturerVersion)" -ForegroundColor Cyan } else { Write-Host "[TPM] Not available" -ForegroundColor Yellow }
}


Export-ModuleMember -Function *

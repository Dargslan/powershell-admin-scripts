<#
.SYNOPSIS
    Check file integrity using hashes and detect unauthorized changes

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

function Get-FileIntegrity {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan File Integrity
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    param([string]$ScanPath = "$env:SystemRoot\System32\drivers\etc") ; $files = Get-ChildItem -Path $ScanPath -File -ErrorAction SilentlyContinue; $results = foreach ($f in $files) { $hash = Get-FileHash -Path $f.FullName -Algorithm SHA256 -ErrorAction SilentlyContinue; [PSCustomObject]@{File=$f.Name; Size=$f.Length; Modified=$f.LastWriteTime.ToString("yyyy-MM-dd HH:mm"); SHA256=$hash.Hash.Substring(0,16)+"..."} }; if ($Json) { $results | ConvertTo-Json } else { $results | Format-Table -AutoSize }
}


Export-ModuleMember -Function *

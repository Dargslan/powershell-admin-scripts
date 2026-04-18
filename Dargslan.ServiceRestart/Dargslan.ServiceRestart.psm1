<#
.SYNOPSIS
    Restart Windows services safely with dependency handling

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

function Restart-ServiceSafe {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Service Restart
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    param([Parameter(Mandatory=$true)][string]$ServiceName) ; $svc = Get-Service -Name $ServiceName -ErrorAction SilentlyContinue; if (-not $svc) { Write-Host "Service not found: $ServiceName" -ForegroundColor Red; return }; $deps = Get-Service -Name $ServiceName -DependentServices -ErrorAction SilentlyContinue; if ($deps) { Write-Host "`n[Dependencies] $($deps.Count) dependent service(s):" -ForegroundColor Yellow; $deps | Select-Object Name, Status | Format-Table -AutoSize }; Write-Host "Service $ServiceName is $($svc.Status)" -ForegroundColor $(if($svc.Status-eq"Running"){"Green"}else{"Red"})
}


Export-ModuleMember -Function *

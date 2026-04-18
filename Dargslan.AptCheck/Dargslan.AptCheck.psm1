<#
.SYNOPSIS
    Check Windows Update and installed package health

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

function Get-UpdateStatus {
    [CmdletBinding()]
    param([switch]$PendingOnly, [switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Update Health Checker                         ║
║  More tools: https://dargslan.com                       ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $session = New-Object -ComObject Microsoft.Update.Session -ErrorAction SilentlyContinue
    if ($session) {
        $searcher = $session.CreateUpdateSearcher()
        $pending = $searcher.Search("IsInstalled=0").Updates
        Write-Host "`n[Updates] Pending: $($pending.Count)" -ForegroundColor $(if ($pending.Count -eq 0) { 'Green' } else { 'Yellow' })
        $results = @()
        foreach ($u in $pending) {
            $results += [PSCustomObject]@{ Title = $u.Title; Severity = $u.MsrcSeverity; Size = [math]::Round($u.MaxDownloadSize / 1MB, 1); KBs = ($u.KBArticleIDs -join ",") }
        }
        if ($Json) { $results | ConvertTo-Json } else { $results | Format-Table -AutoSize }
    } else { Write-Host "Cannot access Windows Update COM object" -ForegroundColor Red }
}

function Get-InstalledSoftware {
    [CmdletBinding()]
    param([string]$Filter = "*")
    $paths = @("HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*", "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*")
    $apps = $paths | ForEach-Object { Get-ItemProperty $_ -ErrorAction SilentlyContinue } | Where-Object { $_.DisplayName -and $_.DisplayName -like $Filter } | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Sort-Object DisplayName
    $apps | Format-Table -AutoSize
}

Export-ModuleMember -Function *

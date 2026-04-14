<#
.SYNOPSIS
    Monitor disk quotas and usage limits

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

function Get-DiskQuotaReport {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Disk Quota
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $volumes = Get-Volume | Where-Object { $_.DriveLetter -and $_.DriveType -eq "Fixed" }; $results = foreach ($v in $volumes) { $pct = if ($v.Size -gt 0) { [math]::Round(($v.Size - $v.SizeRemaining) / $v.Size * 100, 1) } else { 0 }; [PSCustomObject]@{Drive="$($v.DriveLetter):"; Label=$v.FileSystemLabel; TotalGB=[math]::Round($v.Size/1GB,1); UsedGB=[math]::Round(($v.Size-$v.SizeRemaining)/1GB,1); FreeGB=[math]::Round($v.SizeRemaining/1GB,1); "Used%"=$pct; Status=if($pct -gt 90){"CRITICAL"}elseif($pct -gt 75){"WARNING"}else{"OK"}} }; if ($Json) { $results | ConvertTo-Json } else { $results | Format-Table -AutoSize }
}


Export-ModuleMember -Function *

<#
.SYNOPSIS
    Analyze Windows Security and Audit event logs

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

function Get-AuditLogReport {
    [CmdletBinding()]
    param([int]$Hours = 24, [string]$LogName = "Security", [switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Audit Log Analyzer                            ║
║  More tools: https://dargslan.com                       ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $start = (Get-Date).AddHours(-$Hours)
    $events = Get-WinEvent -FilterHashtable @{LogName=$LogName; StartTime=$start} -MaxEvents 500 -ErrorAction SilentlyContinue
    if ($events) {
        $summary = $events | Group-Object -Property Id | Sort-Object Count -Descending | Select-Object -First 20 | ForEach-Object { [PSCustomObject]@{ EventID = $_.Name; Count = $_.Count; Sample = ($_.Group[0].Message -split "`n")[0] } }
        Write-Host "`n[Audit] $($events.Count) events in last $Hours hours" -ForegroundColor Yellow
        if ($Json) { $summary | ConvertTo-Json } else { $summary | Format-Table -AutoSize }
    } else { Write-Host "No events found in $LogName log" -ForegroundColor Yellow }
}

function Get-FailedLogins {
    [CmdletBinding()]
    param([int]$Hours = 24)
    Write-Host "`n[Security] Failed login attempts (last $Hours hours):" -ForegroundColor Yellow
    $start = (Get-Date).AddHours(-$Hours)
    $failed = Get-WinEvent -FilterHashtable @{LogName='Security'; Id=4625; StartTime=$start} -ErrorAction SilentlyContinue
    if ($failed) {
        Write-Host "  Total failed attempts: $($failed.Count)" -ForegroundColor Red
        $failed | Select-Object TimeCreated, @{N='Account';E={$_.Properties[5].Value}}, @{N='Source';E={$_.Properties[19].Value}} | Format-Table -AutoSize
    } else { Write-Host "  No failed login attempts found." -ForegroundColor Green }
}

Export-ModuleMember -Function *

<#
.SYNOPSIS
    Display timezone information and UTC offset details

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

function Get-TimezoneReport {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Timezone Info
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $tz = Get-TimeZone; $allTz = Get-TimeZone -ListAvailable | Measure-Object; Write-Host "`n[Current Timezone]" -ForegroundColor Yellow; [PSCustomObject]@{Id=$tz.Id; DisplayName=$tz.DisplayName; UTCOffset=$tz.BaseUtcOffset.ToString(); DST=$tz.SupportsDaylightSavingTime; CurrentTime=(Get-Date).ToString("yyyy-MM-dd HH:mm:ss"); UTCTime=(Get-Date).ToUniversalTime().ToString("yyyy-MM-dd HH:mm:ss")} | Format-List; Write-Host "[Available Timezones] $($allTz.Count)" -ForegroundColor Cyan
}


Export-ModuleMember -Function *

<#
.SYNOPSIS
    Check system locale, timezone, and regional settings

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

function Get-LocaleReport {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Locale Check
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $culture = Get-Culture; $tz = Get-TimeZone; [PSCustomObject]@{Culture=$culture.Name; DisplayName=$culture.DisplayName; DateFormat=$culture.DateTimeFormat.ShortDatePattern; TimeFormat=$culture.DateTimeFormat.ShortTimePattern; Timezone=$tz.Id; UTCOffset=$tz.BaseUtcOffset.ToString(); DaylightSaving=$tz.SupportsDaylightSavingTime; Encoding=[Console]::OutputEncoding.EncodingName} | Format-List
}


Export-ModuleMember -Function *

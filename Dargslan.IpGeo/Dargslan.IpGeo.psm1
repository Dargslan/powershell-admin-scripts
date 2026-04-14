<#
.SYNOPSIS
    Look up IP geolocation and network information

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

function Get-IpGeoLocation {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Ip Geo
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    param([string]$IP = "") ; if (-not $IP) { $pub = (Invoke-RestMethod -Uri "https://api.ipify.org?format=json" -ErrorAction SilentlyContinue).ip; $IP = $pub; Write-Host "`n[Public IP] $IP" -ForegroundColor Yellow }; try { $geo = Invoke-RestMethod -Uri "http://ip-api.com/json/$IP" -ErrorAction Stop; [PSCustomObject]@{IP=$geo.query; Country=$geo.country; Region=$geo.regionName; City=$geo.city; ISP=$geo.isp; Org=$geo.org; Timezone=$geo.timezone} | Format-List } catch { Write-Host "Lookup failed: $_" -ForegroundColor Red }
}


Export-ModuleMember -Function *

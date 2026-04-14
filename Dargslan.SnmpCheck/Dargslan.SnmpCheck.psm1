<#
.SYNOPSIS
    Check SNMP service configuration and community strings

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

function Get-SnmpStatus {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Snmp Check
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $snmp = Get-Service -Name "SNMP" -ErrorAction SilentlyContinue; Write-Host "`n[SNMP Service] $(if($snmp){"$($snmp.Status)"}else{"Not installed"})" -ForegroundColor $(if($snmp-and$snmp.Status-eq"Running"){"Green"}elseif($snmp){"Yellow"}else{"Red"})
}


Export-ModuleMember -Function *

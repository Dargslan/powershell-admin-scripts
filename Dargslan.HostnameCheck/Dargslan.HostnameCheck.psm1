<#
.SYNOPSIS
    Verify hostname, domain membership, and DNS registration

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

function Get-HostnameReport {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Hostname Check
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $cs = Get-CimInstance Win32_ComputerSystem; $dns = [System.Net.Dns]::GetHostEntry($env:COMPUTERNAME); [PSCustomObject]@{Hostname=$env:COMPUTERNAME; Domain=$cs.Domain; DomainJoined=$cs.PartOfDomain; FQDN=$dns.HostName; IPs=($dns.AddressList.IPAddressToString -join ", "); Workgroup=$cs.Workgroup} | Format-List
}


Export-ModuleMember -Function *

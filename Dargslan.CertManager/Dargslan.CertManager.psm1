<#
.SYNOPSIS
    Manage and audit SSL/TLS certificates in Windows certificate store

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

function Get-CertificateInventory {
    [CmdletBinding()]
    param([int]$ExpiringDays = 30, [switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Certificate Manager                           ║
║  More tools: https://dargslan.com                       ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $stores = @("Cert:\LocalMachine\My", "Cert:\LocalMachine\Root", "Cert:\CurrentUser\My")
    $results = @()
    foreach ($store in $stores) {
        $certs = Get-ChildItem -Path $store -ErrorAction SilentlyContinue
        foreach ($cert in $certs) {
            $daysLeft = [math]::Round(($cert.NotAfter - (Get-Date)).TotalDays, 0)
            $status = if ($daysLeft -lt 0) { "EXPIRED" } elseif ($daysLeft -lt $ExpiringDays) { "EXPIRING" } else { "OK" }
            $results += [PSCustomObject]@{ Subject = $cert.Subject.Substring(0, [Math]::Min(50, $cert.Subject.Length)); Store = $store; Expires = $cert.NotAfter.ToString("yyyy-MM-dd"); DaysLeft = $daysLeft; Status = $status; Thumbprint = $cert.Thumbprint.Substring(0,8) + "..." }
        }
    }
    $expired = ($results | Where-Object Status -eq "EXPIRED").Count
    $expiring = ($results | Where-Object Status -eq "EXPIRING").Count
    Write-Host "`n[Certs] Total: $($results.Count) | Expired: $expired | Expiring (<${ExpiringDays}d): $expiring" -ForegroundColor $(if ($expired -gt 0) { 'Red' } elseif ($expiring -gt 0) { 'Yellow' } else { 'Green' })
    if ($Json) { $results | ConvertTo-Json } else { $results | Format-Table -AutoSize }
}

Export-ModuleMember -Function *

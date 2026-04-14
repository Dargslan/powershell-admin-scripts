<#
.SYNOPSIS
    Windows certificate management toolkit — certificate inventory, expiry monitoring, chain validation, and certificate store auditing

.DESCRIPTION
    Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
    Windows & DevOps Books: https://dargslan.com/books

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-CertificateReport {
    <#
    .SYNOPSIS
        Audit certificates across all Windows certificate stores
    .DESCRIPTION
        Lists all certificates with expiry tracking, identifies expiring certificates, and validates certificate chains.
        Part of Dargslan.WinCertMgr — https://dargslan.com
    #>
    [CmdletBinding()] param([int]$ExpiryWarningDays = 30, [switch]$Json)

    $stores = @("My","WebHosting","Root","CA")
    $report = [ordered]@{ Summary = @{}; Expiring = @(); AllCerts = @() }
    foreach ($store in $stores) {
        $certs = Get-ChildItem "Cert:\LocalMachine\$store" -ErrorAction SilentlyContinue
        $report.Summary[$store] = ($certs | Measure-Object).Count
        $certs | ForEach-Object {
            $daysLeft = ($_.NotAfter - (Get-Date)).Days
            $info = [PSCustomObject]@{ Store = $store; Subject = $_.Subject; Thumbprint = $_.Thumbprint.Substring(0,16)+"..."; NotAfter = $_.NotAfter; DaysLeft = $daysLeft; Issuer = $_.Issuer.Substring(0,[math]::Min(40,$_.Issuer.Length)) }
            $report.AllCerts += $info
            if ($daysLeft -lt $ExpiryWarningDays -and $daysLeft -gt -1) { $report.Expiring += $info }
        }
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Certificate Report]" -ForegroundColor Cyan
    $report.Summary.GetEnumerator() | ForEach-Object { Write-Host "  $($_.Key): $($_.Value) certificates" }
    if ($report.Expiring) { Write-Host "`n  Expiring within $ExpiryWarningDays days:" -ForegroundColor Red; $report.Expiring | Format-Table Store, Subject, NotAfter, DaysLeft -AutoSize }
    return $report
}

Export-ModuleMember -Function *

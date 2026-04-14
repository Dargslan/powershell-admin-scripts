function Get-PKIAudit {
    <#
    .SYNOPSIS
        Audit PKI certificate authority and issued certificates
    .DESCRIPTION
        Windows PKI and certificate authority audit toolkit — CA configuration, templates, issued certs, CRL, OCSP, and PKI health
        Part of the Dargslan Windows Admin Toolkit — https://dargslan.com
    .PARAMETER Json
        Output results as JSON
    .EXAMPLE
        Get-PKIAudit
    .EXAMPLE
        Get-PKIAudit -Json
    .LINK
        https://dargslan.com
    .LINK
        https://www.powershellgallery.com/profiles/Dargslan
    #>
    [CmdletBinding()]
    param([switch]$Json)

    $report = [ordered]@{
        CAConfig = certutil -CAInfo 2>$null | Where-Object { $_ -match "\S" } | Select-Object -First 20 | ForEach-Object { $_.Trim() }
        Templates = certutil -catemplates 2>$null | Where-Object { $_ -match "\S" } | Select-Object -First 30 | ForEach-Object { $_.Trim() }
        CRL = certutil -URL "ldap:" 2>$null | Where-Object { $_ -match "\S" } | Select-Object -First 10
        LocalCerts = Get-ChildItem Cert:\LocalMachine\My -ErrorAction SilentlyContinue | Select-Object Subject, Issuer, NotAfter, Thumbprint, HasPrivateKey | Select-Object -First 30
        ExpiringCerts = Get-ChildItem Cert:\LocalMachine\My -ErrorAction SilentlyContinue | Where-Object { $_.NotAfter -lt (Get-Date).AddDays(30) } | Select-Object Subject, NotAfter
        RootCAs = Get-ChildItem Cert:\LocalMachine\Root -ErrorAction SilentlyContinue | Measure-Object | Select-Object Count
        Warnings = @()
    }
    $report.ExpiringCerts | ForEach-Object { $report.Warnings += "Certificate expiring soon: $($_.Subject) on $($_.NotAfter)" }
    $report.Summary = [PSCustomObject]@{ LocalCertCount = ($report.LocalCerts | Measure-Object).Count; ExpiringCount = ($report.ExpiringCerts | Measure-Object).Count; RootCACount = $report.RootCAs.Count }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [PKI Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.LocalCerts) { $report.LocalCerts | Format-Table Subject, NotAfter, HasPrivateKey -AutoSize }
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function Get-PKIAudit

function Get-ADFSAudit {
    <#
    .SYNOPSIS
        Audit AD FS federation service and relying parties
    .DESCRIPTION
        Windows AD FS audit toolkit — federation service, relying parties, claims providers, certificates, endpoints, and token config
        Part of the Dargslan Windows Admin Toolkit — https://dargslan.com
    .PARAMETER Json
        Output results as JSON
    .EXAMPLE
        Get-ADFSAudit
    .EXAMPLE
        Get-ADFSAudit -Json
    .LINK
        https://dargslan.com
    .LINK
        https://www.powershellgallery.com/profiles/Dargslan
    #>
    [CmdletBinding()]
    param([switch]$Json)

    $report = [ordered]@{
        Service = Get-Service adfssrv -ErrorAction SilentlyContinue | Select-Object Status, StartType
        Properties = Get-AdfsProperties -ErrorAction SilentlyContinue | Select-Object HostName, Identifier, SslPort, HttpsPort, FederationPassiveAddress
        RelyingParties = Get-AdfsRelyingPartyTrust -ErrorAction SilentlyContinue | Select-Object Name, Identifier, Enabled, IssuanceAuthorizationRules | Select-Object -First 20
        ClaimsProviders = Get-AdfsClaimsProviderTrust -ErrorAction SilentlyContinue | Select-Object Name, Identifier, Enabled
        Certificates = Get-AdfsCertificate -ErrorAction SilentlyContinue | Select-Object CertificateType, Thumbprint, StoreLocation
        Endpoints = Get-AdfsEndpoint -ErrorAction SilentlyContinue | Where-Object Enabled | Select-Object FullUrl, Protocol, SecurityMode | Select-Object -First 15
        Warnings = @()
    }
    if (-not $report.Service -or $report.Service.Status -ne "Running") { $report.Warnings += "AD FS service is not running or not installed" }
    $report.Certificates | Where-Object { $_.CertificateType -match "Token" } | ForEach-Object { }
    $report.Summary = [PSCustomObject]@{ ServiceRunning = ($report.Service.Status -eq "Running"); RelyingPartyCount = ($report.RelyingParties | Measure-Object).Count; EndpointCount = ($report.Endpoints | Measure-Object).Count }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [AD FS Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.RelyingParties) { $report.RelyingParties | Format-Table Name, Enabled -AutoSize }
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function Get-ADFSAudit

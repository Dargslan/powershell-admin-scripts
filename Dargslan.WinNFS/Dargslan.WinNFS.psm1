function Get-NFSAudit {
    <#
    .SYNOPSIS
        Audit NFS server shares and client configuration
    .DESCRIPTION
        Windows NFS server/client audit toolkit — NFS shares, client mounts, identity mapping, authentication, and permissions
        Part of the Dargslan Windows Admin Toolkit — https://dargslan.com
    .PARAMETER Json
        Output results as JSON
    .EXAMPLE
        Get-NFSAudit
    .EXAMPLE
        Get-NFSAudit -Json
    .LINK
        https://dargslan.com
    .LINK
        https://www.powershellgallery.com/profiles/Dargslan
    #>
    [CmdletBinding()]
    param([switch]$Json)

    $report = [ordered]@{
        ServerFeature = Get-WindowsFeature FS-NFS-Service -ErrorAction SilentlyContinue | Select-Object Name, Installed
        ClientFeature = Get-WindowsFeature NFS-Client -ErrorAction SilentlyContinue | Select-Object Name, Installed
        NFSShares = Get-NfsShare -ErrorAction SilentlyContinue | Select-Object Name, Path, Authentication, AnonymousAccess, EnableUnmappedAccess
        NFSPermissions = Get-NfsShare -ErrorAction SilentlyContinue | ForEach-Object { $share = $_; Get-NfsSharePermission -Name $share.Name -ErrorAction SilentlyContinue | Select-Object @{N="Share";E={$share.Name}}, ClientName, Permission, LanguageEncoding }
        NFSMounts = Get-SmbMapping -ErrorAction SilentlyContinue | Where-Object { $_.RemotePath -match ":" } | Select-Object LocalPath, RemotePath, Status
        NFSSetting = Get-NfsServerConfiguration -ErrorAction SilentlyContinue | Select-Object GracePeriodSec, NlmGracePeriodSec, CharacterTranslationFile
        Warnings = @()
    }
    if ($report.ServerFeature.Installed -ne $true -and $report.ClientFeature.Installed -ne $true) { $report.Warnings += "Neither NFS Server nor Client feature is installed" }
    $report.Summary = [PSCustomObject]@{ ServerInstalled = ($report.ServerFeature.Installed -eq $true); ClientInstalled = ($report.ClientFeature.Installed -eq $true); ShareCount = ($report.NFSShares | Measure-Object).Count }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [NFS Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.NFSShares) { $report.NFSShares | Format-Table Name, Path, Authentication -AutoSize }
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function Get-NFSAudit

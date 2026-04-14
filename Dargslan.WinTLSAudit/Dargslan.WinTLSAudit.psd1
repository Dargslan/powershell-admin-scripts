@{
    RootModule = 'Dargslan.WinTLSAudit.psm1'
    ModuleVersion = '2.0.0'
    GUID = 'bafeb5f0-aacf-4205-af4d-b44cbe1934d3'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Dargslan.WinTLSAudit — Windows TLS/SSL protocol audit toolkit — cipher suite analysis, protocol version checking, Schannel configuration, and HTTPS endpoint testing (2026 Edition)'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-TLSAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'tls', 'ssl', 'cipher', 'schannel', 'https', 'security', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

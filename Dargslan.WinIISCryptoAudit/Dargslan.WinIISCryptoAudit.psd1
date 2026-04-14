@{
    RootModule = 'Dargslan.WinIISCryptoAudit.psm1'
    ModuleVersion = '2.0.0'
    GUID = '4ad4ec9b-0896-4c08-b0c2-0a80773b40c1'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'IIS Crypto and cipher suite management toolkit — cipher order analysis, protocol compliance, key exchange algorithms, and best practice recommendations'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-IISCryptoAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('iis-crypto', 'cipher', 'protocol', 'compliance', 'schannel', 'best-practice', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

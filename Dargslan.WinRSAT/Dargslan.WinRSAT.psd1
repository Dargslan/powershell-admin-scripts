@{
    RootModule = 'Dargslan.WinRSAT.psm1'
    ModuleVersion = '2.0.0'
    GUID = 'bcfcf60c-3dc6-48fe-ba3b-e6b71c1d5e6b'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Remote Server Administration Tools audit toolkit — installed RSAT features, available tools, and management console inventory'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-RSATAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('rsat', 'remote-admin', 'management', 'tools', 'mmc', 'console', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

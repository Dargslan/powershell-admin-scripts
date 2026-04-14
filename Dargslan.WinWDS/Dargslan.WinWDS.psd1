@{
    RootModule = 'Dargslan.WinWDS.psm1'
    ModuleVersion = '1.0.0'
    GUID = '024f2219-80c2-49d5-9ce5-ff7cd5b0e361'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows Deployment Services audit toolkit — WDS server config, boot images, install images, multicast, PXE settings, and driver groups'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-WDSAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('wds', 'deployment', 'pxe', 'images', 'multicast', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://opensource.org/licenses/MIT'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/favicon.ico'
            ReleaseNotes = 'Dargslan.WinWDS 1.0.0 — 2026 Edition. Part of the Dargslan Windows Admin Toolkit (140 modules). Visit https://dargslan.com for more.'
        }
    }
}
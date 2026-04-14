@{
    RootModule = 'Dargslan.WinADFS.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'bb9bbbbd-95bc-458e-961b-f0426f0a8689'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows AD FS audit toolkit — federation service, relying parties, claims providers, certificates, endpoints, and token config'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-ADFSAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('adfs', 'federation', 'sso', 'claims', 'relying-party', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://opensource.org/licenses/MIT'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/favicon.ico'
            ReleaseNotes = 'Dargslan.WinADFS 1.0.0 — 2026 Edition. Part of the Dargslan Windows Admin Toolkit (140 modules). Visit https://dargslan.com for more.'
        }
    }
}
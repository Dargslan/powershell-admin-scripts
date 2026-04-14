@{
    RootModule = 'Dargslan.WinNFS.psm1'
    ModuleVersion = '1.0.0'
    GUID = '0eb1d199-0bc4-4dde-ac69-83b4f35c7d5e'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows NFS server/client audit toolkit — NFS shares, client mounts, identity mapping, authentication, and permissions'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-NFSAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('nfs', 'shares', 'client', 'identity-mapping', 'unix', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://opensource.org/licenses/MIT'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/favicon.ico'
            ReleaseNotes = 'Dargslan.WinNFS 1.0.0 — 2026 Edition. Part of the Dargslan Windows Admin Toolkit (140 modules). Visit https://dargslan.com for more.'
        }
    }
}
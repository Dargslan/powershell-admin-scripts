@{
    RootModule = 'Dargslan.WinStorageSpaces.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'cbfdecdb-e58c-45ad-ab56-7ce674c4193b'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows Storage Spaces audit toolkit — pools, virtual disks, physical disks, tiers, resiliency, and health monitoring'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-StorageSpacesAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('storage-spaces', 'pools', 'virtual-disks', 'resiliency', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://opensource.org/licenses/MIT'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/favicon.ico'
            ReleaseNotes = 'Dargslan.WinStorageSpaces 1.0.0 — 2026 Edition. Part of the Dargslan Windows Admin Toolkit (140 modules). Visit https://dargslan.com for more.'
        }
    }
}
@{
    RootModule = 'Dargslan.WinFSRM.psm1'
    ModuleVersion = '1.0.0'
    GUID = '3ba06e6f-a48a-436b-a37b-13181d1e6c50'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows File Server Resource Manager audit toolkit — quotas, file screens, classification rules, storage reports'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-FSRMAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('fsrm', 'quotas', 'file-screens', 'storage', 'resource-manager', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://opensource.org/licenses/MIT'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/favicon.ico'
            ReleaseNotes = 'Dargslan.WinFSRM 1.0.0 — 2026 Edition. Part of the Dargslan Windows Admin Toolkit (140 modules). Visit https://dargslan.com for more.'
        }
    }
}
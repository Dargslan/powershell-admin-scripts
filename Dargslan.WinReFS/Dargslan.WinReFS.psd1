@{
    RootModule = 'Dargslan.WinReFS.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'ac8104d9-76b2-4da1-a858-5acbaab7ea64'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows Resilient File System audit toolkit — ReFS volumes, integrity streams, block cloning, allocations, and health'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-ReFSAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('refs', 'filesystem', 'integrity', 'resilient', 'storage', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://opensource.org/licenses/MIT'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/favicon.ico'
            ReleaseNotes = 'Dargslan.WinReFS 1.0.0 — 2026 Edition. Part of the Dargslan Windows Admin Toolkit (140 modules). Visit https://dargslan.com for more.'
        }
    }
}
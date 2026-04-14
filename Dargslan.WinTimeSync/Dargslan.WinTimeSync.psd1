@{
    RootModule = 'Dargslan.WinTimeSync.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'c748d569-3f1c-4919-b812-a7ca087c5d05'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows time synchronization audit toolkit — NTP configuration, W32Time service, stratum, time drift, and sync peers'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-TimeSyncAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('ntp', 'time', 'w32time', 'synchronization', 'stratum', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://opensource.org/licenses/MIT'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/favicon.ico'
            ReleaseNotes = 'Dargslan.WinTimeSync 1.0.0 — 2026 Edition. Part of the Dargslan Windows Admin Toolkit (140 modules). Visit https://dargslan.com for more.'
        }
    }
}
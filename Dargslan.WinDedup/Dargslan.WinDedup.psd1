@{
    RootModule = 'Dargslan.WinDedup.psm1'
    ModuleVersion = '1.0.0'
    GUID = '7bc245f1-84db-40c3-b7e5-3f584737bb19'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows Data Deduplication audit toolkit — volumes, savings ratios, jobs, schedules, and dedup optimization status'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-DedupAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('dedup', 'deduplication', 'storage', 'optimization', 'savings', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://opensource.org/licenses/MIT'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/favicon.ico'
            ReleaseNotes = 'Dargslan.WinDedup 1.0.0 — 2026 Edition. Part of the Dargslan Windows Admin Toolkit (140 modules). Visit https://dargslan.com for more.'
        }
    }
}
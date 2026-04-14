@{
    RootModule = 'Dargslan.WinDFSR.psm1'
    ModuleVersion = '1.0.0'
    GUID = '7108c50a-a175-4b95-b214-b3a229763e6c'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows DFS Replication audit toolkit — replication groups, folders, connections, backlog, health, and throttling'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-DFSRAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('dfsr', 'dfs-replication', 'folders', 'backlog', 'health', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://opensource.org/licenses/MIT'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/favicon.ico'
            ReleaseNotes = 'Dargslan.WinDFSR 1.0.0 — 2026 Edition. Part of the Dargslan Windows Admin Toolkit (140 modules). Visit https://dargslan.com for more.'
        }
    }
}
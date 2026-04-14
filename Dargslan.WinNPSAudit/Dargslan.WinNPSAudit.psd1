@{
    RootModule = 'Dargslan.WinNPSAudit.psm1'
    ModuleVersion = '1.0.0'
    GUID = '7355d767-4bb0-4d25-9cd0-20f82d70b77a'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows Network Policy Server audit toolkit — RADIUS policies, connection request policies, NAS clients, and accounting'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-NPSAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('nps', 'radius', 'network-policy', 'authentication', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://opensource.org/licenses/MIT'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/favicon.ico'
            ReleaseNotes = 'Dargslan.WinNPSAudit 1.0.0 — 2026 Edition. Part of the Dargslan Windows Admin Toolkit (140 modules). Visit https://dargslan.com for more.'
        }
    }
}
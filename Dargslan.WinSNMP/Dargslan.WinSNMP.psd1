@{
    RootModule = 'Dargslan.WinSNMP.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'bc018d2d-1d1c-4a0a-826b-486e87f0e04a'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows SNMP service audit toolkit — SNMP communities, trap destinations, permitted managers, agent configuration, and security'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-SNMPAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('snmp', 'monitoring', 'communities', 'traps', 'agents', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://opensource.org/licenses/MIT'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/favicon.ico'
            ReleaseNotes = 'Dargslan.WinSNMP 1.0.0 — 2026 Edition. Part of the Dargslan Windows Admin Toolkit (140 modules). Visit https://dargslan.com for more.'
        }
    }
}
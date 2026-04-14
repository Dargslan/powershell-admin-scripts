@{
    RootModule = 'Dargslan.WinSCCM.psm1'
    ModuleVersion = '1.0.0'
    GUID = '7adb8449-17a6-48eb-aa66-88a489657608'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows SCCM/MECM client audit toolkit — client health, cache, policy, boundaries, distribution points, software updates compliance'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-SCCMAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('sccm', 'mecm', 'configmgr', 'client-health', 'software-updates', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://opensource.org/licenses/MIT'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/favicon.ico'
            ReleaseNotes = 'Dargslan.WinSCCM 1.0.0 — 2026 Edition. Part of the Dargslan Windows Admin Toolkit (140 modules). Visit https://dargslan.com for more.'
        }
    }
}
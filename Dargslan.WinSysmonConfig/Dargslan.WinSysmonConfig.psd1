@{
    RootModule = 'Dargslan.WinSysmonConfig.psm1'
    ModuleVersion = '2.0.0'
    GUID = '7d539c8d-19d5-47a2-806e-4d6b615a2867'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Sysmon configuration audit toolkit — installed version, config hash, rule counts, event ID coverage, and detection gap analysis'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-SysmonAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('sysmon', 'monitoring', 'detection', 'events', 'config', 'security', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

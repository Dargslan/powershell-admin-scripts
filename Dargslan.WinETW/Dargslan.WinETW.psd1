@{
    RootModule = 'Dargslan.WinETW.psm1'
    ModuleVersion = '2.0.0'
    GUID = '46d4d332-d696-42a0-884f-0009fb89fd22'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows ETW (Event Tracing) audit toolkit — active trace sessions, providers, consumer processes, and ETW tampering detection'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-ETWAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('etw', 'tracing', 'events', 'providers', 'sessions', 'monitoring', 'security', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

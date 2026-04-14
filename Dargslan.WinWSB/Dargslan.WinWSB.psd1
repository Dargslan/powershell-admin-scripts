@{
    RootModule = 'Dargslan.WinWSB.psm1'
    ModuleVersion = '2.0.0'
    GUID = '4ab21155-ec5b-4707-a377-f44a0449e6b9'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows Server Backup audit toolkit — backup schedule, backup history, backup destinations, and recovery catalog status'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-WSBAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('wsb', 'backup', 'schedule', 'history', 'recovery', 'server-backup', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

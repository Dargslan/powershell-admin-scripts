@{
    RootModule = 'Dargslan.JournalExport.psm1'
    ModuleVersion = '1.0.0'
    GUID = '18e22842-02ca-4c2d-82d5-a5b7f6cefdd0'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Export Windows Event Log entries to various formats — Part of the Dargslan Windows Admin Tools collection. More at https://dargslan.com'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('*')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('journald', 'journal', 'export', 'log', 'systemd', 'syslog', 'windows', 'sysadmin', 'dargslan', 'devops', 'administration')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Admin Tools suite. Visit https://dargslan.com for documentation, free cheat sheets, and Linux/DevOps eBooks.'
        }
    }
}

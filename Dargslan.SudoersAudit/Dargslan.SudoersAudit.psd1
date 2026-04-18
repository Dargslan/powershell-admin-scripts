@{
    RootModule = 'Dargslan.SudoersAudit.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'c2ad6047-aa18-4fdd-83ac-f9349ffd32e7'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Audit local administrator group membership and privileges — Part of the Dargslan Windows Admin Tools collection. More at https://dargslan.com'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('*')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('linux', 'sudoers,sudo,security,audit,sysadmin', 'windows', 'sysadmin', 'dargslan', 'devops', 'administration')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Admin Tools suite. Visit https://dargslan.com for documentation, free cheat sheets, and Linux/DevOps eBooks.'
        }
    }
}

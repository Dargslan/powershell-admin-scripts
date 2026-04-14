@{
    RootModule = 'Dargslan.PasswdAudit.psm1'
    ModuleVersion = '1.0.0'
    GUID = '3073717b-b13d-4dd4-9c8e-799a72b0ea8e'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Audit local user password policies and expiration — Part of the Dargslan Windows Admin Tools collection. More at https://dargslan.com'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('*')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('password', 'shadow', 'passwd', 'security', 'audit', 'policy', 'windows', 'sysadmin', 'dargslan', 'devops', 'administration')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Admin Tools suite. Visit https://dargslan.com for documentation, free cheat sheets, and Linux/DevOps eBooks.'
        }
    }
}

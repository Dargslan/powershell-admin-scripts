@{
    RootModule = 'Dargslan.WinWindowsFeatures.psm1'
    ModuleVersion = '2.0.0'
    GUID = '81c3cbb5-ccac-47a8-b4b2-4c024063360a'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows Features and Roles audit toolkit — installed features, available features, role services, and feature dependency analysis'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-WindowsFeaturesAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows-features', 'roles', 'server-manager', 'optional-features', 'capabilities', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

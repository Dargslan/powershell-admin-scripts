@{
    RootModule = 'Dargslan.WinNodeJSAudit.psm1'
    ModuleVersion = '2.0.0'
    GUID = '2b2b6fc2-09e3-4fbb-af77-dfed6b27fa4a'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Node.js and npm audit toolkit — version detection, global packages, npm configuration, vulnerability scanning, and nvm management'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-NodeJSAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('nodejs', 'npm', 'nvm', 'packages', 'audit', 'vulnerability', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

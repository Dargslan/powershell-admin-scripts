@{
    RootModule = 'Dargslan.WinAppLocker.psm1'
    ModuleVersion = '2.0.0'
    GUID = 'fdd570be-ffff-433b-9aa0-3d5f1ccaaa0c'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Dargslan.WinAppLocker — Windows AppLocker policy audit toolkit — rule inventory, policy effectiveness testing, event log analysis, and compliance reporting (2026 Edition)'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-AppLockerAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'applocker', 'application-control', 'security', 'policy', 'whitelisting', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

@{
    RootModule = 'Dargslan.WinVSSAdmin.psm1'
    ModuleVersion = '2.0.0'
    GUID = '13396de5-fd0d-4763-866a-6f7de8895dc0'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Volume Shadow Copy Service administration toolkit — VSS writers audit, provider inventory, shadow storage analysis, and writer failure detection'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-VSSAdminReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('vss', 'shadow-copy', 'backup', 'writers', 'providers', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

@{
    RootModule = 'Dargslan.WinLocaleAudit.psm1'
    ModuleVersion = '2.0.0'
    GUID = '14b851f3-237b-4c87-9c32-a7b0a5872e02'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows locale and language configuration audit toolkit — system locale, input methods, timezone, regional settings, and Unicode compliance'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-LocaleAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('locale', 'language', 'timezone', 'regional', 'unicode', 'input', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

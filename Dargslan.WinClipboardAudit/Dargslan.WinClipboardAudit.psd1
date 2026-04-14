@{
    RootModule = 'Dargslan.WinClipboardAudit.psm1'
    ModuleVersion = '2.0.0'
    GUID = '350c29ad-10c3-45b5-9d7c-11b1cef9bd17'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows clipboard and data transfer security toolkit — clipboard history, cloud clipboard, cross-device sync, and data leakage prevention'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-ClipboardAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('clipboard', 'data-transfer', 'cloud-clipboard', 'dlp', 'privacy', 'security', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

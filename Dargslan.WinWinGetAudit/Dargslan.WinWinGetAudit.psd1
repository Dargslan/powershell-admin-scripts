@{
    RootModule = 'Dargslan.WinWinGetAudit.psm1'
    ModuleVersion = '2.0.0'
    GUID = '17c3f7a6-2f1d-4a99-bd86-abe3476cd49d'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows Package Manager (winget) audit toolkit — installed apps, available updates, source configuration, and settings analysis'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-WinGetAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('winget', 'package-manager', 'apps', 'updates', 'msstore', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

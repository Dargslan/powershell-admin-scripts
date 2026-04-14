@{
    RootModule = 'Dargslan.WinChocolateyAudit.psm1'
    ModuleVersion = '2.0.0'
    GUID = '5f225829-ef80-462c-a81d-e69917d6be43'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Chocolatey package manager audit toolkit — installed packages, outdated detection, source configuration, and feature status'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-ChocolateyAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('chocolatey', 'choco', 'packages', 'audit', 'package-manager', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

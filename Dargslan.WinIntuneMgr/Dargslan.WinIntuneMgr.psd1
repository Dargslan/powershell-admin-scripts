@{
    RootModule = 'Dargslan.WinIntuneMgr.psm1'
    ModuleVersion = '2.0.0'
    GUID = '26443359-2e9b-49f4-bbd8-318eab685bd1'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Dargslan.WinIntuneMgr — Microsoft Intune enrollment and compliance toolkit — MDM status, enrollment verification, compliance policies, and device management state (2026 Edition)'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-IntuneStatus')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'intune', 'mdm', 'enrollment', 'compliance', 'endpoint-manager', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

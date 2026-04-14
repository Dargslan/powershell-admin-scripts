@{
    RootModule = 'Dargslan.WinWSUSMgr.psm1'
    ModuleVersion = '1.0.0'
    GUID = '5f8e925b-2d55-4adc-baa1-7713df6c5973'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'WSUS server management toolkit — update compliance, client reporting, sync status, cleanup operations, and approval management'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-WSUSReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'wsus', 'update', 'patch-management', 'compliance', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

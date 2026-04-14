@{
    RootModule = 'Dargslan.WinUpdateMgr.psm1'
    ModuleVersion = '1.0.0'
    GUID = '23be1637-daa8-45de-a423-12554edfb42f'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Windows Update management toolkit — update status, pending patches, hotfix history, WSUS configuration, and update compliance reporting'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-UpdateStatus')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'windows-update', 'patch-management', 'wsus', 'hotfix', 'compliance', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

@{
    RootModule = 'Dargslan.WinStorageMgr.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'ffc3d428-a812-4dc4-bfca-b41c0a2e2c46'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Windows Storage Spaces and pool management toolkit — storage pool monitoring, virtual disk health, tiering status, and capacity planning'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-StorageReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'storage-spaces', 'storage-pool', 'virtual-disk', 'tiering', 'capacity', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

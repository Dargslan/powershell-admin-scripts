@{
    RootModule = 'Dargslan.InodeMonitor.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'c49d49dd-2208-4b70-b09f-5653c63c4fe5'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Monitor NTFS MFT and file system metadata health — Part of the Dargslan Windows Admin Tools collection. More at https://dargslan.com'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('*')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('linux', 'inode,filesystem,monitor,sysadmin,disk', 'windows', 'sysadmin', 'dargslan', 'devops', 'administration')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Admin Tools suite. Visit https://dargslan.com for documentation, free cheat sheets, and Linux/DevOps eBooks.'
        }
    }
}

@{
    RootModule = 'Dargslan.WinDiskMgr.psm1'
    ModuleVersion = '1.0.0'
    GUID = '7b6f879d-b7b8-4cf8-bd6d-3412847d6a76'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Windows disk management toolkit — disk health, SMART monitoring, space analysis, cleanup automation, and partition management'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-DiskReport', 'Invoke-DiskCleanup')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'disk', 'storage', 'smart', 'cleanup', 'health', 'monitoring', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

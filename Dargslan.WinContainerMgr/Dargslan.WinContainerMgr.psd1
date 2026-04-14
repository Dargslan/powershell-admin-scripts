@{
    RootModule = 'Dargslan.WinContainerMgr.psm1'
    ModuleVersion = '2.0.0'
    GUID = 'ea0b7689-2093-4054-bfdf-8e0e2b2a03c0'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Dargslan.WinContainerMgr — Windows container and Docker Desktop management toolkit — container inventory, image audit, network inspection, volume management, and resource monitoring (2026 Edition)'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-ContainerReport', 'Invoke-ContainerCleanup')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'docker', 'containers', 'devops', 'images', 'volumes', 'kubernetes', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

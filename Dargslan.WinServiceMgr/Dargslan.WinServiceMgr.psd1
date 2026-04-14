@{
    RootModule = 'Dargslan.WinServiceMgr.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'ef5f734d-6c87-410f-bcb5-64f9c04776a5'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Windows service management toolkit — service health monitoring, failed service detection, startup analysis, dependency mapping, and restart automation'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-ServiceHealth', 'Restart-FailedServices')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'services', 'monitoring', 'startup', 'dependencies', 'automation', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

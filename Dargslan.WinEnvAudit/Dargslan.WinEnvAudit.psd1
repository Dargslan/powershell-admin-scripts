@{
    RootModule = 'Dargslan.WinEnvAudit.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'ee547658-3d7a-4fff-aebb-9709da680e6f'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Windows environment variable audit toolkit — system/user variable inventory, PATH analysis, duplicate detection, and security review'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-EnvAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'environment', 'variables', 'path', 'security', 'audit', 'configuration', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

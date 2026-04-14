@{
    RootModule = 'Dargslan.WinGitAudit.psm1'
    ModuleVersion = '2.0.0'
    GUID = '392048a7-f649-4b99-9a86-7701c13292b8'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Git installation and configuration audit toolkit — version, global config, SSH keys, credential helpers, hooks, and repository discovery'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-GitAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('git', 'version-control', 'ssh-keys', 'config', 'hooks', 'credential', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

@{
    RootModule = 'Dargslan.WinGPOAudit.psm1'
    ModuleVersion = '1.0.0'
    GUID = '80cc3236-0d1a-4be2-ad56-ac8d050b0e69'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Windows Group Policy audit toolkit — applied GPO listing, policy result analysis, security policy verification, and GPO export'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-GPOStatus')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'group-policy', 'gpo', 'audit', 'security', 'active-directory', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

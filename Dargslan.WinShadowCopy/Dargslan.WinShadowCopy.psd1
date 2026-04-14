@{
    RootModule = 'Dargslan.WinShadowCopy.psm1'
    ModuleVersion = '1.0.0'
    GUID = '0a975727-4ad3-4c3b-a4c6-fd4bd6d40471'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Windows Volume Shadow Copy (VSS) management toolkit — shadow copy inventory, storage analysis, schedule verification, and restore point tracking'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-ShadowCopyReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'vss', 'shadow-copy', 'backup', 'restore-point', 'snapshot', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

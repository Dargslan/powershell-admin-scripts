@{
    RootModule = 'Dargslan.KernelModule.psm1'
    ModuleVersion = '1.0.0'
    GUID = '542bf89b-4698-4c4b-a3bf-e5b5c9a89432'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'List loaded drivers and kernel modules on Windows — Part of the Dargslan Windows Admin Tools collection. More at https://dargslan.com'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('*')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('linux', 'kernel,module,lsmod,driver,sysadmin', 'windows', 'sysadmin', 'dargslan', 'devops', 'administration')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Admin Tools suite. Visit https://dargslan.com for documentation, free cheat sheets, and Linux/DevOps eBooks.'
        }
    }
}

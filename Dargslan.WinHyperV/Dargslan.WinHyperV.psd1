@{
    RootModule = 'Dargslan.WinHyperV.psm1'
    ModuleVersion = '1.0.0'
    GUID = '793c9174-06b4-476a-9398-709f9845937f'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Hyper-V management toolkit — VM inventory, resource monitoring, checkpoint management, network switch audit, and VM health reporting'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-HyperVReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'hyper-v', 'virtualization', 'vm', 'checkpoint', 'virtual-switch', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

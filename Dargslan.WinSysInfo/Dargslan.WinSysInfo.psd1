@{
    RootModule = 'Dargslan.WinSysInfo.psm1'
    ModuleVersion = '1.0.0'
    GUID = '968585e1-f418-4d16-8e2a-12de0df897c9'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Comprehensive Windows system information collector — OS details, hardware inventory, CPU, memory, disk, network, GPU, and BIOS data with export capabilities'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-WinSystemReport', 'Get-WinHardwareInventory')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'system-info', 'hardware', 'inventory', 'cpu', 'memory', 'disk', 'network', 'gpu', 'bios', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

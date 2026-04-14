@{
    RootModule = 'Dargslan.WinWMIQuery.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'ef1484d7-e3cc-4e50-ae75-1878831e302d'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Windows WMI query toolkit — hardware enumeration, software inventory, system configuration queries, and WMI class explorer'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-WMIInventory')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'wmi', 'cim', 'inventory', 'hardware', 'software', 'query', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

@{
    RootModule = 'Dargslan.WinDriverMgr.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'a1be1044-7fbe-4c75-9f65-09eb6c641d02'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Windows driver management toolkit — driver inventory, outdated driver detection, unsigned driver audit, and driver backup'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-DriverAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'drivers', 'devices', 'hardware', 'signed', 'inventory', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

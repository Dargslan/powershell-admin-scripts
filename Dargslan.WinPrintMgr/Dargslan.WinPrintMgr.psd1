@{
    RootModule = 'Dargslan.WinPrintMgr.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'f449d8b8-899f-4526-b9a2-2de60be176b1'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Windows print management toolkit — printer inventory, print queue monitoring, driver audit, spooler health, and print job tracking'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-PrinterAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'printing', 'printers', 'print-queue', 'spooler', 'drivers', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

@{
    RootModule = 'Dargslan.WinSMARTHealth.psm1'
    ModuleVersion = '2.0.0'
    GUID = 'e0e81727-b834-4ce5-907c-797d2fe0a324'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Disk SMART health monitoring toolkit — drive health prediction, temperature monitoring, reallocated sectors, power-on hours, and failure risk assessment'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-SMARTHealth')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('smart', 'disk', 'health', 'ssd', 'hdd', 'temperature', 'prediction', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

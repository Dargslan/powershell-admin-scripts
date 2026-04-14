@{
    RootModule = 'Dargslan.WinPowerCfg.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'd7ce7cc5-13af-4f17-bdf9-70bcdb2778e6'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Windows power configuration toolkit — power plan management, sleep/hibernate settings, battery health, and energy efficiency analysis'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-PowerReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'power', 'energy', 'battery', 'sleep', 'hibernate', 'performance', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

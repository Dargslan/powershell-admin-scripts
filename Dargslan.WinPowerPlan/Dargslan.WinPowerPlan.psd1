@{
    RootModule = 'Dargslan.WinPowerPlan.psm1'
    ModuleVersion = '2.0.0'
    GUID = 'aff5d784-6e65-4fff-a35b-1c2aa39789c7'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows power plan optimization toolkit — active plan analysis, custom plan detection, battery health, thermal monitoring, and energy efficiency scoring'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-PowerPlanAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('power-plan', 'energy', 'battery', 'thermal', 'optimization', 'efficiency', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

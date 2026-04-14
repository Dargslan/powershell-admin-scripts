@{
    RootModule = 'Dargslan.WinBootAnalyzer.psm1'
    ModuleVersion = '1.0.0'
    GUID = '4770c228-58cf-41be-ba92-ccf75f1a5117'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Windows boot performance analyzer — boot time measurement, startup impact analysis, boot event review, and optimization recommendations'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-BootAnalysis')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'boot', 'startup', 'performance', 'optimization', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

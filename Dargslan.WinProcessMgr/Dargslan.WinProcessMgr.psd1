@{
    RootModule = 'Dargslan.WinProcessMgr.psm1'
    ModuleVersion = '1.0.0'
    GUID = '2cb25f7e-2fb6-4790-9cda-710e4876bf3d'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Windows process management toolkit — process monitoring, resource analysis, hung process detection, and process tree visualization'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-ProcessAnalysis')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'process', 'monitoring', 'resource', 'management', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

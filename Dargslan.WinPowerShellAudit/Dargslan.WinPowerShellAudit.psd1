@{
    RootModule = 'Dargslan.WinPowerShellAudit.psm1'
    ModuleVersion = '2.0.0'
    GUID = 'cecaf073-f31d-4608-abc7-65f1d9456abb'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Dargslan.WinPowerShellAudit — PowerShell security audit toolkit — execution policy, script block logging, module integrity, constrained language mode, and JEA configuration (2026 Edition)'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-PowerShellAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'powershell', 'execution-policy', 'logging', 'security', 'jea', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

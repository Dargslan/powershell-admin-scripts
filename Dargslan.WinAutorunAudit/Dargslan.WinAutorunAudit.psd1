@{
    RootModule = 'Dargslan.WinAutorunAudit.psm1'
    ModuleVersion = '2.0.0'
    GUID = '84ae2e51-4eea-4164-a22c-7b62b5b4a3d4'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows autorun/startup audit toolkit — startup programs, Run keys, scheduled tasks at boot, shell extensions, and persistence mechanisms'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-AutorunAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('autorun', 'startup', 'persistence', 'run-key', 'shell', 'boot', 'security', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

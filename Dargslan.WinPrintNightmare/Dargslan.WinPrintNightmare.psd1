@{
    RootModule = 'Dargslan.WinPrintNightmare.psm1'
    ModuleVersion = '2.0.0'
    GUID = 'e5f73e89-4d4b-4ea6-8a1c-4c3f30b41008'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows Print Spooler security audit toolkit — PrintNightmare mitigations, spooler service, Point and Print restrictions, driver isolation'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-PrintSpoolerSecurity')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('print-spooler', 'printnightmare', 'security', 'mitigation', 'driver', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

@{
    RootModule = 'Dargslan.WinThreatHunt.psm1'
    ModuleVersion = '2.0.0'
    GUID = '9c01c4f5-a363-40ea-806e-7e947aa4d776'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows threat hunting toolkit — suspicious processes, network connections, unsigned DLLs, anomalous services, and IOC detection'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-ThreatHuntScan')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('threat-hunting', 'ioc', 'suspicious', 'processes', 'detection', 'forensics', 'security', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

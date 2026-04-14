@{
    RootModule = 'Dargslan.WinIISMgr.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'c5f0a691-fcb9-4f31-8bfa-aa122163b46b'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'IIS web server management toolkit — site inventory, application pool monitoring, SSL binding audit, log analysis, and health checks'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-IISReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'iis', 'web-server', 'application-pool', 'ssl', 'website', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

@{
    RootModule = 'Dargslan.WinDNSClient.psm1'
    ModuleVersion = '1.0.0'
    GUID = '6bcd3332-f096-4f13-be47-4feb68cc1e20'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Windows DNS client diagnostics toolkit — DNS configuration, resolution testing, cache analysis, NRPT rules, and DNS performance monitoring'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-DNSReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'dns', 'networking', 'diagnostics', 'resolution', 'cache', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

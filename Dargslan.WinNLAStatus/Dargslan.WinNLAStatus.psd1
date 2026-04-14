@{
    RootModule = 'Dargslan.WinNLAStatus.psm1'
    ModuleVersion = '2.0.0'
    GUID = '7405b53b-bab0-461a-94a0-8514bc34fa28'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Network Location Awareness audit toolkit — network profiles, connectivity status, firewall profile mapping, and network category management'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-NLAAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('nla', 'network-profile', 'connectivity', 'firewall', 'category', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

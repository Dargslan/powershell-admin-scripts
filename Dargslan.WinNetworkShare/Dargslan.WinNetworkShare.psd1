@{
    RootModule = 'Dargslan.WinNetworkShare.psm1'
    ModuleVersion = '2.0.0'
    GUID = '7a3f7cd9-5161-4f40-b26a-8b219532a679'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows network share enumeration and security toolkit — accessible shares, null sessions, anonymous access, and share permission audit'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-NetworkShareSecurity')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('network-shares', 'null-session', 'anonymous', 'smb', 'enumeration', 'security', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

@{
    RootModule = 'Dargslan.WinWiFiSec.psm1'
    ModuleVersion = '2.0.0'
    GUID = '850f6c9b-7edb-420c-82c2-bb80a826f27f'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows Wi-Fi security audit toolkit — saved profiles, encryption types, open networks, enterprise WPA, and wireless policy compliance'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-WiFiSecurityAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('wifi', 'wireless', 'security', 'profiles', 'encryption', 'wpa', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

@{
    RootModule = 'Dargslan.WinVPNConfig.psm1'
    ModuleVersion = '2.0.0'
    GUID = '3b502ef2-a9d1-4cd5-8982-a1bbfa5a7064'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows VPN configuration audit toolkit — VPN connections, protocols, authentication methods, split tunneling, and always-on VPN status'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-VPNAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('vpn', 'connection', 'protocol', 'split-tunnel', 'always-on', 'remote-access', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

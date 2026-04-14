@{
    RootModule = 'Dargslan.WinRemoteAccess.psm1'
    ModuleVersion = '1.0.0'
    GUID = '46b4f649-465a-4c4f-bf4a-5701f986edf9'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows Remote Access VPN audit toolkit — RRAS configuration, VPN protocols, SSTP, IKEv2, RADIUS, and connection stats'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-RemoteAccessAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('vpn', 'rras', 'remote-access', 'sstp', 'ikev2', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://opensource.org/licenses/MIT'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/favicon.ico'
            ReleaseNotes = 'Dargslan.WinRemoteAccess 1.0.0 — 2026 Edition. Part of the Dargslan Windows Admin Toolkit (140 modules). Visit https://dargslan.com for more.'
        }
    }
}
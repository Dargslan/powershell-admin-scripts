@{
    RootModule = 'Dargslan.WinIPSec.psm1'
    ModuleVersion = '2.0.0'
    GUID = '5b38e2b6-4d5d-44de-8fba-19c13311c034'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'IPsec policy and SA management toolkit — main mode SAs, quick mode SAs, IPsec rules, connection security policies, and encryption analysis'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-IPSecAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('ipsec', 'security-association', 'main-mode', 'quick-mode', 'encryption', 'vpn', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

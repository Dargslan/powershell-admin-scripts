@{
    RootModule = 'Dargslan.WinRDPSecurity.psm1'
    ModuleVersion = '1.0.0'
    GUID = '50ae2244-b386-488f-a1a4-889dffdd1269'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows Remote Desktop security audit toolkit — RDP settings, NLA enforcement, encryption level, certificate, session limits, and port'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-RDPSecurityAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('rdp', 'remote-desktop', 'nla', 'security', 'encryption', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://opensource.org/licenses/MIT'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/favicon.ico'
            ReleaseNotes = 'Dargslan.WinRDPSecurity 1.0.0 — 2026 Edition. Part of the Dargslan Windows Admin Toolkit (140 modules). Visit https://dargslan.com for more.'
        }
    }
}
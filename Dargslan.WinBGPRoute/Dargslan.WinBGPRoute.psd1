@{
    RootModule = 'Dargslan.WinBGPRoute.psm1'
    ModuleVersion = '1.0.0'
    GUID = '4b79a715-9920-45a2-b2e4-f0ebe04e4981'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows routing and BGP audit toolkit — routing table, persistent routes, RRAS status, BGP peers, and network interfaces'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-BGPRouteAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('bgp', 'routing', 'rras', 'routes', 'networking', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://opensource.org/licenses/MIT'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/favicon.ico'
            ReleaseNotes = 'Dargslan.WinBGPRoute 1.0.0 — 2026 Edition. Part of the Dargslan Windows Admin Toolkit (140 modules). Visit https://dargslan.com for more.'
        }
    }
}
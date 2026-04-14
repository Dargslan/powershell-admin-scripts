@{
    RootModule = 'Dargslan.WinDNSServer.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'd9c4474e-7382-47ac-8c5d-776b8fcc40bc'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Windows DNS Server management toolkit — zone inventory, record audit, forwarder configuration, DNS analytics, and zone health monitoring'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-DNSServerReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'dns-server', 'dns', 'zones', 'records', 'forwarders', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

@{
    RootModule = 'Dargslan.WinNetworkDiag.psm1'
    ModuleVersion = '1.0.0'
    GUID = '6dad41c5-7cbd-4437-bd84-8ddf252de78c'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Windows network diagnostics toolkit — connectivity testing, DNS analysis, port scanning, latency measurement, and network adapter monitoring'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Test-NetworkHealth', 'Test-PortScan')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'network', 'diagnostics', 'dns', 'ping', 'port-scan', 'latency', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

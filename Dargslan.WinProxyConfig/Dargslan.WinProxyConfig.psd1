@{
    RootModule = 'Dargslan.WinProxyConfig.psm1'
    ModuleVersion = '2.0.0'
    GUID = '064761da-9275-4754-bdf1-04d8ceb193f8'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows proxy and internet settings audit toolkit — system proxy, PAC files, WinHTTP proxy, IE/Edge settings, and proxy bypass lists'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-ProxyAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('proxy', 'internet', 'pac', 'winhttp', 'bypass', 'network', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

@{
    RootModule = 'Dargslan.WinBrowserSec.psm1'
    ModuleVersion = '2.0.0'
    GUID = '34dc2544-be48-4c3a-bbb0-b275c4c8cf91'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Web browser security audit toolkit — installed browsers, default browser, extension audit, auto-update status, and security policy configuration'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-BrowserSecurityAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('browser', 'security', 'chrome', 'firefox', 'edge', 'extensions', 'policy', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

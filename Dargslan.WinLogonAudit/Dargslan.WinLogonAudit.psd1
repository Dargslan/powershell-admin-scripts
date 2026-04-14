@{
    RootModule = 'Dargslan.WinLogonAudit.psm1'
    ModuleVersion = '2.0.0'
    GUID = 'c0671b17-57e3-4f3b-b020-acebe2d206a1'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows logon security audit toolkit — logon history, failed attempts, account lockouts, session tracking, and authentication method analysis'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-LogonAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('logon', 'authentication', 'lockout', 'session', 'security', 'audit', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

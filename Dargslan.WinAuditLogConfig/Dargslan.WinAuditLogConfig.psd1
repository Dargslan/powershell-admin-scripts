@{
    RootModule = 'Dargslan.WinAuditLogConfig.psm1'
    ModuleVersion = '2.0.0'
    GUID = '3f753fa4-cc4f-4d77-90a3-384f0fa6c23b'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows audit log configuration toolkit — event log sizes, retention policies, advanced audit policy, security event log health'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-AuditLogConfig')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('audit-log', 'event-log', 'retention', 'security-log', 'siem', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

@{
    RootModule = 'Dargslan.WinSMTP.psm1'
    ModuleVersion = '1.0.0'
    GUID = '288d9ddc-6479-47e9-94bc-f561f1144570'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows SMTP server audit toolkit — virtual servers, relay restrictions, authentication, queue, and delivery status'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-SMTPAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('smtp', 'email', 'relay', 'queue', 'messaging', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://opensource.org/licenses/MIT'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/favicon.ico'
            ReleaseNotes = 'Dargslan.WinSMTP 1.0.0 — 2026 Edition. Part of the Dargslan Windows Admin Toolkit (140 modules). Visit https://dargslan.com for more.'
        }
    }
}
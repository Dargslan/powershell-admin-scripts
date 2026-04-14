@{
    RootModule = 'Dargslan.WinSMTPRelay.psm1'
    ModuleVersion = '2.0.0'
    GUID = '78913ef5-18a1-4c1d-b563-93432331f561'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows SMTP relay and mail configuration audit toolkit — SMTP service status, relay settings, queue monitoring, and mail flow testing'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-SMTPRelayAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('smtp', 'relay', 'mail', 'email', 'queue', 'iis-smtp', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

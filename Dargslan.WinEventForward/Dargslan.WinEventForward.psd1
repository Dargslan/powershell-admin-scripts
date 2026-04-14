@{
    RootModule = 'Dargslan.WinEventForward.psm1'
    ModuleVersion = '2.0.0'
    GUID = 'd8d61ab8-752a-43b4-8ddd-62f55dcaa149'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows Event Forwarding (WEF) audit toolkit — subscriptions, collector status, source computers, event delivery optimization'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-EventForwardingAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('wef','event-forwarding','collector','subscriptions','siem','sysadmin','dargslan','2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

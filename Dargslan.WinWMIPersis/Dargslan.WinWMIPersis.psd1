@{
    RootModule = 'Dargslan.WinWMIPersis.psm1'
    ModuleVersion = '2.0.0'
    GUID = '46f46118-8385-445f-bb72-5bff5f669d3f'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'WMI persistence detection toolkit — event subscriptions, consumer bindings, suspicious WMI activity, and backdoor hunting'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-WMIPersistenceAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('wmi', 'persistence', 'backdoor', 'subscription', 'consumer', 'detection', 'security', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

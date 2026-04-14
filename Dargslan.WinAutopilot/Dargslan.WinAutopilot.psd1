@{
    RootModule = 'Dargslan.WinAutopilot.psm1'
    ModuleVersion = '2.0.0'
    GUID = '7f45ac02-9bcc-48f8-8f28-5c54acc38621'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Dargslan.WinAutopilot — Windows Autopilot diagnostics toolkit — hardware hash collection, deployment profile status, OOBE configuration, and provisioning log analysis (2026 Edition)'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-AutopilotInfo')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'autopilot', 'deployment', 'oobe', 'provisioning', 'hardware-hash', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

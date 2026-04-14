@{
    RootModule = 'Dargslan.WinVSCodeAudit.psm1'
    ModuleVersion = '2.0.0'
    GUID = '06829ec6-9dfa-40d7-bdf0-727e3a80e83a'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Visual Studio Code audit toolkit — extensions inventory, settings analysis, workspace trust, telemetry configuration, and resource usage'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-VSCodeAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('vscode', 'extensions', 'settings', 'workspace', 'editor', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

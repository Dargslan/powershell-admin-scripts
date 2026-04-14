@{
    RootModule = 'Dargslan.WinCredentialMgr.psm1'
    ModuleVersion = '2.0.0'
    GUID = '7a5d22ce-2a87-4c3f-bab6-f58160713b01'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows Credential Manager audit toolkit — stored credentials, Windows Vault, generic credentials, and credential age analysis'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-CredentialManagerAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('credentials', 'vault', 'password', 'stored', 'manager', 'security', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

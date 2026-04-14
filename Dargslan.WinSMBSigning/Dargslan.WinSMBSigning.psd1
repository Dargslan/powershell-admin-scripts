@{
    RootModule = 'Dargslan.WinSMBSigning.psm1'
    ModuleVersion = '2.0.0'
    GUID = '6aa24124-df8c-4d98-afc5-cf13a058faef'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows SMB signing and security audit toolkit — SMB signing status, encryption, dialect negotiation, and relay attack defense'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-SMBSigningAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('smb', 'signing', 'encryption', 'relay', 'ntlm', 'security', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

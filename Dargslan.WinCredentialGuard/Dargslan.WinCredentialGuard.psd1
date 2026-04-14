@{
    RootModule = 'Dargslan.WinCredentialGuard.psm1'
    ModuleVersion = '2.0.0'
    GUID = '906531dd-a6b1-40fa-b5c9-2c1d442c8b77'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Dargslan.WinCredentialGuard — Windows Credential Guard and virtualization-based security audit toolkit — VBS status, HVCI, Secure Boot, and credential isolation verification (2026 Edition)'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-CredentialGuardStatus')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'credential-guard', 'vbs', 'hvci', 'secure-boot', 'security', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

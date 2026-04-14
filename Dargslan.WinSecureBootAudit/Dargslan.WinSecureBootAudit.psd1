@{
    RootModule = 'Dargslan.WinSecureBootAudit.psm1'
    ModuleVersion = '2.0.0'
    GUID = 'ded0099e-e23a-4223-bd55-36ead3621fce'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Secure Boot and UEFI configuration audit toolkit — boot chain verification, DBX updates, boot policy, and firmware security assessment'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-SecureBootAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('secure-boot', 'uefi', 'firmware', 'dbx', 'boot-policy', 'security', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

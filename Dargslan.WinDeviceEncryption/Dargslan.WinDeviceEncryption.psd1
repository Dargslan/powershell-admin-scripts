@{
    RootModule = 'Dargslan.WinDeviceEncryption.psm1'
    ModuleVersion = '2.0.0'
    GUID = 'cd7b6234-601c-442f-9f31-bf31feb49ed4'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows device encryption audit toolkit — encryption status across all drives, recovery key backup, encryption method, and compliance status'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-DeviceEncryptionAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('encryption', 'device-encryption', 'recovery-key', 'compliance', 'data-protection', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

@{
    RootModule = 'Dargslan.WinBitLocker.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'af1c0f28-73ec-4678-b767-4ab15e8641f8'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'BitLocker drive encryption management toolkit — encryption status, recovery key management, TPM status, and compliance reporting'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-BitLockerReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'bitlocker', 'encryption', 'security', 'tpm', 'recovery-key', 'compliance', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

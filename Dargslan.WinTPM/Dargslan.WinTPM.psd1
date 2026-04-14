@{
    RootModule = 'Dargslan.WinTPM.psm1'
    ModuleVersion = '2.0.0'
    GUID = '470cb5ce-e318-4b59-a0dd-e76fbc8b83cd'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows TPM (Trusted Platform Module) audit toolkit — TPM version, status, health, PCR values, attestation, and key storage'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-TPMAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('tpm', 'trusted-platform', 'security', 'attestation', 'pcr', 'hardware', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

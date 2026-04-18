@{
    RootModule = 'Dargslan.WinSecureBootAudit.psm1'
    ModuleVersion = '1.0.0'
    GUID = '7a06d849-9cc8-4789-bd23-33501c506fde'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Audit Windows Secure Boot, UEFI keys (PK, KEK, db, dbx), TPM and BitLocker posture. Generates JSON / HTML compliance reports for Windows 10/11 and Server. Part of the Dargslan Windows Admin Tools collection — more at https://dargslan.com'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-DargslanSecureBootStatus','Get-DargslanSecureBootKeys','Get-DargslanTpmSecurityStatus','Get-DargslanBitLockerStatus','Get-DargslanSecureBootAuditReport','Export-DargslanSecureBootAuditReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('secure-boot','uefi','tpm','bitlocker','audit','compliance','security','windows','sysadmin','dargslan','dfir','hardening')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com/blog/windows-secure-boot-audit-powershell-2026'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Initial release. Audits Secure Boot state, UEFI key store (PK/KEK/db/dbx), TPM 2.0 readiness, BitLocker protection status. JSON + HTML report export. Visit https://dargslan.com/cheat-sheets for the matching free PDF cheat sheet.'
        }
    }
}

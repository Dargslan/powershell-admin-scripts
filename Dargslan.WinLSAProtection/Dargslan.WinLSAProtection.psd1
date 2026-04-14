@{
    RootModule = 'Dargslan.WinLSAProtection.psm1'
    ModuleVersion = '2.0.0'
    GUID = '82531556-07a4-4e88-984f-70b197ae112d'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'LSA Protection and LSASS hardening audit toolkit — RunAsPPL, credential dumping defense, memory protection, and security assessment'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-LSAProtectionStatus')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('lsa', 'lsass', 'credential-protection', 'runas-ppl', 'memory-protection', 'security', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

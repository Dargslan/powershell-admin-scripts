@{
    RootModule = 'Dargslan.WinLocalGPO.psm1'
    ModuleVersion = '2.0.0'
    GUID = '66f5e66e-5805-4343-bd74-ffa319214957'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Dargslan.WinLocalGPO — Windows Local Group Policy editor toolkit — security options audit, user rights assignment, audit policy configuration, and local policy export (2026 Edition)'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-LocalPolicyAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'local-gpo', 'security-policy', 'user-rights', 'audit-policy', 'hardening', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

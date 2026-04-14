@{
    RootModule = 'Dargslan.WinRemediation.psm1'
    ModuleVersion = '2.0.0'
    GUID = '78378319-93b7-4539-b346-36867741d894'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows security remediation toolkit — common hardening fixes, quick remediation actions, baseline enforcement, and compliance repair'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-RemediationStatus')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('remediation', 'hardening', 'fix', 'baseline', 'compliance', 'repair', 'security', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

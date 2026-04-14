@{
    RootModule = 'Dargslan.WinOSHarden.psm1'
    ModuleVersion = '2.0.0'
    GUID = '22dd6515-e90e-4872-b850-8683f73acf75'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows OS hardening assessment toolkit — CIS benchmark checks, STIG compliance, security baseline scoring, and hardening recommendations'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-HardeningAssessment')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('hardening', 'cis', 'stig', 'baseline', 'compliance', 'assessment', 'security', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

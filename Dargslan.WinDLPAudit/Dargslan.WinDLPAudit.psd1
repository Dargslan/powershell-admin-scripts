@{
    RootModule = 'Dargslan.WinDLPAudit.psm1'
    ModuleVersion = '2.0.0'
    GUID = '764f35b8-ec1a-4f34-95ca-f671906a5b78'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows Data Loss Prevention audit toolkit — DLP policies, sensitive data scanning, endpoint protection, and data classification'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-DLPAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('dlp','data-loss-prevention','classification','sensitive-data','endpoint','security','sysadmin','dargslan','2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

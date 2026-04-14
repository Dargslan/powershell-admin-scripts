@{
    RootModule = 'Dargslan.WinRansomGuard.psm1'
    ModuleVersion = '2.0.0'
    GUID = 'c4b99908-cb65-4907-b821-6f35258121cb'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows ransomware protection audit toolkit — Controlled Folder Access, protected folders, allowed apps, and ransomware defense scoring'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-RansomwareProtection')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('ransomware', 'controlled-folder', 'protection', 'defender', 'defense', 'security', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

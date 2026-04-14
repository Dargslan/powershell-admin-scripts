@{
    RootModule = 'Dargslan.WinNTFS.psm1'
    ModuleVersion = '2.0.0'
    GUID = 'c8203d73-7e88-488a-a5be-5e1392aea363'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'NTFS filesystem security audit toolkit — permission inheritance, alternate data streams, junction points, hard links, and filesystem integrity'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-NTFSAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('ntfs', 'permissions', 'ads', 'streams', 'junction', 'integrity', 'security', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

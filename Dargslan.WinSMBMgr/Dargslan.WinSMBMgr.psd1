@{
    RootModule = 'Dargslan.WinSMBMgr.psm1'
    ModuleVersion = '1.0.0'
    GUID = '34cdbce8-2721-4b46-be69-eefb1f08d3c9'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Windows SMB/CIFS share management toolkit — share inventory, session monitoring, open file tracking, and security configuration audit'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-SMBAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'smb', 'cifs', 'file-sharing', 'security', 'sessions', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

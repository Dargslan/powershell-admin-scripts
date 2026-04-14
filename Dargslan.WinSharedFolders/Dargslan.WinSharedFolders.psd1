@{
    RootModule = 'Dargslan.WinSharedFolders.psm1'
    ModuleVersion = '2.0.0'
    GUID = '6775a7a0-ff93-49d4-8302-7fcf66f54aa4'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows shared folders audit toolkit — network share inventory, permission analysis, open files, active sessions, and hidden share detection'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-SharedFolderAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('shares', 'permissions', 'open-files', 'sessions', 'hidden-shares', 'security', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

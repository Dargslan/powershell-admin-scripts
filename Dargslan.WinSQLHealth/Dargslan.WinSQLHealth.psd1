@{
    RootModule = 'Dargslan.WinSQLHealth.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'affd01b7-3152-4a0e-ab37-260f1e48f1eb'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'SQL Server health check toolkit — instance monitoring, database status, backup verification, job history, and performance metrics'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-SQLHealthReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'sql-server', 'database', 'backup', 'monitoring', 'performance', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

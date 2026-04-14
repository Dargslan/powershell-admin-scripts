@{
    RootModule = 'Dargslan.WinBackupAudit.psm1'
    ModuleVersion = '1.0.0'
    GUID = '88598d51-4848-4864-a8ec-4e495395b2e6'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Windows backup auditing toolkit — Windows Server Backup, VSS snapshot monitoring, backup job verification, and recovery point tracking'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-BackupStatus')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'backup', 'vss', 'disaster-recovery', 'audit', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

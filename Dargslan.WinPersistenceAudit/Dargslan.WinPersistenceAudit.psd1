@{
    RootModule = 'Dargslan.WinPersistenceAudit.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'f8160cf7-92aa-4b05-bf66-c07200666666'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Audit Windows persistence locations: registry Run keys, scheduled tasks and unsigned autorun binaries. JSON / HTML report.'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-DargslanRunKeys','Get-DargslanScheduledTasks','Get-DargslanUnsignedAutoruns','Get-DargslanPersistenceAuditReport','Export-DargslanPersistenceAuditReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('persistence','dfir','autorun','scheduled-tasks','run-keys','audit','windows','sysadmin','dargslan','threat-hunting')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com/blog/windows-persistence-audit-powershell-2026'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Initial release. Run keys, scheduled tasks, signed/unsigned autorun classifier, scoring and HTML / JSON export.'
        }
    }
}

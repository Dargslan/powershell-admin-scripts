@{
    RootModule = 'Dargslan.LocalAdminAudit.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'e7f5fbf6-8199-4af4-be55-bf6100555555'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Audit Windows local users and the Administrators group: members, dormant accounts, Guest state, unknown SIDs.'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-DargslanLocalAdmins','Get-DargslanLocalUsers','Get-DargslanInactiveLocalAccounts','Get-DargslanLocalAdminAuditReport','Export-DargslanLocalAdminAuditReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('local-admin','users','audit','compliance','windows','sysadmin','dargslan','hardening','laps')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com/blog/windows-local-admin-audit-powershell-2026'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Initial release. Local admin enumeration, dormant account detection, Guest state, score and HTML / JSON export.'
        }
    }
}

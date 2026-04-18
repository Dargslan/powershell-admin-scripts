@{
    RootModule = 'Dargslan.WinServiceSecurity.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'c5f3d9e4-6f77-48f2-bc33-9e4f00333333'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Audit Windows services for unquoted paths, weak ACLs and risky service accounts. JSON / HTML report.'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-DargslanServiceInventory','Get-DargslanUnquotedServicePaths','Get-DargslanRiskyServiceAccounts','Get-DargslanServiceAuditReport','Export-DargslanServiceAuditReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('services','privilege-escalation','audit','compliance','windows','sysadmin','dargslan','hardening','dfir')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com/blog/windows-service-security-audit-powershell-2026'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Initial release. Service inventory, unquoted path detection, risky account detection, scoring and HTML / JSON export.'
        }
    }
}

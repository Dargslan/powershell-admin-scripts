@{
    RootModule = 'Dargslan.WinDhcpAudit.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'b0382ef9-b4cc-4d27-b188-e29400888888'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Audit Windows DHCP scopes, failover and exhaustion. JSON / HTML report.'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-DargslanDhcpScopes','Get-DargslanDhcpFailover','Get-DargslanDhcpScopeUsage','Get-DargslanDhcpAuditReport','Export-DargslanDhcpAuditReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('dhcp','dhcp-failover','scope','audit','windows','sysadmin','dargslan','infrastructure','networking')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com/blog/windows-dhcp-audit-powershell-2026'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Initial release. Scope inventory, failover state, scope usage %, scoring and HTML / JSON export.'
        }
    }
}

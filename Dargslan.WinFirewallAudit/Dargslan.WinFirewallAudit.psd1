@{
    RootModule = 'Dargslan.WinFirewallAudit.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'a3f1c7b2-4e55-46d0-9a11-7c2e00111111'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Audit Windows Firewall profiles and rules. Detect risky Allow Any Any rules, disabled profiles and GPO overrides. JSON / HTML compliance report.'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-DargslanFirewallProfile','Get-DargslanFirewallRules','Get-DargslanFirewallRiskyRules','Get-DargslanFirewallAuditReport','Export-DargslanFirewallAuditReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('firewall','netsec','audit','compliance','windows','sysadmin','dargslan','hardening','cis')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com/blog/windows-firewall-audit-powershell-2026'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Initial release. Profile state, rule inventory, risky-rule detection, scoring and HTML / JSON report.'
        }
    }
}

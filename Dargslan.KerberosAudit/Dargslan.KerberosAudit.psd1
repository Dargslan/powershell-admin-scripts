@{
    RootModule = 'Dargslan.KerberosAudit.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'f47c732d-f81a-416b-f5cc-26d800cccccc'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Audit Kerberos posture in Active Directory: unconstrained delegation, duplicate SPNs and AS-REP roastable accounts.'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-DargslanUnconstrainedDelegation','Get-DargslanConstrainedDelegation','Get-DargslanDuplicateSpns','Get-DargslanAsRepRoastable','Get-DargslanKerberosAuditReport','Export-DargslanKerberosAuditReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('kerberos','active-directory','spn','delegation','as-rep-roasting','kerberoasting','audit','sysadmin','dargslan','dfir')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com/blog/kerberos-delegation-audit-powershell-2026'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Initial release. Unconstrained / constrained / RBCD detection, duplicate SPNs, AS-REP roastable accounts, scoring and HTML / JSON export.'
        }
    }
}

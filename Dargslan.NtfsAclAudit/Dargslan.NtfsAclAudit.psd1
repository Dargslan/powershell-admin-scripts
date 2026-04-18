@{
    RootModule = 'Dargslan.NtfsAclAudit.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'a58d843e-091b-427c-a6dd-37e900dddddd'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Audit NTFS ACLs on a directory tree: Everyone / Authenticated Users excessive rights, broken inheritance, orphaned SIDs.'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-DargslanNtfsPermissions','Get-DargslanEveryoneAcls','Get-DargslanBrokenAclInheritance','Get-DargslanOrphanSidAcls','Get-DargslanNtfsAclAuditReport','Export-DargslanNtfsAclAuditReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('ntfs','acl','permissions','file-server','audit','compliance','windows','sysadmin','dargslan','hardening')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com/blog/ntfs-acl-permission-audit-powershell-2026'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Initial release. Recursive ACL inventory, Everyone-FullControl detector, broken-inheritance detector, orphan SID detector, scoring and HTML / JSON export.'
        }
    }
}

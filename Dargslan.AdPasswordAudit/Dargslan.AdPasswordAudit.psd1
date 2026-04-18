@{
    RootModule = 'Dargslan.AdPasswordAudit.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'd6f4eaf5-7088-49f3-bd44-af5000444444'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Audit Active Directory password and lockout policy, Fine Grained Password Policy and stale / never-expire accounts. Requires the ActiveDirectory module.'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-DargslanAdPasswordPolicy','Get-DargslanAdFineGrainedPolicies','Get-DargslanAdStaleAccounts','Get-DargslanAdPasswordAuditReport','Export-DargslanAdPasswordAuditReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('active-directory','password-policy','fgpp','lockout','audit','compliance','windows','sysadmin','dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com/blog/ad-password-policy-audit-powershell-2026'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Initial release. Default + FGPP policy, stale account detection, PasswordNeverExpires accounts, scoring and HTML / JSON export.'
        }
    }
}

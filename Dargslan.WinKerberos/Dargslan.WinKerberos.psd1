@{
    RootModule = 'Dargslan.WinKerberos.psm1'
    ModuleVersion = '2.0.0'
    GUID = '1010b916-b5d2-4d43-92e9-59458d92f3c1'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Kerberos authentication audit toolkit — ticket cache, SPN inventory, delegation analysis, and Kerberos policy validation'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-KerberosAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('kerberos', 'authentication', 'spn', 'delegation', 'tickets', 'security', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

@{
    RootModule = 'Dargslan.IisSecurityAudit.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'd25a510b-d6ee-4f49-d3aa-04b600aaaaaa'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Audit IIS bindings, SChannel TLS protocols, weak ciphers and app pool identities. JSON / HTML report.'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-DargslanIisBindings','Get-DargslanIisTlsProtocols','Get-DargslanIisAppPoolIdentities','Get-DargslanIisSecurityAuditReport','Export-DargslanIisSecurityAuditReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('iis','tls','schannel','web-server','ciphers','audit','windows','sysadmin','dargslan','hardening')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com/blog/iis-tls-security-audit-powershell-2026'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Initial release. IIS bindings + cert thumbprint, SChannel protocol state, app pool identities, scoring and HTML / JSON export.'
        }
    }
}

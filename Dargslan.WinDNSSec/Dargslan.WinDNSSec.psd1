@{
    RootModule = 'Dargslan.WinDNSSec.psm1'
    ModuleVersion = '2.0.0'
    GUID = '658693c9-cb35-4c57-8afe-9edddac58cd0'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows DNS security audit toolkit — DNSSEC validation, DNS-over-HTTPS, DNS cache poisoning defense, and resolver hardening'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-DNSSecurityAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('dns', 'dnssec', 'doh', 'resolver', 'security', 'cache-poisoning', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

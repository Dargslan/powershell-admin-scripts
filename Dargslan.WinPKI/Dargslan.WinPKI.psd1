@{
    RootModule = 'Dargslan.WinPKI.psm1'
    ModuleVersion = '1.0.0'
    GUID = '593658cc-c196-48b1-87a5-befab59a8918'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows PKI and certificate authority audit toolkit — CA configuration, templates, issued certs, CRL, OCSP, and PKI health'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-PKIAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('pki', 'certificate-authority', 'ca', 'templates', 'crl', 'ocsp', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://opensource.org/licenses/MIT'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/favicon.ico'
            ReleaseNotes = 'Dargslan.WinPKI 1.0.0 — 2026 Edition. Part of the Dargslan Windows Admin Toolkit (140 modules). Visit https://dargslan.com for more.'
        }
    }
}
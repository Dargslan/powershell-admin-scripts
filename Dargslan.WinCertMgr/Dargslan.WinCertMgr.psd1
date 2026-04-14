@{
    RootModule = 'Dargslan.WinCertMgr.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'c2d8670c-7d49-4284-be15-c3e07965f242'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Windows certificate management toolkit — certificate inventory, expiry monitoring, chain validation, and certificate store auditing'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-CertificateReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'certificates', 'ssl', 'tls', 'pki', 'expiry', 'security', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

@{
    RootModule = 'Dargslan.WinDCOM.psm1'
    ModuleVersion = '2.0.0'
    GUID = 'ab1f9feb-ba85-4390-968d-279b587c1cfd'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'DCOM configuration audit toolkit — DCOM applications, launch permissions, access security, and attack surface assessment'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-DCOMAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('dcom', 'com', 'permissions', 'launch', 'security', 'rpc', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

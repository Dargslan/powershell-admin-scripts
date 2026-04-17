@{
    RootModule = 'Dargslan.RdpSign.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'a1f4c8b2-9d3e-4f7a-b1c5-2e8d6f0a3b7c'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Bulk-generate and digitally sign Remote Desktop Protocol (.rdp) connection files from a CSV and a template. Wraps rdpsign.exe with safe defaults for code-signing certificates. Part of the Dargslan Windows Admin Tools collection. More at https://dargslan.com'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-DargslanCodeSigningCert','Test-DargslanRdpSignature','New-DargslanSignedRdp','New-DargslanSignedRdpBatch')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('rdp','rdpsign','remote-desktop','rds','signing','codesign','powershell','windows','sysadmin','dargslan','automation','administration')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Initial release. Bulk RDP file generation + signing from CSV templates. Free cheat sheet at https://dargslan.com/cheat-sheets/rdpsign-bulk-signing-2026 — full guide at https://dargslan.com/blog/bulk-rdp-file-signing-rdpsign-powershell-2026'
        }
    }
}

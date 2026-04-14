@{
    RootModule = 'Dargslan.WinRegistryAudit.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'f1bba02c-1df4-4f8e-a04b-247b96fdc4b6'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Windows Registry auditing toolkit — registry key analysis, security assessment, startup entries, autorun detection, and registry backup'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-RegistryAudit', 'Export-RegistryBackup')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'registry', 'audit', 'security', 'autorun', 'startup', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

@{
    RootModule = 'Dargslan.WinFirewall.psm1'
    ModuleVersion = '1.0.0'
    GUID = '3a0be551-f06d-4d3e-81e0-890bd0209390'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Windows Firewall management and auditing toolkit — rule analysis, profile management, security assessment, logging, and rule export/import'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-FirewallAudit', 'Export-FirewallRules')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'firewall', 'security', 'network', 'rules', 'audit', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

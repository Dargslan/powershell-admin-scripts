@{
    RootModule = 'Dargslan.WinSNMPAudit.psm1'
    ModuleVersion = '2.0.0'
    GUID = 'd8b41c29-8910-4e44-aef6-079749fa4968'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows SNMP service audit toolkit — SNMP configuration, community strings, trap destinations, security settings, and agent status'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-SNMPAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('snmp', 'monitoring', 'community-string', 'trap', 'agent', 'security', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

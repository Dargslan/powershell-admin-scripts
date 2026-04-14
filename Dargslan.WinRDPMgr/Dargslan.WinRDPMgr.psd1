@{
    RootModule = 'Dargslan.WinRDPMgr.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'd7751fff-1e14-4a34-83f4-cc550a7d1a26'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Windows Remote Desktop management toolkit — RDP session monitoring, configuration audit, security assessment, and connection logging'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-RDPAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'rdp', 'remote-desktop', 'sessions', 'security', 'monitoring', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

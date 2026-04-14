@{
    RootModule = 'Dargslan.WinDefenderATP.psm1'
    ModuleVersion = '2.0.0'
    GUID = '647a69a9-e48f-43d3-aac4-21b58b578321'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Dargslan.WinDefenderATP — Microsoft Defender for Endpoint status toolkit — advanced threat protection monitoring, attack surface reduction rules, controlled folder access, and exploit protection (2026 Edition)'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-ATPStatus')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'defender-atp', 'edr', 'threat-protection', 'asr', 'exploit-protection', 'security', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

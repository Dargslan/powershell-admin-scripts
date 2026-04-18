@{
    RootModule = 'Dargslan.WinDefenderAudit.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'b4f2c8d3-5f66-47e1-ab22-8d3f00222222'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Audit Microsoft Defender configuration, ASR rule state, exclusions and tamper protection. JSON / HTML compliance report.'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-DargslanDefenderStatus','Get-DargslanAsrRules','Get-DargslanDefenderExclusions','Get-DargslanDefenderAuditReport','Export-DargslanDefenderAuditReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('defender','asr','attack-surface-reduction','antivirus','audit','compliance','windows','sysadmin','dargslan','hardening')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com/blog/windows-defender-asr-audit-powershell-2026'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Initial release. Defender status, ASR rule mapping with names, exclusions, tamper protection check, scoring and HTML / JSON report.'
        }
    }
}

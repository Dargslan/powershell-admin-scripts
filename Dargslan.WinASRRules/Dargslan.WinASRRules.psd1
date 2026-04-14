@{
    RootModule = 'Dargslan.WinASRRules.psm1'
    ModuleVersion = '2.0.0'
    GUID = '6426e951-2dc6-4fbe-a60a-5bc6234a45e3'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Attack Surface Reduction rules management toolkit — ASR rule inventory, action states, exclusions, block events, and compliance reporting'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-ASRRulesAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('asr', 'attack-surface-reduction', 'defender', 'security', 'compliance', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

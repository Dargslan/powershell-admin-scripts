@{
    RootModule = 'Dargslan.WinPatchTuesday.psm1'
    ModuleVersion = '2.0.0'
    GUID = '5a68269a-81d0-47f1-b71e-2ddad4bd1f65'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows Patch Tuesday analysis toolkit — installed KBs, missing critical patches, patch age analysis, and update compliance scoring'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-PatchTuesdayAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('patch', 'tuesday', 'kb', 'update', 'compliance', 'critical', 'security', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

@{
    RootModule = 'Dargslan.WinHotfixDelta.psm1'
    ModuleVersion = '2.0.0'
    GUID = '0a4e15a1-6ecf-47de-94cb-f96ead3ec2ed'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows hotfix delta analysis toolkit — patch gap detection, superseded updates, rollback history, and servicing stack analysis'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-HotfixDeltaAnalysis')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('hotfix', 'delta', 'patch-gap', 'superseded', 'rollback', 'servicing', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

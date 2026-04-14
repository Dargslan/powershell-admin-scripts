@{
    RootModule = 'Dargslan.WinSecurityAudit.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'e86f15b6-6328-4b07-8752-d759349acf5e'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Windows security hardening audit toolkit — CIS benchmark checks, UAC status, BitLocker, Windows Defender, audit policy, and security scoring'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-SecurityAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'security', 'hardening', 'cis-benchmark', 'audit', 'compliance', 'uac', 'bitlocker', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

@{
    RootModule = 'Dargslan.WinUserMgmt.psm1'
    ModuleVersion = '1.0.0'
    GUID = '717835cb-fdb4-4d63-afe0-7d71ea32b18c'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Windows local user and group management toolkit — user audit, password policy, admin group check, account lockout, stale account detection'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-UserSecurityAudit', 'Get-PasswordPolicy')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'user-management', 'active-directory', 'security', 'password', 'audit', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

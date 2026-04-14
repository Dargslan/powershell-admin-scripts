@{
    RootModule = 'Dargslan.WinTokenPriv.psm1'
    ModuleVersion = '2.0.0'
    GUID = '389119a5-e99b-47ba-83a8-1515cb6b5ba9'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows token and privilege audit toolkit — current user privileges, token integrity, UAC bypass detection, and privilege escalation assessment'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-TokenPrivilegeAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('token', 'privileges', 'uac', 'integrity', 'elevation', 'security', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

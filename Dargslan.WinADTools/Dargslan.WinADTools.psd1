@{
    RootModule = 'Dargslan.WinADTools.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'c51c245a-c1ba-43d5-bdca-2b1d164e0495'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Active Directory query toolkit — user search, group membership, OU browser, password expiry reporting, and stale object detection'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-ADHealthReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'active-directory', 'ad', 'ldap', 'users', 'groups', 'organizational-unit', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

@{
    RootModule = 'Dargslan.WinNuGetAudit.psm1'
    ModuleVersion = '2.0.0'
    GUID = 'd6828f86-8c05-4c3a-a014-125ba197a0b2'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'NuGet and .NET package audit toolkit — installed packages, outdated detection, vulnerability scanning, and dependency analysis'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-NuGetAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('nuget', 'dotnet', 'packages', 'vulnerability', 'dependency', 'audit', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

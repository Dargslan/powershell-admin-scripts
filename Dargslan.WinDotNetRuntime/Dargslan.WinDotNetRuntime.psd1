@{
    RootModule = 'Dargslan.WinDotNetRuntime.psm1'
    ModuleVersion = '2.0.0'
    GUID = 'c19801dd-0ac4-4d03-be1e-c42c2b88ea6a'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'DotNet runtime and framework audit toolkit — installed .NET versions, CLR status, assembly cache, framework updates, and compatibility analysis'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-DotNetReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('dotnet', 'framework', 'clr', 'runtime', 'assembly', 'compatibility', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

@{
    RootModule = 'Dargslan.WinPythonAudit.psm1'
    ModuleVersion = '2.0.0'
    GUID = '4d3fcd80-594a-4302-b58a-7a6cadbff133'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Python installation audit toolkit — version detection, pip packages, virtual environments, PATH validation, and security configuration'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-PythonAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('python', 'pip', 'virtualenv', 'packages', 'audit', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

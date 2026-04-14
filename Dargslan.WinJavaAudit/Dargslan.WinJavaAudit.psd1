@{
    RootModule = 'Dargslan.WinJavaAudit.psm1'
    ModuleVersion = '2.0.0'
    GUID = 'ebc4982f-03f2-43e4-b148-9b2760e187b0'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Java runtime audit toolkit — JDK/JRE inventory, version detection, JAVA_HOME validation, security settings, and multiple installation detection'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-JavaAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('java', 'jdk', 'jre', 'runtime', 'security', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

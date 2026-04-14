@{
    RootModule = 'Dargslan.WinMemDiag.psm1'
    ModuleVersion = '2.0.0'
    GUID = '1c739f9c-c15f-4acd-b245-229a51039477'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Dargslan.WinMemDiag — Windows memory diagnostics toolkit — RAM health check, memory pressure analysis, page file monitoring, and memory leak detection (2026 Edition)'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-MemoryReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'memory', 'ram', 'diagnostics', 'pagefile', 'leak', 'performance', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

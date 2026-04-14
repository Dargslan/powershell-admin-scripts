@{
    RootModule = 'Dargslan.WinPerfMon.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'a21f2361-c158-4b42-8076-03b37468dab7'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Windows performance monitoring toolkit — CPU, memory, disk I/O, process analysis, bottleneck detection, and performance baselining'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-PerformanceReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'performance', 'monitoring', 'cpu', 'memory', 'bottleneck', 'baseline', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

@{
    RootModule = 'Dargslan.WinEventLog.psm1'
    ModuleVersion = '1.0.0'
    GUID = '0b052d07-47eb-4eda-a796-e6b89dcb7049'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Windows Event Log analyzer toolkit — error detection, security event monitoring, log statistics, export, and real-time filtering'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-EventLogSummary', 'Get-CriticalEvents')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'event-log', 'monitoring', 'security', 'errors', 'logging', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

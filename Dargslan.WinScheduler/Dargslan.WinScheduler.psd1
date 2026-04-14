@{
    RootModule = 'Dargslan.WinScheduler.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'e0eb1a5d-c67c-48f6-9165-17ae7914ac8e'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Windows Task Scheduler management toolkit — task inventory, failed task detection, trigger analysis, and task creation helpers'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-ScheduledTaskAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'task-scheduler', 'automation', 'scheduled-tasks', 'monitoring', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

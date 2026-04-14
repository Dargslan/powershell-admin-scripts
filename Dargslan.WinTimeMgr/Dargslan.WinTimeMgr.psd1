@{
    RootModule = 'Dargslan.WinTimeMgr.psm1'
    ModuleVersion = '1.0.0'
    GUID = '76e2b018-47e2-424f-a846-1bfe4969112d'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Windows time synchronization management toolkit — NTP status, time skew detection, W32Time service monitoring, and timezone configuration'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-TimeStatus')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'time', 'ntp', 'synchronization', 'w32time', 'timezone', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

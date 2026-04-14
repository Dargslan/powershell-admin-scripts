@{
    RootModule = 'Dargslan.WinNetStat.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'c972616a-c62b-4018-a82b-edba434c9dde'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Windows network statistics toolkit — TCP/UDP connection monitoring, listening port analysis, connection state tracking, and bandwidth stats'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-NetStatReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'netstat', 'tcp', 'udp', 'connections', 'ports', 'bandwidth', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

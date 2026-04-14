@{
    RootModule = 'Dargslan.WinDefender.psm1'
    ModuleVersion = '1.0.0'
    GUID = '59f501ce-0dbe-4806-86f3-d5bc7a758418'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Windows Defender antivirus management toolkit — protection status, scan management, threat history, exclusion audit, and definition updates'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-DefenderStatus', 'Get-DefenderThreats', 'Start-DefenderScan')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'defender', 'antivirus', 'security', 'malware', 'protection', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

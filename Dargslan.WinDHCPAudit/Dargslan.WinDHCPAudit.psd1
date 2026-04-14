@{
    RootModule = 'Dargslan.WinDHCPAudit.psm1'
    ModuleVersion = '1.0.0'
    GUID = '01f24965-01bd-4bb7-be89-bf26c6af1210'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Windows DHCP server audit toolkit — scope inventory, lease monitoring, IP utilization analysis, and reservation management'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-DHCPReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'dhcp', 'networking', 'ip-address', 'lease', 'scope', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

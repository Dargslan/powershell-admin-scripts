@{
    RootModule = 'Dargslan.WinClusterMgr.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'a62c9aaf-c2ad-40fb-b84b-fa78bf0d32b6'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2025 Dargslan. All rights reserved.'
    Description = 'Windows Failover Cluster management toolkit — cluster health, node status, resource group monitoring, quorum, and shared volume audit'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-ClusterReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'cluster', 'failover', 'high-availability', 'csv', 'quorum', 'sysadmin', 'dargslan')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

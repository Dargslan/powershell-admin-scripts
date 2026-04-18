@{
    RootModule = 'Dargslan.WinDnsHealth.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'a9271df8-a3bb-4c16-a077-d18300777777'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Audit Windows DNS Server health: zones, scavenging, recursion, root hints, forwarders. JSON / HTML report.'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-DargslanDnsZones','Get-DargslanDnsServerSettings','Get-DargslanDnsScavengingStatus','Get-DargslanDnsHealthReport','Export-DargslanDnsHealthReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('dns','dns-server','scavenging','dnssec','audit','windows','sysadmin','dargslan','infrastructure')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com/blog/windows-dns-server-health-powershell-2026'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Initial release. Zone inventory, scavenging review, recursion + forwarder audit, scoring and HTML / JSON export.'
        }
    }
}

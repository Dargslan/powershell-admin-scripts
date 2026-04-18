@{
    RootModule = 'Dargslan.WsusHealth.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'e36b621c-e7ff-405a-e4bb-15c700bbbbbb'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Audit WSUS server health: client compliance, missing critical updates, sync state. JSON / HTML report.'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-DargslanWsusServerStatus','Get-DargslanWsusClientCompliance','Get-DargslanWsusMissingCritical','Get-DargslanWsusHealthReport','Export-DargslanWsusHealthReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('wsus','windows-update','patch-management','compliance','audit','windows','sysadmin','dargslan','infrastructure')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com/blog/wsus-server-health-audit-powershell-2026'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Initial release. Server status, client compliance buckets, missing critical updates, sync state, scoring and HTML / JSON export.'
        }
    }
}

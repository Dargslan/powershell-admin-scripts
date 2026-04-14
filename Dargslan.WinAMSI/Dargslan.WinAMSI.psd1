@{
    RootModule = 'Dargslan.WinAMSI.psm1'
    ModuleVersion = '2.0.0'
    GUID = '02f6a991-0678-4b03-846c-1957816d1597'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows AMSI (Antimalware Scan Interface) audit toolkit — AMSI providers, bypass detection, script scanning status, and protection coverage'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-AMSIAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('amsi', 'antimalware', 'scan', 'bypass', 'protection', 'defender', 'security', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

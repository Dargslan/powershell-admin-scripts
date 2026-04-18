@{
    RootModule = 'Dargslan.PrintNightmareAudit.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'b69e954f-1a2c-438d-b7ee-48fa00eeeeee'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Audit Windows Print Spooler exposure (PrintNightmare): spooler state, Point-and-Print restrictions, unsigned drivers, package install policy.'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-DargslanPrintSpoolerStatus','Get-DargslanPrintNightmareConfig','Get-DargslanPrinterDrivers','Get-DargslanPrintNightmareAuditReport','Export-DargslanPrintNightmareAuditReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('printnightmare','print-spooler','cve-2021-34527','cve-2021-1675','audit','windows','sysadmin','dargslan','hardening','dfir')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com/blog/printnightmare-print-spooler-audit-powershell-2026'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Initial release. Spooler service, Point-and-Print policy keys, RestrictDriverInstallationToAdministrators, unsigned printer driver detection, scoring and HTML / JSON report.'
        }
    }
}

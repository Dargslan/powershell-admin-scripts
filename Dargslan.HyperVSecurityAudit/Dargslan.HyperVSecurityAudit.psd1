@{
    RootModule = 'Dargslan.HyperVSecurityAudit.psm1'
    ModuleVersion = '1.0.0'
    GUID = 'c149400a-c5dd-4e38-c299-f3a500999999'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Audit Hyper-V VMs: Secure Boot, vTPM, Shielded VM, snapshot retention, integration components. JSON / HTML report.'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-DargslanVmSecurityState','Get-DargslanVmSnapshots','Get-DargslanVmIntegrationServices','Get-DargslanHyperVAuditReport','Export-DargslanHyperVAuditReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('hyperv','virtualization','vtpm','shielded-vm','secure-boot','audit','windows','sysadmin','dargslan','infrastructure')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com/blog/hyperv-vm-security-audit-powershell-2026'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = 'Initial release. VM security state, snapshots, integration components, scoring and HTML / JSON export.'
        }
    }
}

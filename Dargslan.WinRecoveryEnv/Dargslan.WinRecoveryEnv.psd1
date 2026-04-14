@{
    RootModule = 'Dargslan.WinRecoveryEnv.psm1'
    ModuleVersion = '2.0.0'
    GUID = '5439ac6f-6ad5-4417-8d8f-6c45595fd577'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows Recovery Environment audit toolkit — WinRE status, recovery partition, system restore points, boot recovery options, and reset readiness'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-RecoveryAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('winre', 'recovery', 'restore-points', 'reset', 'boot-repair', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

@{
    RootModule = 'Dargslan.WinGPUMon.psm1'
    ModuleVersion = '2.0.0'
    GUID = '7088bc22-799b-408d-9de0-5d14eaf20eb7'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Dargslan.WinGPUMon — Windows GPU monitoring toolkit — GPU utilization, VRAM usage, driver versions, multi-GPU management, and compute workload tracking (2026 Edition)'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-GPUReport')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'gpu', 'graphics', 'nvidia', 'amd', 'vram', 'monitoring', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

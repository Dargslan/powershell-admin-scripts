@{
    RootModule = 'Dargslan.WinUSBGuard.psm1'
    ModuleVersion = '2.0.0'
    GUID = 'baaa5be0-18f3-4629-bf59-580faf134c3f'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Dargslan.WinUSBGuard — Windows USB device security toolkit — USB device inventory, policy enforcement, removable storage audit, and device installation control (2026 Edition)'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-USBSecurityAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('windows', 'usb', 'device-control', 'removable-storage', 'dlp', 'security', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com for documentation, free cheat sheets, and DevOps eBooks.'
        }
    }
}

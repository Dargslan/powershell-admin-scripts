@{
    RootModule = 'Dargslan.WinBluetooth.psm1'
    ModuleVersion = '2.0.0'
    GUID = 'a14b710e-934c-4436-b37e-b53edfb052b4'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows Bluetooth device audit toolkit — paired devices, drivers, service status, security settings, and Bluetooth policy'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-BluetoothAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('bluetooth', 'devices', 'pairing', 'drivers', 'wireless', 'security', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

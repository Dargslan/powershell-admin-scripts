@{
    RootModule = 'Dargslan.WinCOMHijack.psm1'
    ModuleVersion = '2.0.0'
    GUID = 'ae8db33c-9aa2-49e7-8702-71e275816b5f'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'COM hijacking detection toolkit — orphaned CLSIDs, suspicious InprocServer32 entries, phantom COM objects, and DLL side-loading risks'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-COMHijackAudit')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('com-hijack', 'clsid', 'dll-sideload', 'phantom', 'detection', 'security', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

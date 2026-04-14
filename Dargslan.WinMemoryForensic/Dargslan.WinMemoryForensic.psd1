@{
    RootModule = 'Dargslan.WinMemoryForensic.psm1'
    ModuleVersion = '2.0.0'
    GUID = 'af1e27fb-b307-4180-b8dc-3d9ca7c00c15'
    Author = 'Dargslan'
    CompanyName = 'Dargslan'
    Copyright = '(c) 2026 Dargslan. All rights reserved.'
    Description = 'Windows memory forensics toolkit — loaded DLLs, injected threads, hollow processes, memory-only malware indicators, and anomaly detection'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Get-MemoryForensicScan')
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('memory', 'forensics', 'dll-injection', 'hollow', 'threads', 'malware', 'detection', 'security', 'sysadmin', 'dargslan', '2026')
            LicenseUri = 'https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE'
            ProjectUri = 'https://dargslan.com'
            IconUri = 'https://dargslan.com/assets/img/dargslan-icon.png'
            ReleaseNotes = '2026 Edition — Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com'
        }
    }
}

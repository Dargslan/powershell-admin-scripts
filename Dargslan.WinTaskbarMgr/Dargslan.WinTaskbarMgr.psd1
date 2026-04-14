@{
    RootModule = "Dargslan.WinTaskbarMgr.psm1"
    ModuleVersion = "1.0.0"
    GUID = "60f08336-0ee8-46e0-9bff-0f55ce502c17"
    Author = "Dargslan"
    CompanyName = "Dargslan"
    Copyright = "(c) 2025 Dargslan. All rights reserved."
    Description = "Windows startup program and scheduled task optimization toolkit — autostart analysis, startup impact scoring, task trigger review, and boot optimization"
    PowerShellVersion = "5.1"
    FunctionsToExport = @("Get-StartupOptimization")
    CmdletsToExport = @()
    VariablesToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @("windows", "startup", "optimization", "autostart", "boot", "performance", "sysadmin", "dargslan")
            LicenseUri = "https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE"
            ProjectUri = "https://dargslan.com"
            IconUri = "https://dargslan.com/assets/img/dargslan-icon.png"
            ReleaseNotes = "Part of the Dargslan Windows Admin Toolkit. Visit https://dargslan.com"
        }
    }
}

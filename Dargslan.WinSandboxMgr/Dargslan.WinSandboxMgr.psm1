<#
.SYNOPSIS
    Windows Sandbox configuration toolkit — sandbox availability check, configuration builder, security assessment, and usage monitoring (2026 Edition)

.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-SandboxStatus {
    <#
    .SYNOPSIS
        Check Windows Sandbox availability and configuration
    .DESCRIPTION
        Reports Windows Sandbox feature status, virtualization support, and Hyper-V requirements.
        Part of Dargslan.WinSandboxMgr (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $report = [ordered]@{
        Feature = Get-WindowsOptionalFeature -FeatureName "Containers-DisposableClientVM" -Online -ErrorAction SilentlyContinue | Select-Object FeatureName, State
        HyperVRequired = Get-WindowsOptionalFeature -FeatureName "Microsoft-Hyper-V" -Online -ErrorAction SilentlyContinue | Select-Object FeatureName, State
        VirtualizationEnabled = (Get-CimInstance Win32_Processor).VirtualizationFirmwareEnabled
        SystemRequirements = [PSCustomObject]@{
            RAM_GB = [math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 1)
            MinRAM = 4
            MeetsRAM = [math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 1) -ge 4
            OS = (Get-CimInstance Win32_OperatingSystem).Caption
            IsProOrEnterprise = (Get-CimInstance Win32_OperatingSystem).Caption -match "Pro|Enterprise|Education"
            FreeDiskGB = [math]::Round((Get-Volume -DriveLetter C -ErrorAction SilentlyContinue).SizeRemaining / 1GB, 1)
        }
        Available = $false
    }
    $report.Available = $report.Feature.State -eq "Enabled" -and $report.VirtualizationEnabled -and $report.SystemRequirements.MeetsRAM
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Windows Sandbox — 2026 Edition]" -ForegroundColor Cyan
    Write-Host "  Feature: $($report.Feature.State) | Virtualization: $($report.VirtualizationEnabled)"
    $report.SystemRequirements | Format-List
    Write-Host "  Sandbox Available: $($report.Available)" -ForegroundColor $(if ($report.Available) {"Green"} else {"Red"})
    return $report
}

Export-ModuleMember -Function *

<#
.SYNOPSIS
    Hyper-V management toolkit — VM inventory, resource monitoring, checkpoint management, network switch audit, and VM health reporting

.DESCRIPTION
    Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-HyperVReport {
    <#
    .SYNOPSIS
        Generate comprehensive Hyper-V environment report
    .DESCRIPTION
        Lists all VMs, resource allocation, checkpoints, virtual switches, and identifies potential issues.
        Part of Dargslan.WinHyperV — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $hyperv = Get-WindowsOptionalFeature -FeatureName Microsoft-Hyper-V -Online -ErrorAction SilentlyContinue
    if (-not $hyperv -or $hyperv.State -ne "Enabled") { Write-Warning "Hyper-V not enabled"; return }
    $vms = Get-VM -ErrorAction SilentlyContinue
    $report = [ordered]@{
        Host = [PSCustomObject]@{
            Hostname = $env:COMPUTERNAME
            TotalVMs = ($vms | Measure-Object).Count
            Running = ($vms | Where-Object State -eq "Running" | Measure-Object).Count
            Off = ($vms | Where-Object State -eq "Off" | Measure-Object).Count
            Saved = ($vms | Where-Object State -eq "Saved" | Measure-Object).Count
        }
        VMs = $vms | ForEach-Object {
            [PSCustomObject]@{
                Name = $_.Name; State = $_.State; CPUs = $_.ProcessorCount
                MemoryMB = [math]::Round($_.MemoryAssigned/1MB,0); MemoryStartupMB = [math]::Round($_.MemoryStartup/1MB,0)
                DynamicMemory = $_.DynamicMemoryEnabled; Generation = $_.Generation; Version = $_.Version
                Uptime = if ($_.Uptime) { $_.Uptime.ToString("dd\.hh\:mm\:ss") } else { "N/A" }
                Checkpoints = ($_ | Get-VMSnapshot -ErrorAction SilentlyContinue | Measure-Object).Count
            }
        }
        Switches = Get-VMSwitch -ErrorAction SilentlyContinue | Select-Object Name, SwitchType, NetAdapterInterfaceDescription, BandwidthReservationMode
        Checkpoints = $vms | ForEach-Object { Get-VMSnapshot -VMName $_.Name -ErrorAction SilentlyContinue } | Select-Object VMName, Name, CreationTime, @{N="AgeDays";E={[math]::Round(((Get-Date)-$_.CreationTime).TotalDays,0)}}
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Hyper-V Report]" -ForegroundColor Cyan
    $report.Host | Format-List
    $report.VMs | Format-Table Name, State, CPUs, MemoryMB, DynamicMemory, Checkpoints -AutoSize
    $report.Switches | Format-Table -AutoSize
    $old = $report.Checkpoints | Where-Object AgeDays -gt 30
    if ($old) { Write-Host "  Old Checkpoints (>30 days):" -ForegroundColor Yellow; $old | Format-Table -AutoSize }
    return $report
}

Export-ModuleMember -Function *

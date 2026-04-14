<#
.SYNOPSIS
    Windows DHCP server audit toolkit — scope inventory, lease monitoring, IP utilization analysis, and reservation management

.DESCRIPTION
    Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-DHCPReport {
    <#
    .SYNOPSIS
        Audit DHCP server scopes and leases
    .DESCRIPTION
        Reports DHCP scope utilization, active leases, reservations, and identifies capacity issues.
        Part of Dargslan.WinDHCPAudit — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $dhcp = Get-DhcpServerv4Scope -ErrorAction SilentlyContinue
    if (-not $dhcp) { Write-Warning "DHCP Server not installed or no scopes configured"; return }
    $report = [ordered]@{
        ServerInfo = Get-DhcpServerSetting -ErrorAction SilentlyContinue | Select-Object IsDomainJoined, IsAuthorized, ConflictDetectionAttempts
        Scopes = $dhcp | ForEach-Object {
            $stats = Get-DhcpServerv4ScopeStatistics -ScopeId $_.ScopeId -ErrorAction SilentlyContinue
            [PSCustomObject]@{
                ScopeId = $_.ScopeId; Name = $_.Name; State = $_.State
                StartRange = $_.StartRange; EndRange = $_.EndRange
                SubnetMask = $_.SubnetMask; LeaseDuration = $_.LeaseDuration
                InUse = $stats.InUse; Free = $stats.Free
                PercentInUse = "$([math]::Round($stats.PercentageInUse,1))%"
                Reserved = $stats.Reserved
            }
        }
        Leases = $dhcp | ForEach-Object {
            Get-DhcpServerv4Lease -ScopeId $_.ScopeId -ErrorAction SilentlyContinue | Select-Object -First 20 IPAddress, HostName, ClientId, AddressState, LeaseExpiryTime
        }
        Reservations = $dhcp | ForEach-Object {
            Get-DhcpServerv4Reservation -ScopeId $_.ScopeId -ErrorAction SilentlyContinue | Select-Object IPAddress, Name, ClientId, Description
        }
    }
    $report.Warnings = @()
    $report.Scopes | Where-Object { [double]($_.PercentInUse -replace "%","") -gt 80 } | ForEach-Object { $report.Warnings += "Scope $($_.ScopeId) is $($_.PercentInUse) utilized" }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [DHCP Report]" -ForegroundColor Cyan
    $report.Scopes | Format-Table ScopeId, Name, State, InUse, Free, PercentInUse -AutoSize
    if ($report.Warnings) { Write-Host "  Warnings:" -ForegroundColor Red; $report.Warnings | ForEach-Object { Write-Host "  ⚠ $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function *

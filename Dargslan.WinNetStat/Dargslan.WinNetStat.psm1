<#
.SYNOPSIS
    Windows network statistics toolkit — TCP/UDP connection monitoring, listening port analysis, connection state tracking, and bandwidth stats

.DESCRIPTION
    Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-NetStatReport {
    <#
    .SYNOPSIS
        Analyze active network connections and listening ports
    .DESCRIPTION
        Reports TCP/UDP connections, listening services, connection states, and identifies high-connection processes.
        Part of Dargslan.WinNetStat — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json, [switch]$ListeningOnly)

    $tcp = Get-NetTCPConnection -ErrorAction SilentlyContinue
    $udp = Get-NetUDPEndpoint -ErrorAction SilentlyContinue
    $report = [ordered]@{
        Summary = [PSCustomObject]@{
            TotalTCP = ($tcp | Measure-Object).Count
            Established = ($tcp | Where-Object State -eq "Established" | Measure-Object).Count
            Listening = ($tcp | Where-Object State -eq "Listen" | Measure-Object).Count
            TimeWait = ($tcp | Where-Object State -eq "TimeWait" | Measure-Object).Count
            CloseWait = ($tcp | Where-Object State -eq "CloseWait" | Measure-Object).Count
            TotalUDP = ($udp | Measure-Object).Count
        }
        ListeningPorts = $tcp | Where-Object State -eq "Listen" | Sort-Object LocalPort | ForEach-Object {
            $proc = Get-Process -Id $_.OwningProcess -ErrorAction SilentlyContinue
            [PSCustomObject]@{
                Port = $_.LocalPort; Address = $_.LocalAddress; Protocol = "TCP"
                PID = $_.OwningProcess; Process = $(if($proc){$proc.ProcessName}else{"Unknown"})
            }
        }
        TopConnections = $tcp | Where-Object State -eq "Established" | Group-Object OwningProcess | Sort-Object Count -Descending | Select-Object -First 10 | ForEach-Object {
            $proc = Get-Process -Id $_.Name -ErrorAction SilentlyContinue
            [PSCustomObject]@{ PID = $_.Name; Process = $(if($proc){$proc.ProcessName}else{"Unknown"}); Connections = $_.Count }
        }
        StateDistribution = $tcp | Group-Object State | Select-Object @{N="State";E={$_.Name}}, Count | Sort-Object Count -Descending
    }
    if ($ListeningOnly) { $report = [ordered]@{ ListeningPorts = $report.ListeningPorts } }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Network Statistics]" -ForegroundColor Cyan
    if (-not $ListeningOnly) { $report.Summary | Format-List; $report.StateDistribution | Format-Table -AutoSize }
    Write-Host "  Listening Ports:" -ForegroundColor Yellow
    $report.ListeningPorts | Format-Table Port, Address, Process, PID -AutoSize
    if (-not $ListeningOnly) { Write-Host "  Top Connections by Process:" -ForegroundColor Yellow; $report.TopConnections | Format-Table -AutoSize }
    return $report
}

Export-ModuleMember -Function *

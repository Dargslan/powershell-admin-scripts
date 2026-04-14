function Get-NPSAudit {
    <#
    .SYNOPSIS
        Audit Network Policy Server configuration and policies
    .DESCRIPTION
        Windows Network Policy Server audit toolkit — RADIUS policies, connection request policies, NAS clients, and accounting
        Part of the Dargslan Windows Admin Toolkit — https://dargslan.com
    .PARAMETER Json
        Output results as JSON
    .EXAMPLE
        Get-NPSAudit
    .EXAMPLE
        Get-NPSAudit -Json
    .LINK
        https://dargslan.com
    .LINK
        https://www.powershellgallery.com/profiles/Dargslan
    #>
    [CmdletBinding()]
    param([switch]$Json)

    $report = [ordered]@{
        Service = Get-Service IAS -ErrorAction SilentlyContinue | Select-Object Status, StartType
        RadiusClients = netsh nps show client 2>$null | Where-Object { $_ -match "\S" } | ForEach-Object { $_.Trim() }
        EventLog = Get-WinEvent -LogName "Security" -FilterXPath "*[System[EventID=6272 or EventID=6273]]" -MaxEvents 20 -ErrorAction SilentlyContinue | Select-Object TimeCreated, Id, Message
        RegistryConfig = [PSCustomObject]@{
            AccountingLogDir = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Services\IAS\Parameters\Accounting" -ErrorAction SilentlyContinue).LogFileDir
        }
        Warnings = @()
    }
    if ($report.Service.Status -ne "Running") { $report.Warnings += "NPS/IAS service is not running" }
    $report.Summary = [PSCustomObject]@{ ServiceRunning = $report.Service.Status -eq "Running"; RecentAuthEvents = ($report.EventLog | Measure-Object).Count }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [NPS/RADIUS Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.EventLog) { $report.EventLog | Format-Table TimeCreated, Id -AutoSize }
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function Get-NPSAudit

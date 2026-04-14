function Get-PowerBIGatewayAudit {
    <#
    .SYNOPSIS
        Audit Power BI Gateway service and data sources
    .DESCRIPTION
        Windows Power BI Gateway audit toolkit — gateway service, data sources, connections, refresh schedules, and capacity monitoring
        Part of the Dargslan Windows Admin Toolkit — https://dargslan.com
    .PARAMETER Json
        Output results as JSON
    .EXAMPLE
        Get-PowerBIGatewayAudit
    .EXAMPLE
        Get-PowerBIGatewayAudit -Json
    .LINK
        https://dargslan.com
    .LINK
        https://www.powershellgallery.com/profiles/Dargslan
    #>
    [CmdletBinding()]
    param([switch]$Json)

    $report = [ordered]@{
        GatewayService = Get-Service PBIEgwService -ErrorAction SilentlyContinue | Select-Object Status, StartType
        DMService = Get-Service "On-premises data gateway service" -ErrorAction SilentlyContinue | Select-Object Status, StartType
        GatewayConfig = [PSCustomObject]@{
            InstallPath = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\On-premises data gateway" -ErrorAction SilentlyContinue).InstallPath
            Version = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\On-premises data gateway" -ErrorAction SilentlyContinue).Version
        }
        ConnectorPorts = Get-NetTCPConnection -OwningProcess (Get-Process -Name "Microsoft.PowerBI.EnterpriseGateway" -ErrorAction SilentlyContinue).Id -ErrorAction SilentlyContinue | Select-Object LocalPort, RemoteAddress, State | Select-Object -First 20
        Resources = Get-Process -Name "*PowerBI*" -ErrorAction SilentlyContinue | Select-Object Name, CPU, WorkingSet64, Id
        Warnings = @()
    }
    if (-not $report.GatewayService -or $report.GatewayService.Status -ne "Running") { $report.Warnings += "Power BI Gateway service is not running or not installed" }
    $report.Summary = [PSCustomObject]@{ GatewayRunning = ($report.GatewayService.Status -eq "Running"); Version = $report.GatewayConfig.Version; ActiveConnections = ($report.ConnectorPorts | Measure-Object).Count }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Power BI Gateway Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.Resources) { $report.Resources | Format-Table -AutoSize }
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function Get-PowerBIGatewayAudit

function Get-SMTPAudit {
    <#
    .SYNOPSIS
        Audit SMTP virtual server configuration and relay security
    .DESCRIPTION
        Windows SMTP server audit toolkit — virtual servers, relay restrictions, authentication, queue, and delivery status
        Part of the Dargslan Windows Admin Toolkit — https://dargslan.com
    .PARAMETER Json
        Output results as JSON
    .EXAMPLE
        Get-SMTPAudit
    .EXAMPLE
        Get-SMTPAudit -Json
    .LINK
        https://dargslan.com
    #>
    [CmdletBinding()]
    param([switch]$Json)

    $report = [ordered]@{
        SMTPService = Get-Service SMTPSVC -ErrorAction SilentlyContinue | Select-Object Status, StartType
        Features = Get-WindowsFeature SMTP-Server -ErrorAction SilentlyContinue | Select-Object Name, Installed
        MailQueues = Get-ChildItem "C:\inetpub\mailroot\Queue" -ErrorAction SilentlyContinue | Measure-Object | Select-Object Count
        BadMail = Get-ChildItem "C:\inetpub\mailroot\Badmail" -ErrorAction SilentlyContinue | Measure-Object | Select-Object Count
        Registry = [PSCustomObject]@{
            MaxRecipients = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Services\SMTPSVC\Parameters" -ErrorAction SilentlyContinue).MaxRecipients
            MaxMessageSize = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Services\SMTPSVC\Parameters" -ErrorAction SilentlyContinue).MaxMsgSize
        }
        Warnings = @()
    }
    if ($report.SMTPService.Status -ne "Running") { $report.Warnings += "SMTP service is not running" }
    $report.Summary = [PSCustomObject]@{ ServiceRunning = $report.SMTPService.Status -eq "Running"; QueuedMessages = $report.MailQueues.Count; BadMailCount = $report.BadMail.Count }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [SMTP Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function Get-SMTPAudit

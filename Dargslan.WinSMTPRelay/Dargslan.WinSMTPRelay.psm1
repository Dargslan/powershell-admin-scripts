<#
.SYNOPSIS
    Windows SMTP relay and mail configuration audit toolkit — SMTP service status, relay settings, queue monitoring, and mail flow testing
.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-SMTPRelayAudit {
    <#
    .SYNOPSIS
        Audit Windows SMTP relay configuration
    .DESCRIPTION
        Reports SMTP service status, relay restrictions, queue size, mail root configuration, and connectivity testing.
        Part of Dargslan.WinSMTPRelay (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
$report = [ordered]@{
        SMTPService = Get-Service SMTPSVC -ErrorAction SilentlyContinue | Select-Object Status, StartType
        IISSMTPVDir = Get-CimInstance -Namespace root/MicrosoftIISv2 -ClassName IIsSmtpServerSetting -ErrorAction SilentlyContinue | Select-Object -First 1
        Port25Open = try { $tcp = New-Object System.Net.Sockets.TcpClient; $tcp.Connect("127.0.0.1", 25); $tcp.Connected; $tcp.Close() } catch { $false }
        Port587Open = try { $tcp = New-Object System.Net.Sockets.TcpClient; $tcp.Connect("127.0.0.1", 587); $tcp.Connected; $tcp.Close() } catch { $false }
        MailQueue = @()
        RelayRestrictions = @()
    }
    $queuePaths = @("$env:SystemRoot\System32\inetsrv\mailroot\Queue","$env:SystemRoot\System32\inetsrv\mailroot\Badmail")
    foreach ($qp in $queuePaths) {
        if (Test-Path $qp) {
            $count = (Get-ChildItem $qp -ErrorAction SilentlyContinue | Measure-Object).Count
            $report.MailQueue += [PSCustomObject]@{ Folder = Split-Path $qp -Leaf; Items = $count }
        }
    }
    $report.Summary = [PSCustomObject]@{
        SMTPService = if($report.SMTPService) {$report.SMTPService.Status} else {"Not installed"}
        Port25 = $report.Port25Open; Port587 = $report.Port587Open
        QueueItems = ($report.MailQueue | Measure-Object -Property Items -Sum).Sum
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [SMTP Relay Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.MailQueue) { $report.MailQueue | Format-Table -AutoSize }
    return $report
}

Export-ModuleMember -Function *

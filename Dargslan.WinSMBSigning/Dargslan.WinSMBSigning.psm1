<#
.SYNOPSIS
    Windows SMB signing and security audit toolkit — SMB signing status, encryption, dialect negotiation, and relay attack defense
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-SMBSigningAudit {
    <#
    .SYNOPSIS
        Audit SMB signing, encryption, and relay defense
    .DESCRIPTION
        Part of Dargslan.WinSMBSigning (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        ServerConfig = Get-SmbServerConfiguration -ErrorAction SilentlyContinue | Select-Object EnableSMB1Protocol, EnableSMB2Protocol, RequireSecuritySignature, EnableSecuritySignature, EncryptData, RejectUnencryptedAccess
        ClientConfig = Get-SmbClientConfiguration -ErrorAction SilentlyContinue | Select-Object RequireSecuritySignature, EnableSecuritySignature, EncryptionCiphers
        SMB1Status = (Get-WindowsOptionalFeature -Online -FeatureName SMB1Protocol -ErrorAction SilentlyContinue).State
        ActiveConnections = Get-SmbConnection -ErrorAction SilentlyContinue | Select-Object ServerName, ShareName, Dialect, Signed, Encrypted | Select-Object -First 15
        Warnings = @()
    }
    if ($report.ServerConfig.EnableSMB1Protocol) { $report.Warnings += "SMBv1 is enabled — critical security risk" }
    if (-not $report.ServerConfig.RequireSecuritySignature) { $report.Warnings += "SMB signing not required on server" }
    if (-not $report.ServerConfig.EncryptData) { $report.Warnings += "SMB encryption not enabled" }
    $score = 50
    if (-not $report.ServerConfig.EnableSMB1Protocol) { $score += 20 }
    if ($report.ServerConfig.RequireSecuritySignature) { $score += 15 }
    if ($report.ServerConfig.EncryptData) { $score += 15 }
    $report.SecurityScore = [PSCustomObject]@{ Score=$score; Grade=$(if($score -ge 80){"A"}elseif($score -ge 60){"B"}else{"C"}) }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [SMB Signing Audit - 2026]" -ForegroundColor Cyan
    $report.ServerConfig | Format-List
    Write-Host "  Score: $score/100 ($($report.SecurityScore.Grade))" -ForegroundColor $(if($score -ge 80){"Green"}else{"Yellow"})
    if ($report.ActiveConnections) { $report.ActiveConnections | Format-Table -AutoSize }
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function *

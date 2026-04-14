<#
.SYNOPSIS
    Windows SMB/CIFS share management toolkit — share inventory, session monitoring, open file tracking, and security configuration audit

.DESCRIPTION
    Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
    Windows & DevOps Books: https://dargslan.com/books

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-SMBAudit {
    <#
    .SYNOPSIS
        Audit SMB shares, sessions, and security
    .DESCRIPTION
        Lists all SMB shares, active sessions, open files, and audits SMB security configuration.
        Part of Dargslan.WinSMBMgr — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $report = [ordered]@{
        Shares = Get-SmbShare | Where-Object { $_.Name -notmatch "\$$" } | Select-Object Name, Path, Description, CurrentUsers, @{N="Permissions";E={(Get-SmbShareAccess -Name $_.Name -ErrorAction SilentlyContinue | Select-Object AccountName, AccessControlType, AccessRight)}}
        HiddenShares = Get-SmbShare | Where-Object { $_.Name -match "\$$" } | Select-Object Name, Path
        Sessions = Get-SmbSession -ErrorAction SilentlyContinue | Select-Object ClientComputerName, ClientUserName, NumOpens, @{N="ConnectedSec";E={$_.SecondsExists}}
        OpenFiles = (Get-SmbOpenFile -ErrorAction SilentlyContinue | Measure-Object).Count
        Config = [PSCustomObject]@{
            SMB1 = (Get-SmbServerConfiguration).EnableSMB1Protocol
            SMB2 = (Get-SmbServerConfiguration).EnableSMB2Protocol
            Signing = (Get-SmbServerConfiguration).RequireSecuritySignature
            Encryption = (Get-SmbServerConfiguration).EncryptData
        }
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 4 }
    Write-Host "`n  [SMB Audit]" -ForegroundColor Cyan
    Write-Host "  SMB1: $($report.Config.SMB1) | SMB2: $($report.Config.SMB2) | Signing: $($report.Config.Signing) | Encryption: $($report.Config.Encryption)"
    $report.Shares | Format-Table Name, Path, CurrentUsers -AutoSize
    if ($report.Config.SMB1) { Write-Host "  ⚠ SMB1 is enabled — this is a security risk!" -ForegroundColor Red }
    return $report
}

Export-ModuleMember -Function *

<#
.SYNOPSIS
    Windows Credential Manager audit toolkit — stored credentials, Windows Vault, generic credentials, and credential age analysis
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-CredentialManagerAudit {
    <#
    .SYNOPSIS
        Audit Windows Credential Manager and stored credentials
    .DESCRIPTION
        Part of Dargslan.WinCredentialMgr (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        WindowsCredentials = cmdkey /list 2>$null | ForEach-Object {
            if ($_ -match "Target:\s+(.+)") { $target = $Matches[1].Trim() }
            if ($_ -match "Type:\s+(.+)") { $type = $Matches[1].Trim() }
            if ($_ -match "User:\s+(.+)") {
                [PSCustomObject]@{ Target=$target; Type=$type; User=$Matches[1].Trim() }
            }
        } | Where-Object { $_ }
        VaultList = vaultcmd /list 2>$null | Where-Object { $_ -match "\S" -and $_ -notmatch "^Currently" } | ForEach-Object { $_.Trim() }
        DPAPIKeys = (Get-ChildItem "$env:APPDATA\Microsoft\Protect" -Recurse -ErrorAction SilentlyContinue | Measure-Object).Count
        Summary = [PSCustomObject]@{ StoredCredentials = 0; Vaults = 0; DPAPIKeys = 0 }
    }
    $report.Summary.StoredCredentials = ($report.WindowsCredentials | Measure-Object).Count
    $report.Summary.Vaults = ($report.VaultList | Where-Object { $_ -match "Vault:" } | Measure-Object).Count
    $report.Summary.DPAPIKeys = $report.DPAPIKeys
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Credential Manager - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.WindowsCredentials) { $report.WindowsCredentials | Format-Table -AutoSize }
    return $report
}

Export-ModuleMember -Function *

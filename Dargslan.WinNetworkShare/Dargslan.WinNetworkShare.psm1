<#
.SYNOPSIS
    Windows network share enumeration and security toolkit — accessible shares, null sessions, anonymous access, and share permission audit
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-NetworkShareSecurity {
    <#
    .SYNOPSIS
        Audit network share security and anonymous access
    .DESCRIPTION
        Part of Dargslan.WinNetworkShare (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        LocalShares = Get-SmbShare -ErrorAction SilentlyContinue | Select-Object Name, Path, Description, CurrentUsers, ShareType, @{N="Special";E={$_.Special}}
        SharePermissions = Get-SmbShare -ErrorAction SilentlyContinue | Where-Object { -not $_.Special } | ForEach-Object {
            $share = $_.Name
            Get-SmbShareAccess -Name $share -ErrorAction SilentlyContinue | Select-Object @{N="Share";E={$share}}, AccountName, AccessControlType, AccessRight
        }
        NullSession = [PSCustomObject]@{
            RestrictAnonymous = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -ErrorAction SilentlyContinue).RestrictAnonymous
            RestrictAnonymousSAM = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -ErrorAction SilentlyContinue).RestrictAnonymousSAM
            EveryoneIncludesAnonymous = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -ErrorAction SilentlyContinue).EveryoneIncludesAnonymous
        }
        OpenSessions = Get-SmbSession -ErrorAction SilentlyContinue | Select-Object ClientComputerName, ClientUserName, NumOpens | Select-Object -First 10
        Warnings = @()
    }
    if ($report.NullSession.RestrictAnonymous -eq 0) { $report.Warnings += "Anonymous access not restricted" }
    if ($report.NullSession.EveryoneIncludesAnonymous -eq 1) { $report.Warnings += "Everyone includes anonymous users" }
    $report.SharePermissions | Where-Object { $_.AccountName -match "Everyone" -and $_.AccessRight -match "Full|Change" } | ForEach-Object { $report.Warnings += "Share $($_.Share) gives $($_.AccessRight) to Everyone" }
    $report.Summary = [PSCustomObject]@{ TotalShares = ($report.LocalShares | Measure-Object).Count; NonSpecial = ($report.LocalShares | Where-Object {-not $_.Special} | Measure-Object).Count; ActiveSessions = ($report.OpenSessions | Measure-Object).Count; Warnings = $report.Warnings.Count }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Network Share Security - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    $report.LocalShares | Where-Object {-not $_.Special} | Format-Table Name, Path, CurrentUsers -AutoSize
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function *

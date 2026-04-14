<#
.SYNOPSIS
    Windows shared folders audit toolkit — network share inventory, permission analysis, open files, active sessions, and hidden share detection
.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-SharedFolderAudit {
    <#
    .SYNOPSIS
        Audit network shares and permissions
    .DESCRIPTION
        Reports all shared folders, their permissions, open files, active sessions, and hidden administrative shares.
        Part of Dargslan.WinSharedFolders (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
$report = [ordered]@{
        Shares = Get-SmbShare -ErrorAction SilentlyContinue | Select-Object Name, Path, Description, ShareType, CurrentUsers, @{N="Hidden";E={$_.Name -match "\$$"}}
        SharePermissions = Get-SmbShare -ErrorAction SilentlyContinue | ForEach-Object {
            $share = $_.Name
            Get-SmbShareAccess -Name $share -ErrorAction SilentlyContinue | Select-Object @{N="Share";E={$share}}, AccountName, AccessControlType, AccessRight
        }
        OpenFiles = Get-SmbOpenFile -ErrorAction SilentlyContinue | Select-Object FileId, Path, ClientComputerName, ClientUserName, Permissions
        Sessions = Get-SmbSession -ErrorAction SilentlyContinue | Select-Object SessionId, ClientComputerName, ClientUserName, NumOpens, SecondsExists, SecondsIdle
        HiddenShares = Get-SmbShare -ErrorAction SilentlyContinue | Where-Object { $_.Name -match "\$$" } | Select-Object Name, Path, Description
        Warnings = @()
    }
    $everyoneShares = $report.SharePermissions | Where-Object { $_.AccountName -match "Everyone" -and $_.AccessRight -match "Full|Change" }
    if ($everyoneShares) { $report.Warnings += "Shares with Everyone Full/Change access: $(($everyoneShares | Select-Object Share -Unique | Measure-Object).Count)" }
    $report.Summary = [PSCustomObject]@{
        TotalShares = ($report.Shares | Measure-Object).Count
        HiddenShares = ($report.HiddenShares | Measure-Object).Count
        OpenFiles = ($report.OpenFiles | Measure-Object).Count
        ActiveSessions = ($report.Sessions | Measure-Object).Count
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Shared Folders Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    $report.Shares | Where-Object { -not $_.Hidden } | Format-Table Name, Path, CurrentUsers -AutoSize
    if ($report.Sessions) { Write-Host "  Active Sessions:" -ForegroundColor Yellow; $report.Sessions | Format-Table -AutoSize }
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function *

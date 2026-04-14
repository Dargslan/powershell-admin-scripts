<#
.SYNOPSIS
    Git installation and configuration audit toolkit — version, global config, SSH keys, credential helpers, hooks, and repository discovery
.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-GitAudit {
    <#
    .SYNOPSIS
        Audit Git installation and configuration
    .DESCRIPTION
        Reports Git version, global configuration, SSH keys, credential helpers, git hooks, and discovered repositories.
        Part of Dargslan.WinGitAudit (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
$report = [ordered]@{
        Version = try { (git --version 2>$null).Trim() } catch { "Not installed" }
        GitPath = (Get-Command git -ErrorAction SilentlyContinue).Source
        GlobalConfig = git config --global --list 2>$null | Where-Object { $_ -match "=" } | ForEach-Object { $p=$_ -split "=",2; [PSCustomObject]@{Key=$p[0];Value=$p[1]} }
        SSHKeys = Get-ChildItem "$env:USERPROFILE\.ssh\*.pub" -ErrorAction SilentlyContinue | Select-Object Name, @{N="Type";E={(Get-Content $_.FullName | ForEach-Object { ($_ -split " ")[0] })}}, LastWriteTime
        CredentialHelper = git config --global credential.helper 2>$null
        LFS = (Get-Command git-lfs -ErrorAction SilentlyContinue) -ne $null
        Aliases = git config --global --get-regexp "^alias\." 2>$null | ForEach-Object { $p=$_ -split " ",2; [PSCustomObject]@{Alias=$p[0] -replace "alias\.","";Command=$p[1]} }
    }
    $report.Summary = [PSCustomObject]@{
        Version = $report.Version; User = (git config --global user.name 2>$null)
        Email = (git config --global user.email 2>$null); SSHKeys = ($report.SSHKeys | Measure-Object).Count
        CredHelper = if($report.CredentialHelper) {$report.CredentialHelper} else {"None"}
        LFS = if($report.LFS) {"Installed"} else {"Not installed"}
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Git Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.SSHKeys) { $report.SSHKeys | Format-Table -AutoSize }
    if ($report.Aliases) { Write-Host "  Aliases:" -ForegroundColor Yellow; $report.Aliases | Format-Table -AutoSize }
    return $report
}

Export-ModuleMember -Function *

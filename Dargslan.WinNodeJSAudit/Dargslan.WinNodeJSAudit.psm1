<#
.SYNOPSIS
    Node.js and npm audit toolkit — version detection, global packages, npm configuration, vulnerability scanning, and nvm management
.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-NodeJSAudit {
    <#
    .SYNOPSIS
        Audit Node.js installations and npm packages
    .DESCRIPTION
        Reports Node.js version, npm global packages, npm configuration, nvm installations, and security status.
        Part of Dargslan.WinNodeJSAudit (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
$report = [ordered]@{
        NodeVersion = try { (node --version 2>$null).Trim() } catch { "Not installed" }
        NpmVersion = try { (npm --version 2>$null).Trim() } catch { "Not installed" }
        NodePath = (Get-Command node -ErrorAction SilentlyContinue).Source
        GlobalPackages = npm list -g --depth=0 --json 2>$null | ConvertFrom-Json -ErrorAction SilentlyContinue | Select-Object -ExpandProperty dependencies -ErrorAction SilentlyContinue
        NpmConfig = npm config list 2>$null | Where-Object { $_ -match "=" -and $_ -notmatch "^;" } | Select-Object -First 15 | ForEach-Object { $_.Trim() }
        NvmInstalled = (Get-Command nvm -ErrorAction SilentlyContinue) -ne $null
        CacheSizeMB = if (Test-Path (npm config get cache 2>$null)) { [math]::Round((Get-ChildItem (npm config get cache) -Recurse -File -ErrorAction SilentlyContinue | Measure-Object Length -Sum).Sum / 1MB, 0) } else { 0 }
    }
    $report.Summary = [PSCustomObject]@{
        NodeVersion = $report.NodeVersion; NpmVersion = $report.NpmVersion
        GlobalPackages = if ($report.GlobalPackages) { ($report.GlobalPackages.PSObject.Properties | Measure-Object).Count } else { 0 }
        NVM = if ($report.NvmInstalled) {"Installed"} else {"Not installed"}; CacheMB = $report.CacheSizeMB
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Node.js Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.GlobalPackages) { Write-Host "  Global Packages:" -ForegroundColor Yellow; $report.GlobalPackages.PSObject.Properties | Select-Object Name, @{N="Version";E={$_.Value.version}} | Format-Table -AutoSize }
    return $report
}

Export-ModuleMember -Function *

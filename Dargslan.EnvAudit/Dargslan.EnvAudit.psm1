<#
.SYNOPSIS
    Audit environment variables for sensitive data exposure

.DESCRIPTION
    Part of the Dargslan Windows Admin Tools collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
    Linux & DevOps Books: https://dargslan.com/books

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-EnvAudit {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Env Audit
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $env = [Environment]::GetEnvironmentVariables("Machine"); $suspicious = @("PASSWORD","SECRET","KEY","TOKEN","API","CREDENTIAL"); $warnings = @(); foreach ($key in $env.Keys) { foreach ($s in $suspicious) { if ($key -match $s) { $warnings += [PSCustomObject]@{Variable=$key; Scope="Machine"; Risk="Potential sensitive data"} } } }; $userEnv = [Environment]::GetEnvironmentVariables("User"); foreach ($key in $userEnv.Keys) { foreach ($s in $suspicious) { if ($key -match $s) { $warnings += [PSCustomObject]@{Variable=$key; Scope="User"; Risk="Potential sensitive data"} } } }; Write-Host "`n[Env Audit] Machine vars: $($env.Count) | User vars: $($userEnv.Count) | Warnings: $($warnings.Count)" -ForegroundColor Yellow; if ($warnings.Count -gt 0) { $warnings | Format-Table -AutoSize }
}


Export-ModuleMember -Function *

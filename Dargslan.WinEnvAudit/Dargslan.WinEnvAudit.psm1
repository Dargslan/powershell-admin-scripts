<#
.SYNOPSIS
    Windows environment variable audit toolkit — system/user variable inventory, PATH analysis, duplicate detection, and security review

.DESCRIPTION
    Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-EnvAudit {
    <#
    .SYNOPSIS
        Audit system and user environment variables
    .DESCRIPTION
        Lists all environment variables, analyzes PATH for issues, detects duplicates, and identifies security concerns.
        Part of Dargslan.WinEnvAudit — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $report = [ordered]@{
        SystemVars = [System.Environment]::GetEnvironmentVariables([System.EnvironmentVariableTarget]::Machine) | ForEach-Object { $_.GetEnumerator() } | Select-Object Key, Value | Sort-Object Key
        UserVars = [System.Environment]::GetEnvironmentVariables([System.EnvironmentVariableTarget]::User) | ForEach-Object { $_.GetEnumerator() } | Select-Object Key, Value | Sort-Object Key
        PathAnalysis = @{
            SystemPaths = @()
            InvalidPaths = @()
            DuplicatePaths = @()
        }
    }
    $sysPaths = ($env:PATH -split ";") | Where-Object { $_ }
    $report.PathAnalysis.SystemPaths = $sysPaths
    $report.PathAnalysis.InvalidPaths = $sysPaths | Where-Object { -not (Test-Path $_ -ErrorAction SilentlyContinue) }
    $groups = $sysPaths | Group-Object | Where-Object Count -gt 1
    $report.PathAnalysis.DuplicatePaths = $groups | ForEach-Object { $_.Name }
    $report.Summary = [PSCustomObject]@{
        SystemVariables = ($report.SystemVars | Measure-Object).Count
        UserVariables = ($report.UserVars | Measure-Object).Count
        PathEntries = $sysPaths.Count
        InvalidPaths = $report.PathAnalysis.InvalidPaths.Count
        DuplicatePaths = $report.PathAnalysis.DuplicatePaths.Count
    }
    $report.SecurityConcerns = @()
    $report.SystemVars | Where-Object { $_.Value -match "(password|secret|key|token)=" -and $_.Key -notmatch "^(PSModulePath|Path)" } | ForEach-Object { $report.SecurityConcerns += "Variable $($_.Key) may contain sensitive data" }
    $sysPaths | Where-Object { $_ -match "^C:\Users\" } | ForEach-Object { $report.SecurityConcerns += "User-writable path in system PATH: $_" }
    if ($Json) { return $report | ConvertTo-Json -Depth 4 }
    Write-Host "`n  [Environment Audit]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.PathAnalysis.InvalidPaths) { Write-Host "  Invalid PATH entries:" -ForegroundColor Red; $report.PathAnalysis.InvalidPaths | ForEach-Object { Write-Host "    ✗ $_" -ForegroundColor Yellow } }
    if ($report.PathAnalysis.DuplicatePaths) { Write-Host "  Duplicate PATH entries:" -ForegroundColor Yellow; $report.PathAnalysis.DuplicatePaths | ForEach-Object { Write-Host "    ⊘ $_" } }
    if ($report.SecurityConcerns) { Write-Host "  Security Concerns:" -ForegroundColor Red; $report.SecurityConcerns | ForEach-Object { Write-Host "    ⚠ $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function *

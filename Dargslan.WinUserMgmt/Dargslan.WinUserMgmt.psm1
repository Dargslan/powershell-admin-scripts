<#
.SYNOPSIS
    Windows local user and group management toolkit — user audit, password policy, admin group check, account lockout, stale account detection

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

function Get-UserSecurityAudit {
    <#
    .SYNOPSIS
        Comprehensive local user account security audit
    .DESCRIPTION
        Audits all local user accounts for security issues: admin membership, password policy, disabled accounts, never-expiring passwords, and stale accounts.
        Part of Dargslan.WinUserMgmt — https://dargslan.com
    #>
    [CmdletBinding()] param([int]$StaleDays = 90, [switch]$Json)

    $users = Get-LocalUser
    $admins = Get-LocalGroupMember -Group "Administrators" -ErrorAction SilentlyContinue
    $report = [ordered]@{
        Summary = [PSCustomObject]@{
            TotalUsers = ($users | Measure-Object).Count
            Enabled = ($users | Where-Object Enabled | Measure-Object).Count
            Disabled = ($users | Where-Object { -not $_.Enabled } | Measure-Object).Count
            Admins = ($admins | Measure-Object).Count
            NeverExpire = ($users | Where-Object { $_.PasswordExpires -eq $null -and $_.Enabled } | Measure-Object).Count
            NoPasswordRequired = ($users | Where-Object { $_.PasswordRequired -eq $false } | Measure-Object).Count
        }
        Users = $users | ForEach-Object {
            $isAdmin = $admins.Name -contains "$env:COMPUTERNAME\$($_.Name)"
            [PSCustomObject]@{
                Name = $_.Name; Enabled = $_.Enabled; IsAdmin = $isAdmin
                LastLogon = $_.LastLogon; PasswordLastSet = $_.PasswordLastSet
                PasswordExpires = $_.PasswordExpires; PasswordRequired = $_.PasswordRequired
                IsStale = ($_.LastLogon -and $_.LastLogon -lt (Get-Date).AddDays(-$StaleDays))
            }
        }
        StaleAccounts = $users | Where-Object { $_.Enabled -and $_.LastLogon -and $_.LastLogon -lt (Get-Date).AddDays(-$StaleDays) } | Select-Object Name, LastLogon
        Administrators = $admins | Select-Object Name, ObjectClass, PrincipalSource
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [User Security Audit]" -ForegroundColor Cyan
    $report.Summary | Format-List
    Write-Host "  Administrators:" -ForegroundColor Yellow
    $report.Administrators | Format-Table -AutoSize
    if ($report.StaleAccounts) { Write-Host "  Stale Accounts (>$StaleDays days):" -ForegroundColor Red; $report.StaleAccounts | Format-Table }
    return $report
}

function Get-PasswordPolicy {
    <#
    .SYNOPSIS
        Get local password policy settings
    .DESCRIPTION
        Retrieves password complexity, length, history, and lockout policy settings.
        Part of Dargslan.WinUserMgmt — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $netAccounts = net accounts 2>&1
    $policy = [PSCustomObject]@{}
    foreach ($line in $netAccounts) {
        if ($line -match "Minimum password length:\s+(.+)") { $policy | Add-Member -NotePropertyName "MinLength" -NotePropertyValue $Matches[1].Trim() }
        if ($line -match "Maximum password age.*:\s+(.+)") { $policy | Add-Member -NotePropertyName "MaxAge" -NotePropertyValue $Matches[1].Trim() }
        if ($line -match "Minimum password age.*:\s+(.+)") { $policy | Add-Member -NotePropertyName "MinAge" -NotePropertyValue $Matches[1].Trim() }
        if ($line -match "Password history.*:\s+(.+)") { $policy | Add-Member -NotePropertyName "History" -NotePropertyValue $Matches[1].Trim() }
        if ($line -match "Lockout threshold:\s+(.+)") { $policy | Add-Member -NotePropertyName "LockoutThreshold" -NotePropertyValue $Matches[1].Trim() }
        if ($line -match "Lockout duration.*:\s+(.+)") { $policy | Add-Member -NotePropertyName "LockoutDuration" -NotePropertyValue $Matches[1].Trim() }
    }
    if ($Json) { return $policy | ConvertTo-Json }
    Write-Host "`n  [Password Policy]" -ForegroundColor Cyan
    $policy | Format-List
    return $policy
}

Export-ModuleMember -Function *

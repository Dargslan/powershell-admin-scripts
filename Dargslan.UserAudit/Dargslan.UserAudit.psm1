<#
.SYNOPSIS
    Audit local user accounts, detect inactive and risky accounts

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

function Get-UserAudit {
    [CmdletBinding()]
    param([int]$InactiveDays = 90, [switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan User Account Auditor                          ║
║  More tools: https://dargslan.com                       ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $users = Get-LocalUser
    $results = $users | ForEach-Object {
        $lastLogon = $_.LastLogon
        $inactive = if ($lastLogon) { ((Get-Date) - $lastLogon).TotalDays -gt $InactiveDays } else { $true }
        [PSCustomObject]@{ Name = $_.Name; Enabled = $_.Enabled; LastLogon = $(if ($lastLogon) { $lastLogon.ToString("yyyy-MM-dd") } else { "Never" }); PasswordExpires = $(if ($_.PasswordExpires) { $_.PasswordExpires.ToString("yyyy-MM-dd") } else { "Never" }); Inactive = $inactive; Source = $_.PrincipalSource }
    }
    $groups = Get-LocalGroup -ErrorAction SilentlyContinue
    $adminMembers = Get-LocalGroupMember -Group "Administrators" -ErrorAction SilentlyContinue
    Write-Host "`n[Users] Total: $($users.Count) | Enabled: $(($users | Where-Object Enabled).Count) | Admin group members: $($adminMembers.Count)" -ForegroundColor Yellow
    $inactiveUsers = $results | Where-Object { $_.Inactive -and $_.Enabled }
    if ($inactiveUsers.Count -gt 0) { Write-Host "[Warning] $($inactiveUsers.Count) enabled but inactive user(s):" -ForegroundColor Red }
    if ($Json) { $results | ConvertTo-Json } else { $results | Format-Table -AutoSize }
}

Export-ModuleMember -Function *

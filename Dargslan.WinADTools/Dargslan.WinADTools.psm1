<#
.SYNOPSIS
    Active Directory query toolkit — user search, group membership, OU browser, password expiry reporting, and stale object detection

.DESCRIPTION
    Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-ADHealthReport {
    <#
    .SYNOPSIS
        Quick Active Directory environment health check
    .DESCRIPTION
        Reports domain controller status, replication health, user statistics, and identifies stale objects.
        Part of Dargslan.WinADTools — https://dargslan.com
    #>
    [CmdletBinding()] param([int]$StaleDays = 90, [switch]$Json)

    Import-Module ActiveDirectory -ErrorAction SilentlyContinue
    if (-not (Get-Module ActiveDirectory -ErrorAction SilentlyContinue)) { Write-Warning "ActiveDirectory module not available. Install RSAT or run on a DC."; return }
    $domain = Get-ADDomain
    $report = [ordered]@{
        Domain = [PSCustomObject]@{ Name = $domain.DNSRoot; NetBIOS = $domain.NetBIOSName; Forest = $domain.Forest; FunctionalLevel = $domain.DomainMode; PDCEmulator = $domain.PDCEmulator; InfrastructureMaster = $domain.InfrastructureMaster }
        DomainControllers = Get-ADDomainController -Filter * | Select-Object Name, IPv4Address, Site, OperatingSystem, IsGlobalCatalog, IsReadOnly, Enabled
        UserStats = [PSCustomObject]@{
            TotalUsers = (Get-ADUser -Filter * | Measure-Object).Count
            EnabledUsers = (Get-ADUser -Filter {Enabled -eq $true} | Measure-Object).Count
            DisabledUsers = (Get-ADUser -Filter {Enabled -eq $false} | Measure-Object).Count
            LockedOut = (Search-ADAccount -LockedOut | Measure-Object).Count
            PasswordExpired = (Search-ADAccount -PasswordExpired | Measure-Object).Count
            NeverExpires = (Search-ADAccount -PasswordNeverExpires | Measure-Object).Count
            StaleUsers = (Get-ADUser -Filter {Enabled -eq $true} -Properties LastLogonDate | Where-Object { $_.LastLogonDate -and $_.LastLogonDate -lt (Get-Date).AddDays(-$StaleDays) } | Measure-Object).Count
        }
        GroupStats = [PSCustomObject]@{
            TotalGroups = (Get-ADGroup -Filter * | Measure-Object).Count
            EmptyGroups = (Get-ADGroup -Filter * | Where-Object { (Get-ADGroupMember $_ -ErrorAction SilentlyContinue | Measure-Object).Count -eq 0 } | Measure-Object).Count
        }
        Replication = Get-ADReplicationPartnerMetadata -Target $domain.DNSRoot -ErrorAction SilentlyContinue | Select-Object Server, Partner, LastReplicationAttempt, LastReplicationSuccess, ConsecutiveReplicationFailures
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [AD Health Report: $($report.Domain.Name)]" -ForegroundColor Cyan
    $report.Domain | Format-List
    $report.UserStats | Format-List
    $report.DomainControllers | Format-Table Name, IPv4Address, Site, IsGlobalCatalog -AutoSize
    return $report
}

Export-ModuleMember -Function *

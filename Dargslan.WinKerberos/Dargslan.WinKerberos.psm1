<#
.SYNOPSIS
    Kerberos authentication audit toolkit — ticket cache, SPN inventory, delegation analysis, and Kerberos policy validation
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-KerberosAudit {
    <#
    .SYNOPSIS
        Audit Kerberos authentication and ticket configuration
    .DESCRIPTION
        Part of Dargslan.WinKerberos (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $klist = klist 2>$null | Where-Object { $_ -match "\S" } | ForEach-Object { $_.Trim() }
    $report = [ordered]@{
        TicketCache = $klist
        SPNs = setspn -Q */* 2>$null | Where-Object { $_ -match "^\s+\S+/" } | ForEach-Object { $_.Trim() } | Select-Object -First 30
        KerberosPolicy = @{
            MaxTicketAge = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\Kerberos\Parameters" -ErrorAction SilentlyContinue).MaxTicketAge
            MaxRenewAge = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\Kerberos\Parameters" -ErrorAction SilentlyContinue).MaxRenewAge
            MaxServiceAge = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\Kerberos\Parameters" -ErrorAction SilentlyContinue).MaxServiceAge
        }
        DelegationSettings = Get-ADComputer -Filter {TrustedForDelegation -eq $true} -Properties TrustedForDelegation -ErrorAction SilentlyContinue | Select-Object Name, TrustedForDelegation
        Summary = [PSCustomObject]@{ CachedTickets = ($klist | Select-String "Server:" | Measure-Object).Count; SPNCount = 0 }
    }
    $report.Summary.SPNCount = ($report.SPNs | Measure-Object).Count
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Kerberos Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    if ($report.SPNs) { Write-Host "  SPNs (top 30):" -ForegroundColor Yellow; $report.SPNs | Select-Object -First 15 | ForEach-Object { Write-Host "    $_" } }
    return $report
}

Export-ModuleMember -Function *

<#
.SYNOPSIS
    Windows OS hardening assessment toolkit — CIS benchmark checks, STIG compliance, security baseline scoring, and hardening recommendations
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-HardeningAssessment {
    <#
    .SYNOPSIS
        Comprehensive OS hardening security assessment
    .DESCRIPTION
        Part of Dargslan.WinOSHarden (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        OS = Get-CimInstance Win32_OperatingSystem | Select-Object Caption, Version, BuildNumber, OSArchitecture, LastBootUpTime
        Checks = @()
    }
    $items = @(
        @{Cat="Account Policy";Name="Password min length >= 14";Check={(net accounts 2>$null | Where-Object {$_ -match "Minimum password length"} | ForEach-Object { [int]($_ -split ":\s+")[1] }) -ge 14}},
        @{Cat="Account Policy";Name="Password history >= 24";Check={(net accounts 2>$null | Where-Object {$_ -match "Length of password history"} | ForEach-Object { [int]($_ -split ":\s+")[1] }) -ge 24}},
        @{Cat="Account Policy";Name="Account lockout threshold <= 5";Check={$v = net accounts 2>$null | Where-Object {$_ -match "Lockout threshold"} | ForEach-Object { ($_ -split ":\s+")[1].Trim() }; $v -ne "Never" -and [int]$v -le 5}},
        @{Cat="Security Options";Name="UAC enabled";Check={(Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -ErrorAction SilentlyContinue).EnableLUA -eq 1}},
        @{Cat="Security Options";Name="UAC admin approval mode";Check={(Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -ErrorAction SilentlyContinue).FilterAdministratorToken -eq 1}},
        @{Cat="Security Options";Name="LDAP signing required";Check={(Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Services\NTDS\Parameters" -ErrorAction SilentlyContinue).LDAPServerIntegrity -eq 2}},
        @{Cat="Security Options";Name="SMB signing required";Check={(Get-SmbServerConfiguration -ErrorAction SilentlyContinue).RequireSecuritySignature}},
        @{Cat="Audit";Name="Logon events audited";Check={(auditpol /get /subcategory:"Logon" 2>$null) -match "Success"}},
        @{Cat="Audit";Name="Process creation audited";Check={(auditpol /get /subcategory:"Process Creation" 2>$null) -match "Success"}},
        @{Cat="Services";Name="Remote Registry disabled";Check={(Get-Service RemoteRegistry -ErrorAction SilentlyContinue).StartType -eq "Disabled"}},
        @{Cat="Services";Name="LLMNR disabled";Check={(Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" -ErrorAction SilentlyContinue).EnableMulticast -eq 0}},
        @{Cat="Network";Name="NetBIOS over TCP disabled";Check={$nics = Get-CimInstance Win32_NetworkAdapterConfiguration -Filter "IPEnabled=True"; ($nics | Where-Object {$_.TcpipNetbiosOptions -eq 2} | Measure-Object).Count -eq ($nics | Measure-Object).Count}},
        @{Cat="Network";Name="IPv6 link-local only";Check={(Get-NetAdapterBinding -ComponentId ms_tcpip6 -ErrorAction SilentlyContinue | Where-Object Enabled | Measure-Object).Count -eq 0}}
    )
    foreach ($item in $items) {
        $pass = try { & $item.Check } catch { $false }
        $report.Checks += [PSCustomObject]@{ Category=$item.Cat; Check=$item.Name; Status=if($pass){"PASS"}else{"FAIL"} }
    }
    $passed = ($report.Checks | Where-Object Status -eq "PASS" | Measure-Object).Count
    $total = ($report.Checks | Measure-Object).Count
    $report.Score = [PSCustomObject]@{
        Passed=$passed; Total=$total; Percent=[math]::Round($passed/$total*100,0)
        Grade = if($passed/$total -ge 0.8){"A"}elseif($passed/$total -ge 0.6){"B"}elseif($passed/$total -ge 0.4){"C"}else{"D"}
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [OS Hardening Assessment - 2026]" -ForegroundColor Cyan
    $report.OS | Format-List Caption, Version, BuildNumber
    $report.Checks | Group-Object Category | ForEach-Object {
        Write-Host "`n  $($_.Name):" -ForegroundColor Yellow
        $_.Group | ForEach-Object {
            $icon = if($_.Status -eq "PASS"){"[PASS]"}else{"[FAIL]"}
            Write-Host "    $icon $($_.Check)" -ForegroundColor $(if($_.Status -eq "PASS"){"Green"}else{"Red"})
        }
    }
    Write-Host "`n  Score: $($report.Score.Percent)% ($($report.Score.Grade)) — $passed/$total checks passed" -ForegroundColor $(if($report.Score.Percent -ge 80){"Green"}elseif($report.Score.Percent -ge 60){"Yellow"}else{"Red"})
    return $report
}

Export-ModuleMember -Function *

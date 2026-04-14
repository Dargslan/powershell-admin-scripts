<#
.SYNOPSIS
    IIS Crypto and cipher suite management toolkit — cipher order analysis, protocol compliance, key exchange algorithms, and best practice recommendations
.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-IISCryptoAudit {
    <#
    .SYNOPSIS
        Audit cipher suite order and protocol compliance
    .DESCRIPTION
        Reports cipher suite order, protocol enablement, key exchange algorithms, hash functions, and compliance with best practices.
        Part of Dargslan.WinIISCryptoAudit (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
$report = [ordered]@{
        CipherSuites = Get-TlsCipherSuite -ErrorAction SilentlyContinue | Select-Object Name, @{N="Protocols";E={$_.Protocols -join ","}}, CipherBlockChaining, Exchange, HashLength, KeyType
        CipherOrder = (Get-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Cryptography\Configuration\SSL\00010002" -ErrorAction SilentlyContinue).Functions -split ","
        Hashes = @("MD5","SHA","SHA256","SHA384","SHA512") | ForEach-Object {
            $key = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes\$_"
            [PSCustomObject]@{ Hash=$_; Enabled = if(Test-Path $key) { (Get-ItemProperty $key -ErrorAction SilentlyContinue).Enabled } else {"Default"} }
        }
        KeyExchange = @("Diffie-Hellman","PKCS","ECDH") | ForEach-Object {
            $key = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\KeyExchangeAlgorithms\$_"
            [PSCustomObject]@{ Algorithm=$_; Enabled = if(Test-Path $key) { (Get-ItemProperty $key -ErrorAction SilentlyContinue).Enabled } else {"Default"} }
        }
        Ciphers = @("AES 128/128","AES 256/256","DES 56/56","RC4 128/128","Triple DES 168") | ForEach-Object {
            $key = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\$_"
            [PSCustomObject]@{ Cipher=$_; Enabled = if(Test-Path $key) { (Get-ItemProperty $key -ErrorAction SilentlyContinue).Enabled } else {"Default"} }
        }
        Warnings = @()
    }
    $weakCiphers = $report.CipherSuites | Where-Object Name -match "RC4|DES|MD5|NULL|EXPORT"
    if ($weakCiphers) { $report.Warnings += "Weak cipher suites detected: $($weakCiphers.Count)" }
    $report.Summary = [PSCustomObject]@{ TotalCipherSuites = ($report.CipherSuites | Measure-Object).Count; WeakCiphers = ($weakCiphers | Measure-Object).Count }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [IIS Crypto Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    $report.Hashes | Format-Table -AutoSize
    $report.KeyExchange | Format-Table -AutoSize
    if ($report.Warnings) { $report.Warnings | ForEach-Object { Write-Host "  Warning: $_" -ForegroundColor Yellow } }
    return $report
}

Export-ModuleMember -Function *

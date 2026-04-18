<#
.SYNOPSIS
    Check SSL/TLS certificate validity for remote hosts

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

function Test-SSLCertificate {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Ssl Checker
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    param([string[]]$Hosts = @("dargslan.com","google.com")) ; foreach ($h in $Hosts) { try { $tcp = New-Object Net.Sockets.TcpClient($h, 443); $ssl = New-Object Net.Security.SslStream($tcp.GetStream()); $ssl.AuthenticateAsClient($h); $cert = $ssl.RemoteCertificate; $x509 = New-Object Security.Cryptography.X509Certificates.X509Certificate2($cert); $days = [math]::Round(($x509.NotAfter - (Get-Date)).TotalDays, 0); Write-Host "`n[$h]" -ForegroundColor $(if($days-gt30){"Green"}elseif($days-gt0){"Yellow"}else{"Red"}); Write-Host "  Subject: $($x509.Subject)"; Write-Host "  Expires: $($x509.NotAfter) ($days days)"; Write-Host "  Issuer: $($x509.Issuer)"; $ssl.Close(); $tcp.Close() } catch { Write-Host "`n[$h] Connection failed: $_" -ForegroundColor Red } }
}


Export-ModuleMember -Function *

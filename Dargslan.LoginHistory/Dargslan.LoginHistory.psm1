<#
.SYNOPSIS
    Track user login and logoff history from event logs

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

function Get-LoginHistory {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Login History
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $logins = Get-WinEvent -FilterHashtable @{LogName="Security"; Id=@(4624,4634)} -MaxEvents 50 -ErrorAction SilentlyContinue | ForEach-Object { [PSCustomObject]@{Time=$_.TimeCreated; Event=if($_.Id-eq4624){"Login"}else{"Logoff"}; Account=$_.Properties[5].Value; LogonType=$_.Properties[8].Value; Source=$_.Properties[18].Value} }; Write-Host "`n[Login History]" -ForegroundColor Yellow; if ($Json) { $logins | ConvertTo-Json } else { $logins | Format-Table -AutoSize }
}


Export-ModuleMember -Function *

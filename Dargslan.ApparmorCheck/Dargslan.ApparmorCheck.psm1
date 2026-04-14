<#
.SYNOPSIS
    Check Windows Defender Application Control and AppLocker policies

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

function Get-AppControlStatus {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Application Control Checker                   ║
║  More tools: https://dargslan.com                       ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $results = @()
    try {
        $applocker = Get-AppLockerPolicy -Effective -ErrorAction SilentlyContinue
        if ($applocker) {
            foreach ($rule in $applocker.RuleCollections) {
                $results += [PSCustomObject]@{ Type = $rule.RuleCollectionType; Count = $rule.Count; Enforcement = $rule.EnforcementMode }
            }
        }
    } catch { $results += [PSCustomObject]@{ Type = "AppLocker"; Count = 0; Enforcement = "Not configured" } }
    $defender = Get-MpComputerStatus -ErrorAction SilentlyContinue
    if ($defender) {
        Write-Host "`nWindows Defender Status:" -ForegroundColor Yellow
        Write-Host "  Real-time Protection: $($defender.RealTimeProtectionEnabled)" -ForegroundColor $(if ($defender.RealTimeProtectionEnabled) { 'Green' } else { 'Red' })
        Write-Host "  Antivirus Enabled: $($defender.AntivirusEnabled)"
    }
    if ($Json) { $results | ConvertTo-Json } else { $results | Format-Table -AutoSize }
}

Export-ModuleMember -Function *

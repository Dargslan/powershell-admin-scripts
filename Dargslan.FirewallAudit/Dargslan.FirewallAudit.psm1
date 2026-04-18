<#
.SYNOPSIS
    Audit Windows Firewall rules and network security policies

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

function Get-FirewallAudit {
    [CmdletBinding()]
    param([switch]$InboundOnly, [switch]$EnabledOnly, [switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Firewall Auditor                              ║
║  More tools: https://dargslan.com                       ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $profiles = Get-NetFirewallProfile -ErrorAction SilentlyContinue
    Write-Host "`n[Firewall Profiles]" -ForegroundColor Yellow
    foreach ($p in $profiles) { Write-Host "  $($p.Name): Enabled=$($p.Enabled) DefaultInbound=$($p.DefaultInboundAction) DefaultOutbound=$($p.DefaultOutboundAction)" -ForegroundColor $(if ($p.Enabled) { 'Green' } else { 'Red' }) }
    $rules = Get-NetFirewallRule -ErrorAction SilentlyContinue
    if ($InboundOnly) { $rules = $rules | Where-Object Direction -eq 'Inbound' }
    if ($EnabledOnly) { $rules = $rules | Where-Object Enabled -eq 'True' }
    $results = $rules | Select-Object -First 50 DisplayName, Direction, Action, Enabled, Profile | Sort-Object Direction, DisplayName
    Write-Host "`n[Rules] Total: $($rules.Count) | Showing first 50" -ForegroundColor Yellow
    if ($Json) { $results | ConvertTo-Json } else { $results | Format-Table -AutoSize }
}

Export-ModuleMember -Function *

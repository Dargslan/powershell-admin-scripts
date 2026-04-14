<#
.SYNOPSIS
    Check Windows Mandatory Integrity Control and security levels

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

function Get-IntegrityLevels {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Selinux Check
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $procs = Get-Process | Select-Object -First 20 ProcessName, Id; Write-Host "`n[Integrity Control]" -ForegroundColor Yellow; $uac = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -ErrorAction SilentlyContinue); Write-Host "  UAC Enabled: $($uac.EnableLUA -eq 1)"; Write-Host "  Consent Prompt: $($uac.ConsentPromptBehaviorAdmin)"; Write-Host "  Secure Desktop: $($uac.PromptOnSecureDesktop -eq 1)"
}


Export-ModuleMember -Function *

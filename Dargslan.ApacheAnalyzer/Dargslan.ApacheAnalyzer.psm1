<#
.SYNOPSIS
    Analyze IIS/Apache web server configuration on Windows

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

function Get-WebServerStatus {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Web Server Analyzer                           ║
║  More tools: https://dargslan.com                       ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $results = @()
    try {
        Import-Module WebAdministration -ErrorAction SilentlyContinue
        $sites = Get-Website -ErrorAction SilentlyContinue
        foreach ($site in $sites) {
            $results += [PSCustomObject]@{ Name = $site.Name; State = $site.State; Bindings = ($site.Bindings.Collection | ForEach-Object { $_.bindingInformation }) -join ", "; PhysicalPath = $site.PhysicalPath }
        }
    } catch { $results += [PSCustomObject]@{ Name = "IIS Not Available"; State = "N/A"; Bindings = "N/A"; PhysicalPath = "N/A" } }
    $httpSvc = Get-Service -Name "W3SVC" -ErrorAction SilentlyContinue
    Write-Host "`n[Web Server] IIS Service: $($httpSvc.Status)" -ForegroundColor $(if ($httpSvc.Status -eq 'Running') { 'Green' } else { 'Red' })
    if ($Json) { $results | ConvertTo-Json } else { $results | Format-Table -AutoSize }
}

Export-ModuleMember -Function *

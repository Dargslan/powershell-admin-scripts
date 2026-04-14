<#
.SYNOPSIS
    Audit file and folder ACL permissions on Windows systems

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

function Get-AclReport {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$false)][string]$Path = ".",
        [switch]$Recurse,
        [switch]$Json
    )
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan ACL Check — File Permission Auditor           ║
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $items = if ($Recurse) { Get-ChildItem -Path $Path -Recurse -ErrorAction SilentlyContinue } else { Get-ChildItem -Path $Path -ErrorAction SilentlyContinue }
    $results = @()
    foreach ($item in $items) {
        try {
            $acl = Get-Acl -Path $item.FullName
            foreach ($access in $acl.Access) {
                $results += [PSCustomObject]@{
                    Path = $item.FullName
                    Identity = $access.IdentityReference.ToString()
                    Rights = $access.FileSystemRights.ToString()
                    Type = $access.AccessControlType.ToString()
                    Inherited = $access.IsInherited
                }
            }
        } catch { }
    }
    if ($Json) { $results | ConvertTo-Json -Depth 5 } else { $results | Format-Table -AutoSize }
}

function Find-OpenPermissions {
    [CmdletBinding()]
    param([Parameter(Mandatory=$true)][string]$Path)
    Write-Host "`n[ACL Audit] Scanning for overly permissive ACLs..." -ForegroundColor Yellow
    $items = Get-ChildItem -Path $Path -Recurse -ErrorAction SilentlyContinue
    $warnings = @()
    foreach ($item in $items) {
        try {
            $acl = Get-Acl -Path $item.FullName
            foreach ($access in $acl.Access) {
                if ($access.IdentityReference -match "Everyone|Users" -and $access.FileSystemRights -match "FullControl|Modify") {
                    $warnings += [PSCustomObject]@{ Path = $item.FullName; Identity = $access.IdentityReference.ToString(); Rights = $access.FileSystemRights.ToString() }
                }
            }
        } catch { }
    }
    if ($warnings.Count -eq 0) { Write-Host "No overly permissive ACLs found." -ForegroundColor Green }
    else { Write-Host "$($warnings.Count) warning(s) found:" -ForegroundColor Red; $warnings | Format-Table -AutoSize }
}

Export-ModuleMember -Function *

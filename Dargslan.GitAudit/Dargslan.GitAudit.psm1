<#
.SYNOPSIS
    Audit Git repositories for secrets and security issues

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

function Invoke-GitAudit {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Git Audit
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $gitCmd = Get-Command git -ErrorAction SilentlyContinue; if (-not $gitCmd) { Write-Host "Git not installed" -ForegroundColor Red; return }; $repos = Get-ChildItem -Path . -Directory -Recurse -Depth 2 -Filter ".git" -Hidden -ErrorAction SilentlyContinue; Write-Host "`n[Git Audit] Found $($repos.Count) repo(s)" -ForegroundColor Yellow; foreach ($r in $repos) { $repoDir = Split-Path $r.FullName -Parent; $name = Split-Path $repoDir -Leaf; $branch = git -C $repoDir branch --show-current 2>$null; $status = git -C $repoDir status --porcelain 2>$null; Write-Host "  $name ($branch) - $(if($status){"$(@($status).Count) changes"}else{"clean"})" -ForegroundColor $(if($status){"Yellow"}else{"Green"}) }
}


Export-ModuleMember -Function *

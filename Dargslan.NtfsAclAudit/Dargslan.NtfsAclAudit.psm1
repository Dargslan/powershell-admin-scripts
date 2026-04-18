<#
.SYNOPSIS
    Audit NTFS ACLs on a directory tree: Everyone / Authenticated Users excessive rights, broken inheritance, orphaned SIDs.

.DESCRIPTION
    Part of the Dargslan Windows Admin Tools collection.
    Free Cheat Sheet: https://dargslan.com/cheat-sheets/ntfs-acl-permission-audit-2026
    Full Guide:       https://dargslan.com/blog/ntfs-acl-permission-audit-powershell-2026
    More tools:       https://dargslan.com

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

$script:Banner = @"
+----------------------------------------------------------+
|  Dargslan NTFS ACL Audit                                
|  https://dargslan.com - Free cheat sheets & eBooks       |
+----------------------------------------------------------+
"@

function Get-DargslanNtfsPermissions {
    <#
    .SYNOPSIS
        Recursive ACL inventory of a path (top N levels).
    #>
    [CmdletBinding()]
    param([Parameter(Mandatory)][string]$Path,[int]$Depth = 2)
    $root = Get-Item -LiteralPath $Path
    $items = @($root) + @(Get-ChildItem -LiteralPath $Path -Directory -Recurse -Depth $Depth -ErrorAction SilentlyContinue)
    foreach ($i in $items) {
        try { $acl = Get-Acl -LiteralPath $i.FullName -ErrorAction Stop } catch { continue }
        foreach ($ace in $acl.Access) {
            [pscustomobject]@{
                Path        = $i.FullName
                Identity    = $ace.IdentityReference.Value
                Rights      = $ace.FileSystemRights
                AccessType  = $ace.AccessControlType
                IsInherited = $ace.IsInherited
                Owner       = $acl.Owner
            }
        }
    }
}

function Get-DargslanEveryoneAcls {
    <#
    .SYNOPSIS
        Find ACEs granting Everyone / Authenticated Users excessive rights.
    #>
    [CmdletBinding()]
    param([Parameter(Mandatory)][string]$Path,[int]$Depth = 3)
    Get-DargslanNtfsPermissions -Path $Path -Depth $Depth |
        Where-Object {
            $_.AccessType -eq 'Allow' -and
            $_.Identity -match 'Everyone|Authenticated Users|BUILTIN\\\\Users|INTERACTIVE' -and
            $_.Rights   -match 'FullControl|Modify|Write'
        }
}

function Get-DargslanBrokenAclInheritance {
    <#
    .SYNOPSIS
        Find folders with inheritance disabled (likely a one-off override).
    #>
    [CmdletBinding()]
    param([Parameter(Mandatory)][string]$Path,[int]$Depth = 3)
    Get-ChildItem -LiteralPath $Path -Directory -Recurse -Depth $Depth -ErrorAction SilentlyContinue | ForEach-Object {
        try {
            $acl = Get-Acl -LiteralPath $_.FullName -ErrorAction Stop
            if ($acl.AreAccessRulesProtected) {
                [pscustomobject]@{
                    Path  = $_.FullName
                    Owner = $acl.Owner
                    AceCount = $acl.Access.Count
                }
            }
        } catch {}
    }
}

function Get-DargslanOrphanSidAcls {
    <#
    .SYNOPSIS
        Find ACEs whose IdentityReference still resolves to a raw SID.
    #>
    [CmdletBinding()]
    param([Parameter(Mandatory)][string]$Path,[int]$Depth = 3)
    Get-DargslanNtfsPermissions -Path $Path -Depth $Depth |
        Where-Object Identity -match '^S-1-5-' |
        Select Path, Identity, Rights, AccessType, IsInherited
}

function Get-DargslanNtfsAclAuditReport {
    <#
    .SYNOPSIS
        Combined NTFS audit with PASS / WARN / FAIL verdict.
    #>
    [CmdletBinding()]
    param([Parameter(Mandatory)][string]$Path,[int]$Depth = 3)
    $ev   = @(Get-DargslanEveryoneAcls -Path $Path -Depth $Depth)
    $br   = @(Get-DargslanBrokenAclInheritance -Path $Path -Depth $Depth)
    $orph = @(Get-DargslanOrphanSidAcls -Path $Path -Depth $Depth)
    $score = 0
    if ($ev.Count   -eq 0) { $score++ }
    if ($br.Count   -le 5) { $score++ }
    if ($orph.Count -eq 0) { $score++ }
    $verdict = if ($score -eq 3) { 'PASS' } elseif ($score -ge 1) { 'WARN' } else { 'FAIL' }
    [pscustomobject]@{
        Path           = $Path
        EveryoneFindings = $ev
        BrokenInherit    = $br
        OrphanSids       = $orph
        EveryoneCount    = $ev.Count
        BrokenCount      = $br.Count
        OrphanCount      = $orph.Count
        Score            = $score
        Verdict          = $verdict
        TimeStamp        = (Get-Date).ToString('s')
    }
}

function Export-DargslanNtfsAclAuditReport {
    <#
    .SYNOPSIS
        Export the NTFS audit to HTML and JSON.
    #>
    [CmdletBinding()]
    param([Parameter(Mandatory)][string]$Path,[int]$Depth = 3,[string]$OutDir = (Join-Path $env:TEMP 'DargslanNtfsAudit'))
    if (-not (Test-Path $OutDir)) { New-Item -Type Directory -Path $OutDir | Out-Null }
    $r = Get-DargslanNtfsAclAuditReport -Path $Path -Depth $Depth
    $base = 'ntfs-' + ([System.IO.Path]::GetInvalidFileNameChars() | ForEach-Object { $Path = $Path.Replace($_, '_') } ; $Path -replace '[\\\\:]','_')
    $json = Join-Path $OutDir ($base + '.json')
    $html = Join-Path $OutDir ($base + '.html')
    $r | ConvertTo-Json -Depth 6 | Set-Content $json -Encoding UTF8
    $body  = "<h1>NTFS ACL Audit - $($r.Path)</h1>"
    $body += "<p>Verdict: <b>$($r.Verdict)</b> ($($r.Score)/3)</p>"
    $body += '<h2>Everyone / Auth Users excessive</h2>' + ($r.EveryoneFindings | ConvertTo-Html -Fragment)
    $body += '<h2>Broken inheritance</h2>' + ($r.BrokenInherit | ConvertTo-Html -Fragment)
    $body += '<h2>Orphan SIDs</h2>'        + ($r.OrphanSids | ConvertTo-Html -Fragment)
    ConvertTo-Html -Body $body -Title 'NTFS ACL Audit' | Set-Content $html -Encoding UTF8
    [pscustomobject]@{ Json = $json; Html = $html; Verdict = $r.Verdict }
}


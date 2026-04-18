<#
.SYNOPSIS
    Audit Windows persistence locations: registry Run keys, scheduled tasks and unsigned autorun binaries. JSON / HTML report.

.DESCRIPTION
    Part of the Dargslan Windows Admin Tools collection.
    Free Cheat Sheet: https://dargslan.com/cheat-sheets/windows-persistence-audit-2026
    Full Guide:       https://dargslan.com/blog/windows-persistence-audit-powershell-2026
    More tools:       https://dargslan.com

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

$script:Banner = @"
+----------------------------------------------------------+
|  Dargslan Windows Persistence Audit                     
|  https://dargslan.com - Free cheat sheets & eBooks       |
+----------------------------------------------------------+
"@

function Get-DargslanRunKeys {
    <#
    .SYNOPSIS
        Read every Run / RunOnce registry key for HKLM and HKCU.
    #>
    [CmdletBinding()]
    param()
    $keys = @(
        'HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Run',
        'HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\RunOnce',
        'HKLM:\\Software\\Wow6432Node\\Microsoft\\Windows\\CurrentVersion\\Run',
        'HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Run',
        'HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\RunOnce'
    )
    foreach ($k in $keys) {
        if (-not (Test-Path $k)) { continue }
        $item = Get-ItemProperty -Path $k
        $item.PSObject.Properties |
            Where-Object { $_.Name -notmatch '^PS' -and $_.Name -notin 'PSPath','PSParentPath','PSChildName','PSDrive','PSProvider' } |
            ForEach-Object {
                [pscustomobject]@{
                    Hive    = $k
                    Name    = $_.Name
                    Command = $_.Value
                }
            }
    }
}

function Get-DargslanScheduledTasks {
    <#
    .SYNOPSIS
        Return every enabled scheduled task with author, run-as account and action.
    #>
    [CmdletBinding()]
    param()
    Get-ScheduledTask | Where-Object State -ne 'Disabled' | ForEach-Object {
        $info = Get-ScheduledTaskInfo -TaskName $_.TaskName -TaskPath $_.TaskPath
        [pscustomobject]@{
            TaskName  = $_.TaskName
            Path      = $_.TaskPath
            State     = $_.State
            Author    = $_.Author
            RunAs     = $_.Principal.UserId
            RunLevel  = $_.Principal.RunLevel
            Action    = ($_.Actions | ForEach-Object { $_.Execute + ' ' + $_.Arguments }) -join ';'
            LastRun   = $info.LastRunTime
            NextRun   = $info.NextRunTime
        }
    }
}

function Get-DargslanUnsignedAutoruns {
    <#
    .SYNOPSIS
        Classify Run-key + scheduled-task binaries by Authenticode signature.
    #>
    [CmdletBinding()]
    param()
    $paths = @()
    Get-DargslanRunKeys | ForEach-Object {
        $cmd = $_.Command -replace '"',''
        $bin = ($cmd -split ' ')[0]
        if (Test-Path $bin) { $paths += [pscustomobject]@{ Source = 'RunKey'; Binary = $bin } }
    }
    Get-DargslanScheduledTasks | ForEach-Object {
        $bin = ($_.Action -split ' ')[0] -replace '"',''
        if (Test-Path $bin) { $paths += [pscustomobject]@{ Source = 'Task'; Binary = $bin } }
    }
    $paths | Sort Binary -Unique | ForEach-Object {
        $sig = Get-AuthenticodeSignature $_.Binary -ErrorAction SilentlyContinue
        [pscustomobject]@{
            Source   = $_.Source
            Binary   = $_.Binary
            Status   = $sig.Status
            Signer   = $sig.SignerCertificate.Subject
        }
    }
}

function Get-DargslanPersistenceAuditReport {
    <#
    .SYNOPSIS
        Combined persistence audit with PASS / WARN / FAIL verdict.
    #>
    [CmdletBinding()]
    param()
    $run    = @(Get-DargslanRunKeys)
    $tasks  = @(Get-DargslanScheduledTasks)
    $auto   = @(Get-DargslanUnsignedAutoruns)
    $unsig  = @($auto | Where-Object Status -ne 'Valid')
    $nonMs  = @($auto | Where-Object { $_.Signer -and $_.Signer -notmatch 'Microsoft' })
    $score = 0
    if ($unsig.Count -le 2) { $score++ }
    if ($nonMs.Count -le 10) { $score++ }
    if ($run.Count -gt 0)    { $score++ }
    $verdict = if ($score -eq 3) { 'PASS' } elseif ($score -ge 1) { 'WARN' } else { 'FAIL' }
    [pscustomobject]@{
        ComputerName = $env:COMPUTERNAME
        RunKeyCount  = $run.Count
        TaskCount    = $tasks.Count
        UnsignedCount= $unsig.Count
        NonMsCount   = $nonMs.Count
        RunKeys      = $run
        Tasks        = $tasks
        Autoruns     = $auto
        Score        = $score
        Verdict      = $verdict
        TimeStamp    = (Get-Date).ToString('s')
    }
}

function Export-DargslanPersistenceAuditReport {
    <#
    .SYNOPSIS
        Export the audit to HTML and JSON.
    #>
    [CmdletBinding()]
    param([string]$OutDir = (Join-Path $env:TEMP 'DargslanPersistenceAudit'))
    if (-not (Test-Path $OutDir)) { New-Item -Type Directory -Path $OutDir | Out-Null }
    $r = Get-DargslanPersistenceAuditReport
    $json = Join-Path $OutDir ('persist-' + $env:COMPUTERNAME + '.json')
    $html = Join-Path $OutDir ('persist-' + $env:COMPUTERNAME + '.html')
    $r | ConvertTo-Json -Depth 6 | Set-Content $json -Encoding UTF8
    $body  = "<h1>Persistence Audit - $($r.ComputerName)</h1>"
    $body += "<p>Verdict: <b>$($r.Verdict)</b> ($($r.Score)/3)</p>"
    $body += '<h2>Run Keys</h2>' + ($r.RunKeys  | ConvertTo-Html -Fragment)
    $body += '<h2>Tasks</h2>'    + ($r.Tasks    | ConvertTo-Html -Fragment)
    $body += '<h2>Autoruns + signature</h2>' + ($r.Autoruns | ConvertTo-Html -Fragment)
    ConvertTo-Html -Body $body -Title 'Persistence Audit' | Set-Content $html -Encoding UTF8
    [pscustomobject]@{ Json = $json; Html = $html; Verdict = $r.Verdict }
}


<#
.SYNOPSIS
    Bulk-generate and digitally sign Remote Desktop Protocol (.rdp) files.

.DESCRIPTION
    Part of the Dargslan Windows Admin Tools collection.
    Wraps rdpsign.exe with safe defaults so you can mass-produce per-user
    signed .rdp files from a CSV + template in one call.

    More tools and resources at https://dargslan.com
    Free Cheat Sheet:    https://dargslan.com/cheat-sheets/rdpsign-bulk-signing-2026
    Full Guide:          https://dargslan.com/blog/bulk-rdp-file-signing-rdpsign-powershell-2026
    Linux & DevOps Books: https://dargslan.com/books

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Write-DargslanBanner {
    $banner = @"
+----------------------------------------------------------+
|  Dargslan RdpSign - Bulk RDP File Signing Toolkit        |
|  More tools:    https://dargslan.com                     |
|  Cheat Sheets:  https://dargslan.com/cheat-sheets        |
+----------------------------------------------------------+
"@
    Write-Host $banner -ForegroundColor Cyan
}

function Get-DargslanCodeSigningCert {
    <#
    .SYNOPSIS
        List all code-signing certificates available in the current user
        and local machine certificate stores.
    .EXAMPLE
        Get-DargslanCodeSigningCert
    #>
    [CmdletBinding()]
    param(
        [switch]$IncludeExpired
    )

    Write-DargslanBanner

    # Collect from both stores; LocalMachine may need admin to enumerate
    $stores = @('Cert:\CurrentUser\My','Cert:\LocalMachine\My')
    $results = @()
    foreach ($store in $stores) {
        try {
            $certs = Get-ChildItem -Path $store -CodeSigningCert -ErrorAction SilentlyContinue
            foreach ($c in $certs) {
                if (-not $IncludeExpired -and $c.NotAfter -lt (Get-Date)) { continue }
                $results += [PSCustomObject]@{
                    Store      = $store
                    Subject    = $c.Subject
                    Thumbprint = $c.Thumbprint
                    NotAfter   = $c.NotAfter
                    Expired    = ($c.NotAfter -lt (Get-Date))
                }
            }
        } catch {
            # Likely permission issue on LocalMachine without admin - skip silently
        }
    }

    if (-not $results) {
        Write-Warning "No code-signing certificates found. Issue one from your AD CS code-signing template, or import a public CA cert."
        return
    }
    $results | Sort-Object Store, NotAfter
}

function Test-DargslanRdpSignature {
    <#
    .SYNOPSIS
        Dry-run signature test using rdpsign.exe /l. Does not modify the file.
    .EXAMPLE
        Test-DargslanRdpSignature -Thumbprint ABC... -Path C:\RDP\out\jsmith.rdp
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)][string]$Thumbprint,
        [Parameter(Mandatory=$true)][string]$Path
    )

    # Strip any spaces a user might have copied with the thumbprint
    $Thumbprint = $Thumbprint -replace '\s',''

    if (-not (Test-Path -LiteralPath $Path)) {
        Write-Error "RDP file not found: $Path"
        return
    }

    $rdpsign = (Get-Command rdpsign.exe -ErrorAction SilentlyContinue)
    if (-not $rdpsign) {
        Write-Error "rdpsign.exe not found on PATH. It ships with Windows."
        return
    }

    $full = (Resolve-Path -LiteralPath $Path).Path
    & rdpsign.exe /sha256 $Thumbprint /l $full | Out-Null
    $exit = $LASTEXITCODE

    [PSCustomObject]@{
        Path       = $full
        Thumbprint = $Thumbprint
        ExitCode   = $exit
        Success    = ($exit -eq 0)
    }
}

function _Expand-Template {
    # Internal helper - expand __KEY__ placeholders from a hashtable
    param(
        [string]$Template,
        [hashtable]$Values
    )
    $out = $Template
    foreach ($k in $Values.Keys) {
        $token = "__${k}__"
        $out = $out.Replace($token, [string]$Values[$k])
    }
    return $out
}

function New-DargslanSignedRdp {
    <#
    .SYNOPSIS
        Generate a single .rdp file from a template, replace placeholders,
        and digitally sign it with rdpsign.exe.
    .EXAMPLE
        New-DargslanSignedRdp `
            -TemplatePath C:\RDP\template.rdp `
            -OutFile      C:\RDP\out\jsmith.rdp `
            -Values       @{ USERNAME = 'DOMAIN\jsmith' } `
            -Thumbprint   ABCDEF1234567890ABCDEF1234567890ABCDEF12
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)][string]$TemplatePath,
        [Parameter(Mandatory=$true)][string]$OutFile,
        [Parameter(Mandatory=$true)][hashtable]$Values,
        [Parameter(Mandatory=$true)][string]$Thumbprint,
        [switch]$WhatIfSign  # if set, only validates the cert (rdpsign /l) and does not sign
    )

    $Thumbprint = $Thumbprint -replace '\s',''

    if (-not (Test-Path -LiteralPath $TemplatePath)) {
        Write-Error "Template not found: $TemplatePath"; return
    }

    # Expand placeholders
    $template = Get-Content -LiteralPath $TemplatePath -Raw
    $content  = _Expand-Template -Template $template -Values $Values

    # Ensure output directory exists
    $outDir = Split-Path -Parent $OutFile
    if ($outDir -and -not (Test-Path -LiteralPath $outDir)) {
        New-Item -ItemType Directory -Force -Path $outDir | Out-Null
    }

    # rdpsign expects ASCII-encoded .rdp
    Set-Content -LiteralPath $OutFile -Value $content -Encoding ASCII
    $full = (Resolve-Path -LiteralPath $OutFile).Path

    if ($WhatIfSign) {
        & rdpsign.exe /sha256 $Thumbprint /l $full | Out-Null
    } else {
        & rdpsign.exe /sha256 $Thumbprint $full | Out-Null
    }
    $exit = $LASTEXITCODE

    [PSCustomObject]@{
        OutFile  = $full
        ExitCode = $exit
        Signed   = (-not $WhatIfSign -and $exit -eq 0)
        Tested   = ($WhatIfSign -and $exit -eq 0)
    }
}

function New-DargslanSignedRdpBatch {
    <#
    .SYNOPSIS
        Bulk-generate + sign one .rdp per row of a CSV using a template.
    .DESCRIPTION
        The CSV must contain at least an OutputName column. Every other
        column is treated as a placeholder: column "UserName" expands the
        token __USERNAME__, "Gateway" expands __GATEWAY__, and so on
        (column names are upper-cased to form the token).
    .EXAMPLE
        New-DargslanSignedRdpBatch `
            -TemplatePath C:\RDP\template.rdp `
            -CsvPath      C:\RDP\users.csv `
            -OutDir       C:\RDP\out `
            -Thumbprint   ABCDEF1234567890ABCDEF1234567890ABCDEF12
    #>
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)][string]$TemplatePath,
        [Parameter(Mandatory=$true)][string]$CsvPath,
        [Parameter(Mandatory=$true)][string]$OutDir,
        [Parameter(Mandatory=$true)][string]$Thumbprint,
        [string]$OutputColumn = 'OutputName',
        [switch]$BatchSign  # build all files first, then sign in one rdpsign call (faster for large lists)
    )

    Write-DargslanBanner
    $Thumbprint = $Thumbprint -replace '\s',''

    if (-not (Test-Path -LiteralPath $TemplatePath)) { Write-Error "Template not found: $TemplatePath"; return }
    if (-not (Test-Path -LiteralPath $CsvPath))      { Write-Error "CSV not found: $CsvPath"; return }

    if (-not (Test-Path -LiteralPath $OutDir)) {
        New-Item -ItemType Directory -Force -Path $OutDir | Out-Null
    }

    $template = Get-Content -LiteralPath $TemplatePath -Raw
    $rows     = Import-Csv -LiteralPath $CsvPath
    if (-not $rows) { Write-Warning "CSV is empty: $CsvPath"; return }

    $generatedFiles = @()
    $results = @()

    foreach ($row in $rows) {
        $outName = $row.$OutputColumn
        if (-not $outName) {
            Write-Warning "Row missing $OutputColumn column - skipping"
            continue
        }

        # Build the placeholder map from every property except OutputName
        $values = @{}
        foreach ($prop in $row.PSObject.Properties) {
            if ($prop.Name -eq $OutputColumn) { continue }
            $values[$prop.Name.ToUpperInvariant()] = $prop.Value
        }

        $content = _Expand-Template -Template $template -Values $values
        $outFile = Join-Path $OutDir $outName
        Set-Content -LiteralPath $outFile -Value $content -Encoding ASCII
        $generatedFiles += (Resolve-Path -LiteralPath $outFile).Path

        if (-not $BatchSign) {
            & rdpsign.exe /sha256 $Thumbprint (Resolve-Path -LiteralPath $outFile).Path | Out-Null
            $exit = $LASTEXITCODE
            $results += [PSCustomObject]@{
                OutFile = $outFile
                Signed  = ($exit -eq 0)
                ExitCode = $exit
            }
            if ($exit -eq 0) {
                Write-Host ("OK    {0}" -f $outFile) -ForegroundColor Green
            } else {
                Write-Host ("FAIL  {0} (exit {1})" -f $outFile, $exit) -ForegroundColor Red
            }
        }
    }

    if ($BatchSign -and $generatedFiles.Count -gt 0) {
        # One rdpsign call for all files - fastest path for hundreds of users
        & rdpsign.exe /sha256 $Thumbprint @generatedFiles | Out-Null
        $exit = $LASTEXITCODE
        foreach ($f in $generatedFiles) {
            $results += [PSCustomObject]@{
                OutFile = $f
                Signed  = ($exit -eq 0)
                ExitCode = $exit
            }
        }
        if ($exit -eq 0) {
            Write-Host ("Batch sign OK - {0} files signed" -f $generatedFiles.Count) -ForegroundColor Green
        } else {
            Write-Host ("Batch sign FAILED (exit {0})" -f $exit) -ForegroundColor Red
        }
    }

    $results
}

Export-ModuleMember -Function Get-DargslanCodeSigningCert, Test-DargslanRdpSignature, New-DargslanSignedRdp, New-DargslanSignedRdpBatch

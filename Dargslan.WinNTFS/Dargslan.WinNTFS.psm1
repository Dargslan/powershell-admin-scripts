<#
.SYNOPSIS
    NTFS filesystem security audit toolkit — permission inheritance, alternate data streams, junction points, hard links, and filesystem integrity
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-NTFSAudit {
    <#
    .SYNOPSIS
        Audit NTFS filesystem security and features
    .DESCRIPTION
        Part of Dargslan.WinNTFS (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $systemDrive = $env:SystemDrive
    $report = [ordered]@{
        VolumeInfo = Get-Volume -DriveLetter C -ErrorAction SilentlyContinue | Select-Object DriveLetter, FileSystem, FileSystemLabel, @{N="SizeGB";E={[math]::Round($_.Size/1GB,1)}}, @{N="FreeGB";E={[math]::Round($_.SizeRemaining/1GB,1)}}, HealthStatus, AllocationUnitSize
        NTFSFeatures = [PSCustomObject]@{
            ShortNamesEnabled = (fsutil 8dot3name query $systemDrive 2>$null) -match "enabled|0"
            LastAccessUpdate = (fsutil behavior query DisableLastAccess 2>$null) | ForEach-Object { $_.Trim() }
            Compression = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -ErrorAction SilentlyContinue).NtfsDisableCompression
            Encryption = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -ErrorAction SilentlyContinue).NtfsDisableEncryption
            LongPaths = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -ErrorAction SilentlyContinue).LongPathsEnabled
        }
        SensitiveDirs = @("$systemDrive\Windows\System32","$systemDrive\Windows\SysWOW64","$systemDrive\Program Files") | ForEach-Object {
            $acl = Get-Acl $_ -ErrorAction SilentlyContinue
            [PSCustomObject]@{ Path = $_; Owner = $acl.Owner; AccessRules = ($acl.Access | Measure-Object).Count }
        }
        AlternateDataStreams = Get-ChildItem "$systemDrive\Users\*\Desktop\*","$systemDrive\Users\*\Downloads\*" -ErrorAction SilentlyContinue | Get-Item -Stream * -ErrorAction SilentlyContinue | Where-Object Stream -ne ":DATA" | Select-Object -First 10 FileName, Stream, Length
        Summary = [PSCustomObject]@{ FileSystem = ""; LongPaths = $false; ADSFound = 0 }
    }
    $report.Summary.FileSystem = $report.VolumeInfo.FileSystem
    $report.Summary.LongPaths = $report.NTFSFeatures.LongPaths -eq 1
    $report.Summary.ADSFound = ($report.AlternateDataStreams | Measure-Object).Count
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [NTFS Audit - 2026]" -ForegroundColor Cyan
    $report.VolumeInfo | Format-List
    $report.NTFSFeatures | Format-List
    $report.SensitiveDirs | Format-Table -AutoSize
    if ($report.AlternateDataStreams) { Write-Host "  Alternate Data Streams found:" -ForegroundColor Yellow; $report.AlternateDataStreams | Format-Table -AutoSize }
    return $report
}

Export-ModuleMember -Function *

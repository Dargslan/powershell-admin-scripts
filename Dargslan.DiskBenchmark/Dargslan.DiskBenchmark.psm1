<#
.SYNOPSIS
    Benchmark disk I/O read and write performance

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

function Invoke-DiskBenchmark {
    [CmdletBinding()]
    param([switch]$Json)
    $banner = @"
╔══════════════════════════════════════════════════════════╗
║  Dargslan Disk Benchmark
║  More tools: https://dargslan.com                       ║
║  Cheat Sheets: https://dargslan.com/cheat-sheets        ║
╚══════════════════════════════════════════════════════════╝
"@
    Write-Host $banner -ForegroundColor Cyan
    $testFile = Join-Path $env:TEMP "dargslan_bench_$(Get-Random).tmp"; $size = 100MB; $data = New-Object byte[] $size; (New-Object Random).NextBytes($data); $sw = [Diagnostics.Stopwatch]::StartNew(); [IO.File]::WriteAllBytes($testFile, $data); $sw.Stop(); $writeSpeed = [math]::Round($size / 1MB / ($sw.ElapsedMilliseconds / 1000), 1); $sw.Restart(); [IO.File]::ReadAllBytes($testFile) | Out-Null; $sw.Stop(); $readSpeed = [math]::Round($size / 1MB / ($sw.ElapsedMilliseconds / 1000), 1); Remove-Item $testFile -Force; [PSCustomObject]@{TestSize="100 MB"; "Write MB/s"=$writeSpeed; "Read MB/s"=$readSpeed} | Format-Table -AutoSize
}


Export-ModuleMember -Function *

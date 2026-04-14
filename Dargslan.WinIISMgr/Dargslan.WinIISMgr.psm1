<#
.SYNOPSIS
    IIS web server management toolkit — site inventory, application pool monitoring, SSL binding audit, log analysis, and health checks

.DESCRIPTION
    Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-IISReport {
    <#
    .SYNOPSIS
        Generate comprehensive IIS web server report
    .DESCRIPTION
        Lists all websites, application pools, SSL bindings, and checks IIS health.
        Part of Dargslan.WinIISMgr — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    Import-Module WebAdministration -ErrorAction SilentlyContinue
    if (-not (Get-Module WebAdministration -ErrorAction SilentlyContinue)) { Write-Warning "IIS not installed or WebAdministration module not available"; return }
    $report = [ordered]@{
        Sites = Get-Website | ForEach-Object {
            $bindings = $_.Bindings.Collection | ForEach-Object { "$($_.Protocol)://$($_.BindingInformation)" }
            [PSCustomObject]@{
                Name = $_.Name; State = $_.State; PhysicalPath = $_.PhysicalPath
                AppPool = $_.ApplicationPool; Bindings = $bindings -join "; "
                ID = $_.ID
            }
        }
        AppPools = Get-ChildItem IIS:\AppPools | ForEach-Object {
            [PSCustomObject]@{
                Name = $_.Name; State = $_.State
                ManagedRuntime = $_.ManagedRuntimeVersion; PipelineMode = $_.ManagedPipelineMode
                AutoStart = $_.AutoStart; StartMode = $_.StartMode
                ProcessModel = "$($_.ProcessModel.IdentityType)"
            }
        }
        SSLBindings = Get-ChildItem IIS:\SslBindings -ErrorAction SilentlyContinue | ForEach-Object {
            $cert = Get-ChildItem "Cert:\LocalMachine\My\$($_.Thumbprint)" -ErrorAction SilentlyContinue
            [PSCustomObject]@{
                IP = $_.IPAddress; Port = $_.Port; Host = $_.Host
                Thumbprint = $_.Thumbprint.Substring(0,16)+"..."
                Expiry = if($cert){$cert.NotAfter}else{"Unknown"}
                Subject = if($cert){$cert.Subject}else{"Unknown"}
            }
        }
        Summary = [PSCustomObject]@{
            TotalSites = (Get-Website | Measure-Object).Count
            RunningSites = (Get-Website | Where-Object State -eq "Started" | Measure-Object).Count
            TotalPools = (Get-ChildItem IIS:\AppPools | Measure-Object).Count
            RunningPools = (Get-ChildItem IIS:\AppPools | Where-Object State -eq "Started" | Measure-Object).Count
        }
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [IIS Report]" -ForegroundColor Cyan
    $report.Summary | Format-List
    $report.Sites | Format-Table Name, State, AppPool, Bindings -AutoSize
    $report.AppPools | Format-Table Name, State, ManagedRuntime, ProcessModel -AutoSize
    return $report
}

Export-ModuleMember -Function *

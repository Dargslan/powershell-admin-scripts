<#
.SYNOPSIS
    Microsoft Intune enrollment and compliance toolkit — MDM status, enrollment verification, compliance policies, and device management state (2026 Edition)

.DESCRIPTION
    2026 Edition — Part of the Dargslan Windows Admin Toolkit collection.
    More tools and resources at https://dargslan.com
    Free Cheat Sheets: https://dargslan.com/cheat-sheets

.LINK
    https://dargslan.com

.LINK
    https://github.com/Dargslan/powershell-admin-scripts
#>

function Get-IntuneStatus {
    <#
    .SYNOPSIS
        Check Intune enrollment and compliance status
    .DESCRIPTION
        Reports MDM enrollment, Intune compliance, configuration profiles, and management state.
        Part of Dargslan.WinIntuneMgr (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)

    $report = [ordered]@{
        MDMEnrollment = Get-CimInstance -Namespace root/cimv2/mdm/dmmap -ClassName MDM_DevDetail_Ext01 -ErrorAction SilentlyContinue | Select-Object DeviceHardwareData
        EnrollmentInfo = [PSCustomObject]@{
            IsEnrolled = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Enrollments\*\*" -ErrorAction SilentlyContinue | Where-Object ProviderID -eq "MS DM Server" | Measure-Object).Count -gt 0
            UPN = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Enrollments\*" -ErrorAction SilentlyContinue | Where-Object ProviderID).UPN
            EnrollmentType = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Enrollments\*" -ErrorAction SilentlyContinue | Where-Object ProviderID).EnrollmentType
        }
        AADJoin = dsregcmd /status 2>&1 | Where-Object { $_ -match "AzureAdJoined|DomainJoined|WorkplaceJoined|DeviceId|TenantName" } | ForEach-Object { $_.Trim() }
        ComplianceState = Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\IntuneManagementExtension\*" -ErrorAction SilentlyContinue | Select-Object -First 5
        LastSync = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Enrollments\*\*" -ErrorAction SilentlyContinue | Where-Object ProviderID -eq "MS DM Server").LastSuccessfulSync
        ManagementAgent = Get-Service IntuneManagementExtension -ErrorAction SilentlyContinue | Select-Object Status, StartType
    }
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Intune Status — 2026 Edition]" -ForegroundColor Cyan
    Write-Host "  Enrolled: $($report.EnrollmentInfo.IsEnrolled) | UPN: $($report.EnrollmentInfo.UPN)"
    Write-Host "  Management Agent: $($report.ManagementAgent.Status)"
    if ($report.AADJoin) { Write-Host "  Azure AD:" -ForegroundColor Yellow; $report.AADJoin | ForEach-Object { Write-Host "    $_" } }
    return $report
}

Export-ModuleMember -Function *

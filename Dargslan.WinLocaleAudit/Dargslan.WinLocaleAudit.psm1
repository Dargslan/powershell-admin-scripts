<#
.SYNOPSIS
    Windows locale and language configuration audit toolkit — system locale, input methods, timezone, regional settings, and Unicode compliance
.DESCRIPTION
    2026 Edition — Dargslan Windows Admin Toolkit.
    https://dargslan.com | https://dargslan.com/cheat-sheets
.LINK
    https://dargslan.com
#>

function Get-LocaleAudit {
    <#
    .SYNOPSIS
        Audit Windows locale and language configuration
    .DESCRIPTION
        Part of Dargslan.WinLocaleAudit (2026 Edition) — https://dargslan.com
    #>
    [CmdletBinding()] param([switch]$Json)
    $report = [ordered]@{
        SystemLocale = Get-WinSystemLocale | Select-Object Name, DisplayName, LCID
        UserLocale = Get-WinUserLanguageList | Select-Object LanguageTag, Autonym, EnglishName, InputMethodTips
        HomeLocation = Get-WinHomeLocation | Select-Object GeoId, HomeLocation
        TimeZone = Get-TimeZone | Select-Object Id, DisplayName, BaseUtcOffset, SupportsDaylightSavingTime
        CurrentTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss zzz"
        UILanguage = (Get-WinUILanguageOverride).Name
        DefaultEncoding = [System.Text.Encoding]::Default.EncodingName
        InstalledLanguages = Get-WinUserLanguageList | Select-Object LanguageTag, EnglishName
        UTFSupport = [PSCustomObject]@{
            UTF8Enabled = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Nls\CodePage" -ErrorAction SilentlyContinue).ACP -eq "65001"
            BetaUTF8 = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Nls\CodePage" -ErrorAction SilentlyContinue).OEMCP
        }
        Summary = [PSCustomObject]@{ Languages = 0; TimeZone = ""; Locale = "" }
    }
    $report.Summary.Languages = ($report.InstalledLanguages | Measure-Object).Count
    $report.Summary.TimeZone = $report.TimeZone.Id
    $report.Summary.Locale = $report.SystemLocale.Name
    if ($Json) { return $report | ConvertTo-Json -Depth 3 }
    Write-Host "`n  [Locale Audit - 2026]" -ForegroundColor Cyan
    $report.Summary | Format-List
    $report.SystemLocale | Format-List
    Write-Host "  TimeZone: $($report.TimeZone.DisplayName)"
    $report.InstalledLanguages | Format-Table -AutoSize
    return $report
}

Export-ModuleMember -Function *

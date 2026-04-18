# Dargslan.WinSecureBootAudit

Audit Windows Secure Boot, UEFI key store (PK / KEK / db / dbx), TPM 2.0 and BitLocker — and export a JSON or HTML compliance report.

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) suite.

## Install

```powershell
Install-Module -Name Dargslan.WinSecureBootAudit -Scope CurrentUser
Import-Module Dargslan.WinSecureBootAudit
```

## Usage

```powershell
# Quick on-screen status
Get-DargslanSecureBootStatus

# Full audit report (PSCustomObject)
$r = Get-DargslanSecureBootAuditReport
$r.Verdict   # PASS | WARN | FAIL
$r.Score     # e.g. "4 / 5"

# Same report as JSON
Get-DargslanSecureBootAuditReport -Json

# Export an HTML report you can email or upload
Export-DargslanSecureBootAuditReport -Path C:\reports\secureboot.html
Export-DargslanSecureBootAuditReport -Path C:\reports\secureboot.json -Format Json

# Inspect just the UEFI key store
Get-DargslanSecureBootKeys
```

## What it checks

| Check                                             | Required for PASS |
|---------------------------------------------------|-------------------|
| `Confirm-SecureBootUEFI` returns `True`           | yes               |
| Platform Key (PK) present                         | yes               |
| Forbidden signature database (dbx) > 1 KB         | yes               |
| TPM 2.0 ready (enabled, activated, owned)         | yes               |
| At least one BitLocker-protected volume           | yes               |

## Requires

- Windows 10 / 11 or Windows Server 2016+
- PowerShell 5.1+
- UEFI firmware (BIOS systems are reported as N/A)
- Administrator rights for full TPM and BitLocker visibility

## Resources

- Full guide: <https://dargslan.com/blog/windows-secure-boot-audit-powershell-2026>
- Free PDF cheat sheet: <https://dargslan.com/cheat-sheets/windows-secure-boot-audit-2026>
- More PowerShell modules: <https://www.powershellgallery.com/profiles/Dargslan>
- 210+ professional eBooks: <https://dargslan.com/books>

## License

MIT — see [LICENSE](https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE).

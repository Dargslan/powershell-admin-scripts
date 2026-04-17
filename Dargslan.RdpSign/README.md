# Dargslan.RdpSign

Bulk-generate and digitally sign Remote Desktop Protocol (`.rdp`) connection files from a CSV + template, in one PowerShell call. Wraps the built-in `rdpsign.exe` utility with safe defaults.

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection — over 100 free PowerShell modules for everyday Windows administration.

## Why?

Hand-editing `.rdp` files for every user does not scale. This module gives you two cmdlets that turn a CSV of users plus one template into a directory of signed, ready-to-deploy `.rdp` files.

## Install

```powershell
Install-Module -Name Dargslan.RdpSign -Scope CurrentUser
Import-Module Dargslan.RdpSign
```

## Cmdlets

| Cmdlet | Purpose |
|---|---|
| `Get-DargslanCodeSigningCert` | List code-signing certs in CurrentUser and LocalMachine stores |
| `Test-DargslanRdpSignature`   | Dry-run signature test (`rdpsign /l`) without modifying the file |
| `New-DargslanSignedRdp`       | Generate + sign a single `.rdp` from a template + values hashtable |
| `New-DargslanSignedRdpBatch`  | Generate + sign N files from a CSV + template in one call |

## Quick start

### 1. Find your code-signing certificate

```powershell
Get-DargslanCodeSigningCert
```

Copy the `Thumbprint` (40 hex chars, no spaces) of the certificate you want to use.

### 2. Create `template.rdp`

```ini
full address:s:rdsh.contoso.local
gatewayhostname:s:rdgw.contoso.local
prompt for credentials:i:1
authentication level:i:2
redirectclipboard:i:1
drivestoredirect:s:
username:s:__USERNAME__
```

### 3. Create `users.csv`

```csv
SamAccountName,UserName,OutputName
jsmith,DOMAIN\jsmith,jsmith.rdp
adoe,DOMAIN\adoe,adoe.rdp
bkiss,DOMAIN\bkiss,bkiss.rdp
```

Every column except `OutputName` is treated as a placeholder. Column `UserName` fills `__USERNAME__`, column `Gateway` would fill `__GATEWAY__`, etc. (column names are upper-cased to form the token).

### 4. Generate + sign

```powershell
New-DargslanSignedRdpBatch `
    -TemplatePath C:\RDP\template.rdp `
    -CsvPath      C:\RDP\users.csv `
    -OutDir       C:\RDP\out `
    -Thumbprint   ABCDEF1234567890ABCDEF1234567890ABCDEF12
```

For very large user counts, add `-BatchSign` to call `rdpsign` once at the end with all paths instead of once per file:

```powershell
New-DargslanSignedRdpBatch ... -BatchSign
```

### 5. Verify

```powershell
Test-DargslanRdpSignature -Thumbprint ABCDEF... -Path C:\RDP\out\jsmith.rdp
```

Or simply double-click the file — a green "Trusted publisher" prompt confirms the signature is valid and the certificate chain is trusted on that client.

## Single-file usage

```powershell
New-DargslanSignedRdp `
    -TemplatePath C:\RDP\template.rdp `
    -OutFile      C:\RDP\out\jsmith.rdp `
    -Values       @{ USERNAME = 'DOMAIN\jsmith' } `
    -Thumbprint   ABCDEF1234567890ABCDEF1234567890ABCDEF12
```

Add `-WhatIfSign` to validate the certificate without actually writing the signature into the file (uses `rdpsign /l`).

## Notes

* Never embed a password in a distributed `.rdp` file — always set `prompt for credentials:i:1`.
* `rdpsign.exe` does **not** support wildcards. This module already expands the file list for you.
* Files are written ASCII-encoded; do not let a later step re-encode them or the signature will break.
* For long-lived `.rdp` files signed against a soon-to-expire cert, sign with timestamping (advanced — not yet exposed by this module; raise an issue).

## Resources

* **Full guide:** [Bulk RDP File Signing with rdpsign and PowerShell (2026)](https://dargslan.com/blog/bulk-rdp-file-signing-rdpsign-powershell-2026)
* **Free PDF cheat sheet:** [RDP Bulk Signing Cheat Sheet](https://dargslan.com/cheat-sheets/rdpsign-bulk-signing-2026)
* **More cheat sheets:** [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets) — 200+ free IT references
* **Books:** [dargslan.com/books](https://dargslan.com/books) — 210+ Linux, Windows, and DevOps eBooks
* **All Dargslan modules:** [PowerShell Gallery profile](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — see [LICENSE](https://github.com/Dargslan/powershell-admin-scripts/blob/main/LICENSE).

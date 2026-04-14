# Dargslan.WinBitLocker

> **BitLocker drive encryption management toolkit — encryption status, recovery key management, TPM status, and compliance reporting**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinBitLocker-blue)](https://www.powershellgallery.com/packages/Dargslan.WinBitLocker)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
Install-Module -Name Dargslan.WinBitLocker -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinBitLocker
Get-BitLockerReport
Get-BitLockerReport -Json
```

## Functions

### `Get-BitLockerReport`

Reports encryption status for all drives, TPM health, recovery key backup status, and compliance.

```powershell
Get-BitLockerReport
Get-BitLockerReport -Json
Get-BitLockerReport -Json | Out-File report.json
```



## Use Cases

- **Encryption Compliance**: Verify all drives are BitLocker encrypted
- **Recovery Management**: Ensure recovery keys are backed up
- **TPM Health**: Monitor TPM readiness for BitLocker
- **Security Audits**: Document encryption status for compliance
- **Fleet Management**: Check BitLocker status across endpoints

## Requirements

- **PowerShell 5.1+** or **PowerShell 7+**
- **Windows 10/11** or **Windows Server 2016+**
- Some functions require **Administrator** privileges

## More Dargslan Tools

| Resource | Link |
|----------|------|
| Homepage | [dargslan.com](https://dargslan.com) |
| Free Cheat Sheets | [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets) |
| eBooks | [dargslan.com/books](https://dargslan.com/books) |
| PowerShell Gallery | [powershellgallery.com/profiles/Dargslan](https://www.powershellgallery.com/profiles/Dargslan) |
| GitHub | [github.com/Dargslan](https://github.com/Dargslan) |

## License

MIT License — (c) 2025 Dargslan — [dargslan.com](https://dargslan.com)

# Dargslan.WinIntuneMgr — 2026 Edition

> **Microsoft Intune enrollment and compliance toolkit — MDM status, enrollment verification, compliance policies, and device management state (2026 Edition)**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinIntuneMgr-blue)](https://www.powershellgallery.com/packages/Dargslan.WinIntuneMgr)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)
[![2026 Edition](https://img.shields.io/badge/Edition-2026-green.svg)](https://dargslan.com)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
Install-Module -Name Dargslan.WinIntuneMgr -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinIntuneMgr
Get-IntuneStatus
Get-IntuneStatus -Json
```

## Functions

### `Get-IntuneStatus`

Reports MDM enrollment, Intune compliance, configuration profiles, and management state.

```powershell
Get-IntuneStatus
Get-IntuneStatus -Json
```



## Use Cases

- **Enrollment Verification**: Confirm devices are Intune enrolled
- **Compliance Monitoring**: Check device compliance status
- **AAD Join**: Verify Azure AD join and hybrid scenarios
- **Troubleshooting**: Debug Intune sync and policy issues
- **Fleet Management**: Track MDM enrollment across endpoints

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

## License

MIT License — (c) 2026 Dargslan — [dargslan.com](https://dargslan.com)

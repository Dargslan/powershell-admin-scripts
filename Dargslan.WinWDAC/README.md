# Dargslan.WinWDAC — 2026 Edition

> **Windows Defender Application Control policy toolkit — WDAC policy audit, code integrity, smart app control, and application reputation (2026 Edition)**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinWDAC-blue)](https://www.powershellgallery.com/packages/Dargslan.WinWDAC)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)
[![2026 Edition](https://img.shields.io/badge/Edition-2026-green.svg)](https://dargslan.com)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
Install-Module -Name Dargslan.WinWDAC -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinWDAC
Get-WDACStatus
Get-WDACStatus -Json
```

## Functions

### `Get-WDACStatus`

Reports WDAC policy enforcement, code integrity events, Smart App Control status, and policy details.

```powershell
Get-WDACStatus
Get-WDACStatus -Json
```



## Use Cases

- **Application Security**: Verify WDAC policy enforcement
- **Zero Trust**: Implement code integrity controls
- **Compliance**: Document application control for audits
- **Smart App Control**: Monitor Windows 11 app reputation system
- **Incident Response**: Review blocked application events

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

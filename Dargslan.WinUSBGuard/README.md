# Dargslan.WinUSBGuard — 2026 Edition

> **Windows USB device security toolkit — USB device inventory, policy enforcement, removable storage audit, and device installation control (2026 Edition)**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinUSBGuard-blue)](https://www.powershellgallery.com/packages/Dargslan.WinUSBGuard)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)
[![2026 Edition](https://img.shields.io/badge/Edition-2026-green.svg)](https://dargslan.com)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
Install-Module -Name Dargslan.WinUSBGuard -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinUSBGuard
Get-USBSecurityAudit
Get-USBSecurityAudit -Json
```

## Functions

### `Get-USBSecurityAudit`

Reports connected USB devices, removable storage policy, device installation restrictions, and USB history.

```powershell
Get-USBSecurityAudit
Get-USBSecurityAudit -Json
```



## Use Cases

- **DLP**: Enforce removable storage restrictions
- **Device Control**: Audit USB device installations
- **Compliance**: Document USB security policies
- **Forensics**: Review USB device connection history
- **Security**: Block unauthorized USB storage devices

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

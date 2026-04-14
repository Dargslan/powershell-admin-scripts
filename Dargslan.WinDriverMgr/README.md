# Dargslan.WinDriverMgr

> **Windows driver management toolkit — driver inventory, outdated driver detection, unsigned driver audit, and driver backup**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinDriverMgr-blue)](https://www.powershellgallery.com/packages/Dargslan.WinDriverMgr)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
Install-Module -Name Dargslan.WinDriverMgr -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinDriverMgr
Get-DriverAudit
Get-DriverAudit -Json
```

## Functions

### `Get-DriverAudit`

Lists all installed drivers, identifies unsigned drivers, outdated versions, and problem devices.

```powershell
Get-DriverAudit
Get-DriverAudit -Json
Get-DriverAudit -Json | Out-File report.json
```



## Use Cases

- **Driver Compliance**: Ensure all drivers are signed
- **Troubleshooting**: Find problem devices and missing drivers
- **Security**: Identify third-party and potentially risky drivers
- **Migration**: Document driver inventory before OS upgrades
- **Fleet Management**: Track driver versions across endpoints

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

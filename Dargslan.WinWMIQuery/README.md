# Dargslan.WinWMIQuery

> **Windows WMI query toolkit — hardware enumeration, software inventory, system configuration queries, and WMI class explorer**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinWMIQuery-blue)](https://www.powershellgallery.com/packages/Dargslan.WinWMIQuery)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
Install-Module -Name Dargslan.WinWMIQuery -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinWMIQuery
Get-WMIInventory
Get-WMIInventory -Json
```

## Functions

### `Get-WMIInventory`

Queries WMI for comprehensive hardware, software, and system configuration data.

```powershell
Get-WMIInventory
Get-WMIInventory -Json
Get-WMIInventory -Json | Out-File report.json
```



## Use Cases

- **Asset Management**: Complete hardware/software inventory
- **Procurement**: Document system specifications
- **Compliance**: Verify software licensing
- **Migration Planning**: Assess hardware capabilities
- **Reporting**: Generate system inventory for management

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

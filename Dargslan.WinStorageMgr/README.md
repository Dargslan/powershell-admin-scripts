# Dargslan.WinStorageMgr

> **Windows Storage Spaces and pool management toolkit — storage pool monitoring, virtual disk health, tiering status, and capacity planning**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinStorageMgr-blue)](https://www.powershellgallery.com/packages/Dargslan.WinStorageMgr)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
Install-Module -Name Dargslan.WinStorageMgr -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinStorageMgr
Get-StorageReport
Get-StorageReport -Json
```

## Functions

### `Get-StorageReport`

Reports storage pool health, virtual disk status, physical disk allocation, and capacity utilization.

```powershell
Get-StorageReport
Get-StorageReport -Json
Get-StorageReport -Json | Out-File report.json
```



## Use Cases

- **Storage Monitoring**: Track Storage Spaces health and capacity
- **Capacity Planning**: Monitor pool utilization trends
- **Troubleshooting**: Diagnose virtual disk and pool issues
- **Server Management**: Inventory all storage resources
- **Disaster Recovery**: Verify storage redundancy configurations

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

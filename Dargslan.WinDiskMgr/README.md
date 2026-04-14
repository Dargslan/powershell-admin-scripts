# Dargslan.WinDiskMgr

> **Windows disk management toolkit — disk health, SMART monitoring, space analysis, cleanup automation, and partition management**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinDiskMgr-blue)](https://www.powershellgallery.com/packages/Dargslan.WinDiskMgr)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
# Install from PowerShell Gallery
Install-Module -Name Dargslan.WinDiskMgr -Scope CurrentUser

# Or install for all users (requires admin)
Install-Module -Name Dargslan.WinDiskMgr -Scope AllUsers
```

## Quick Start

```powershell
# Import the module
Import-Module Dargslan.WinDiskMgr

# Run the main function
Get-DiskReport

# Get JSON output
Get-DiskReport -Json
```

## Functions

### `Get-DiskReport`

Reports physical disk health, SMART status, volume space usage, and identifies potential issues.

```powershell
# Basic usage
Get-DiskReport

# JSON output
Get-DiskReport -Json

# Export to file
Get-DiskReport -Json | Out-File report.json
```

### `Invoke-DiskCleanup`

Removes temp files, Windows Update cache, recycle bin contents, and other cleanable data.

```powershell
# Basic usage
Invoke-DiskCleanup

# JSON output
Invoke-DiskCleanup -Json

# Export to file
Invoke-DiskCleanup -Json | Out-File report.json
```



## Use Cases

- **Storage Monitoring**: Proactive disk space alerts before outages
- **SMART Monitoring**: Detect failing disks before data loss
- **Automated Cleanup**: Schedule temp file cleanup as maintenance
- **Capacity Planning**: Track storage trends over time
- **Server Maintenance**: Regular disk health checks for production servers

## Requirements

- **PowerShell 5.1+** (Windows PowerShell) or **PowerShell 7+** (PowerShell Core)
- **Windows 10/11** or **Windows Server 2016+**
- Some functions require **Administrator** privileges for full data access

## More Dargslan Tools

| Resource | Link |
|----------|------|
| Homepage | [dargslan.com](https://dargslan.com) |
| Free Cheat Sheets | [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets) |
| eBooks | [dargslan.com/books](https://dargslan.com/books) |
| PyPI Tools (Linux) | [pypi.org/search/?q=dargslan](https://pypi.org/search/?q=dargslan) |
| PyPI Tools (Windows) | [pypi.org/search/?q=dargslan-win](https://pypi.org/search/?q=dargslan-win) |
| PowerShell Gallery | [powershellgallery.com/profiles/Dargslan](https://www.powershellgallery.com/profiles/Dargslan) |
| GitHub | [github.com/Dargslan](https://github.com/Dargslan) |

## License

MIT License — (c) 2025 Dargslan — [dargslan.com](https://dargslan.com)

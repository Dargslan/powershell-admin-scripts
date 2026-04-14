# Dargslan.WinUpdateMgr

> **Windows Update management toolkit — update status, pending patches, hotfix history, WSUS configuration, and update compliance reporting**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinUpdateMgr-blue)](https://www.powershellgallery.com/packages/Dargslan.WinUpdateMgr)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
# Install from PowerShell Gallery
Install-Module -Name Dargslan.WinUpdateMgr -Scope CurrentUser

# Or install for all users (requires admin)
Install-Module -Name Dargslan.WinUpdateMgr -Scope AllUsers
```

## Quick Start

```powershell
# Import the module
Import-Module Dargslan.WinUpdateMgr

# Run the main function
Get-UpdateStatus

# Get JSON output
Get-UpdateStatus -Json
```

## Functions

### `Get-UpdateStatus`

Shows pending updates, last update date, WSUS configuration, and compliance status.

```powershell
# Basic usage
Get-UpdateStatus

# JSON output
Get-UpdateStatus -Json

# Export to file
Get-UpdateStatus -Json | Out-File report.json
```



## Use Cases

- **Patch Management**: Track update compliance across servers
- **Vulnerability Management**: Identify systems missing critical patches
- **Change Management**: Review update history for troubleshooting
- **Compliance**: SOC2/HIPAA patch compliance reporting
- **WSUS Administration**: Verify WSUS client configuration

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

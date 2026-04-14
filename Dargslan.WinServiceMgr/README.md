# Dargslan.WinServiceMgr

> **Windows service management toolkit — service health monitoring, failed service detection, startup analysis, dependency mapping, and restart automation**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinServiceMgr-blue)](https://www.powershellgallery.com/packages/Dargslan.WinServiceMgr)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
# Install from PowerShell Gallery
Install-Module -Name Dargslan.WinServiceMgr -Scope CurrentUser

# Or install for all users (requires admin)
Install-Module -Name Dargslan.WinServiceMgr -Scope AllUsers
```

## Quick Start

```powershell
# Import the module
Import-Module Dargslan.WinServiceMgr

# Run the main function
Get-ServiceHealth

# Get JSON output
Get-ServiceHealth -Json
```

## Functions

### `Get-ServiceHealth`

Identifies stopped auto-start services, high-resource services, and provides dependency analysis.

```powershell
# Basic usage
Get-ServiceHealth

# JSON output
Get-ServiceHealth -Json

# Export to file
Get-ServiceHealth -Json | Out-File report.json
```

### `Restart-FailedServices`

Finds and restarts services that should be running but are stopped. Supports -WhatIf.

```powershell
# Basic usage
Restart-FailedServices

# JSON output
Restart-FailedServices -Json

# Export to file
Restart-FailedServices -Json | Out-File report.json
```



## Use Cases

- **Server Monitoring**: Detect failed services before they impact users
- **Automated Recovery**: Restart crashed services automatically
- **Dependency Analysis**: Understand service relationships
- **Startup Optimization**: Review auto-start services for performance
- **Change Management**: Document service configurations

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

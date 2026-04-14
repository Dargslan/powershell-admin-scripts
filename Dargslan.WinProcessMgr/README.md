# Dargslan.WinProcessMgr

> **Windows process management toolkit — process monitoring, resource analysis, hung process detection, and process tree visualization**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinProcessMgr-blue)](https://www.powershellgallery.com/packages/Dargslan.WinProcessMgr)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
# Install from PowerShell Gallery
Install-Module -Name Dargslan.WinProcessMgr -Scope CurrentUser

# Or install for all users (requires admin)
Install-Module -Name Dargslan.WinProcessMgr -Scope AllUsers
```

## Quick Start

```powershell
# Import the module
Import-Module Dargslan.WinProcessMgr

# Run the main function
Get-ProcessAnalysis

# Get JSON output
Get-ProcessAnalysis -Json
```

## Functions

### `Get-ProcessAnalysis`

Provides detailed process analysis including CPU time, memory usage, handle counts, and detects hung processes.

```powershell
# Basic usage
Get-ProcessAnalysis

# JSON output
Get-ProcessAnalysis -Json

# Export to file
Get-ProcessAnalysis -Json | Out-File report.json
```



## Use Cases

- **Resource Monitoring**: Track which processes consume the most resources
- **Hung Process Detection**: Find and handle unresponsive applications
- **Troubleshooting**: Investigate high CPU or memory issues
- **Capacity Planning**: Understand process resource requirements
- **Automation**: Script process management tasks

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

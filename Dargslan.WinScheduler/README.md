# Dargslan.WinScheduler

> **Windows Task Scheduler management toolkit — task inventory, failed task detection, trigger analysis, and task creation helpers**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinScheduler-blue)](https://www.powershellgallery.com/packages/Dargslan.WinScheduler)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
# Install from PowerShell Gallery
Install-Module -Name Dargslan.WinScheduler -Scope CurrentUser

# Or install for all users (requires admin)
Install-Module -Name Dargslan.WinScheduler -Scope AllUsers
```

## Quick Start

```powershell
# Import the module
Import-Module Dargslan.WinScheduler

# Run the main function
Get-ScheduledTaskAudit

# Get JSON output
Get-ScheduledTaskAudit -Json
```

## Functions

### `Get-ScheduledTaskAudit`

Lists all scheduled tasks, identifies failed tasks, disabled tasks, and tasks running as SYSTEM.

```powershell
# Basic usage
Get-ScheduledTaskAudit

# JSON output
Get-ScheduledTaskAudit -Json

# Export to file
Get-ScheduledTaskAudit -Json | Out-File report.json
```



## Use Cases

- **Task Monitoring**: Detect failed scheduled tasks before they cause issues
- **Security Review**: Audit tasks running with elevated privileges
- **Documentation**: Export task configurations for change management
- **Troubleshooting**: Investigate task failures with detailed error codes
- **Cleanup**: Identify and remove unnecessary scheduled tasks

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

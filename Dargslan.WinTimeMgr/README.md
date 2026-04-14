# Dargslan.WinTimeMgr

> **Windows time synchronization management toolkit — NTP status, time skew detection, W32Time service monitoring, and timezone configuration**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinTimeMgr-blue)](https://www.powershellgallery.com/packages/Dargslan.WinTimeMgr)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
# Install from PowerShell Gallery
Install-Module -Name Dargslan.WinTimeMgr -Scope CurrentUser

# Or install for all users (requires admin)
Install-Module -Name Dargslan.WinTimeMgr -Scope AllUsers
```

## Quick Start

```powershell
# Import the module
Import-Module Dargslan.WinTimeMgr

# Run the main function
Get-TimeStatus

# Get JSON output
Get-TimeStatus -Json
```

## Functions

### `Get-TimeStatus`

Reports W32Time service status, NTP source, time skew, and timezone configuration.

```powershell
# Basic usage
Get-TimeStatus

# JSON output
Get-TimeStatus -Json

# Export to file
Get-TimeStatus -Json | Out-File report.json
```



## Use Cases

- **Time Accuracy**: Verify time sync for Kerberos/AD authentication
- **Compliance**: Ensure accurate timestamps for audit logs
- **Troubleshooting**: Diagnose time-related authentication failures
- **Monitoring**: Alert on time drift exceeding thresholds
- **Documentation**: Record time configuration for compliance reports

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

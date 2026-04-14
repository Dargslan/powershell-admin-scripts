# Dargslan.WinSMBMgr

> **Windows SMB/CIFS share management toolkit — share inventory, session monitoring, open file tracking, and security configuration audit**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinSMBMgr-blue)](https://www.powershellgallery.com/packages/Dargslan.WinSMBMgr)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
# Install from PowerShell Gallery
Install-Module -Name Dargslan.WinSMBMgr -Scope CurrentUser

# Or install for all users (requires admin)
Install-Module -Name Dargslan.WinSMBMgr -Scope AllUsers
```

## Quick Start

```powershell
# Import the module
Import-Module Dargslan.WinSMBMgr

# Run the main function
Get-SMBAudit

# Get JSON output
Get-SMBAudit -Json
```

## Functions

### `Get-SMBAudit`

Lists all SMB shares, active sessions, open files, and audits SMB security configuration.

```powershell
# Basic usage
Get-SMBAudit

# JSON output
Get-SMBAudit -Json

# Export to file
Get-SMBAudit -Json | Out-File report.json
```



## Use Cases

- **Share Management**: Inventory and manage file shares
- **Security Hardening**: Disable SMB1, enable signing and encryption
- **Session Monitoring**: Track who is accessing shared resources
- **Compliance**: Document share permissions for audits
- **Troubleshooting**: Diagnose file sharing and access issues

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

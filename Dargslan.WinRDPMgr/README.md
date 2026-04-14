# Dargslan.WinRDPMgr

> **Windows Remote Desktop management toolkit — RDP session monitoring, configuration audit, security assessment, and connection logging**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinRDPMgr-blue)](https://www.powershellgallery.com/packages/Dargslan.WinRDPMgr)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
# Install from PowerShell Gallery
Install-Module -Name Dargslan.WinRDPMgr -Scope CurrentUser

# Or install for all users (requires admin)
Install-Module -Name Dargslan.WinRDPMgr -Scope AllUsers
```

## Quick Start

```powershell
# Import the module
Import-Module Dargslan.WinRDPMgr

# Run the main function
Get-RDPAudit

# Get JSON output
Get-RDPAudit -Json
```

## Functions

### `Get-RDPAudit`

Reports RDP configuration, active sessions, recent login history, and security settings.

```powershell
# Basic usage
Get-RDPAudit

# JSON output
Get-RDPAudit -Json

# Export to file
Get-RDPAudit -Json | Out-File report.json
```



## Use Cases

- **Session Monitoring**: Track who is connected via RDP
- **Security Auditing**: Verify NLA is enabled, check for unauthorized access
- **Compliance**: Document RDP configuration for security audits
- **Troubleshooting**: Debug RDP connectivity issues
- **Forensics**: Review RDP login history during incident investigation

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

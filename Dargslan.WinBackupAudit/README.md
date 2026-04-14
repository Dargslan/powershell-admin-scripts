# Dargslan.WinBackupAudit

> **Windows backup auditing toolkit — Windows Server Backup, VSS snapshot monitoring, backup job verification, and recovery point tracking**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinBackupAudit-blue)](https://www.powershellgallery.com/packages/Dargslan.WinBackupAudit)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
# Install from PowerShell Gallery
Install-Module -Name Dargslan.WinBackupAudit -Scope CurrentUser

# Or install for all users (requires admin)
Install-Module -Name Dargslan.WinBackupAudit -Scope AllUsers
```

## Quick Start

```powershell
# Import the module
Import-Module Dargslan.WinBackupAudit

# Run the main function
Get-BackupStatus

# Get JSON output
Get-BackupStatus -Json
```

## Functions

### `Get-BackupStatus`

Reports Windows Server Backup status, VSS shadow copies, and backup schedule compliance.

```powershell
# Basic usage
Get-BackupStatus

# JSON output
Get-BackupStatus -Json

# Export to file
Get-BackupStatus -Json | Out-File report.json
```



## Use Cases

- **Backup Verification**: Ensure backups are running successfully
- **Disaster Recovery Planning**: Track recovery point objectives (RPO)
- **Compliance**: Prove backup compliance for auditors
- **VSS Monitoring**: Monitor shadow copy health and storage usage
- **Alerting**: Detect backup failures before they become critical

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

# Dargslan.WinSQLHealth

> **SQL Server health check toolkit — instance monitoring, database status, backup verification, job history, and performance metrics**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinSQLHealth-blue)](https://www.powershellgallery.com/packages/Dargslan.WinSQLHealth)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
Install-Module -Name Dargslan.WinSQLHealth -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinSQLHealth
Get-SQLHealthReport
Get-SQLHealthReport -Json
```

## Functions

### `Get-SQLHealthReport`

Reports SQL Server instance status, database health, backup freshness, agent job results, and key performance metrics.

```powershell
Get-SQLHealthReport
Get-SQLHealthReport -Json
Get-SQLHealthReport -Json | Out-File report.json
```



## Use Cases

- **DBA Monitoring**: Daily SQL Server health checks
- **Backup Verification**: Ensure all databases have recent backups
- **Job Monitoring**: Track SQL Agent job success/failure
- **Performance**: Monitor memory and configuration settings
- **Compliance**: Document database configurations for audits

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

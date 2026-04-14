# Dargslan.WinWSUSMgr

> **WSUS server management toolkit — update compliance, client reporting, sync status, cleanup operations, and approval management**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinWSUSMgr-blue)](https://www.powershellgallery.com/packages/Dargslan.WinWSUSMgr)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
Install-Module -Name Dargslan.WinWSUSMgr -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinWSUSMgr
Get-WSUSReport
Get-WSUSReport -Json
```

## Functions

### `Get-WSUSReport`

Reports update synchronization status, client compliance, pending approvals, and server health.

```powershell
Get-WSUSReport
Get-WSUSReport -Json
Get-WSUSReport -Json | Out-File report.json
```



## Use Cases

- **Patch Compliance**: Track update deployment across all clients
- **WSUS Health**: Monitor sync status and server health
- **Reporting**: Generate compliance reports for management
- **Cleanup**: Identify and remove unnecessary updates
- **Client Management**: Track which computers are checking in

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

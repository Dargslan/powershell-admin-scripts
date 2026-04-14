# Dargslan.WinNetStat

> **Windows network statistics toolkit — TCP/UDP connection monitoring, listening port analysis, connection state tracking, and bandwidth stats**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinNetStat-blue)](https://www.powershellgallery.com/packages/Dargslan.WinNetStat)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
Install-Module -Name Dargslan.WinNetStat -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinNetStat
Get-NetStatReport
Get-NetStatReport -Json
```

## Functions

### `Get-NetStatReport`

Reports TCP/UDP connections, listening services, connection states, and identifies high-connection processes.

```powershell
Get-NetStatReport
Get-NetStatReport -Json
Get-NetStatReport -Json | Out-File report.json
```



## Use Cases

- **Security Monitoring**: Identify unexpected listening services
- **Troubleshooting**: Debug connection issues and port conflicts
- **Performance**: Find processes with excessive connections
- **Forensics**: Investigate suspicious network activity
- **Firewall Validation**: Verify only expected ports are open

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

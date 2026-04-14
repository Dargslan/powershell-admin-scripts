# Dargslan.WinIISMgr

> **IIS web server management toolkit — site inventory, application pool monitoring, SSL binding audit, log analysis, and health checks**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinIISMgr-blue)](https://www.powershellgallery.com/packages/Dargslan.WinIISMgr)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
Install-Module -Name Dargslan.WinIISMgr -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinIISMgr
Get-IISReport
Get-IISReport -Json
```

## Functions

### `Get-IISReport`

Lists all websites, application pools, SSL bindings, and checks IIS health.

```powershell
Get-IISReport
Get-IISReport -Json
Get-IISReport -Json | Out-File report.json
```



## Use Cases

- **Web Server Management**: Inventory all IIS sites and app pools
- **SSL Monitoring**: Track certificate bindings and expiry dates
- **Troubleshooting**: Debug site and application pool issues
- **Security Audit**: Review app pool identities and configurations
- **Capacity Planning**: Monitor web server load and configuration

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

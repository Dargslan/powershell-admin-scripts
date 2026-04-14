# Dargslan.WinPrintMgr

> **Windows print management toolkit — printer inventory, print queue monitoring, driver audit, spooler health, and print job tracking**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinPrintMgr-blue)](https://www.powershellgallery.com/packages/Dargslan.WinPrintMgr)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
Install-Module -Name Dargslan.WinPrintMgr -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinPrintMgr
Get-PrinterAudit
Get-PrinterAudit -Json
```

## Functions

### `Get-PrinterAudit`

Lists installed printers, checks print queue status, audits drivers, and verifies spooler service health.

```powershell
Get-PrinterAudit
Get-PrinterAudit -Json
Get-PrinterAudit -Json | Out-File report.json
```



## Use Cases

- **Print Infrastructure**: Inventory all printers across the organization
- **Troubleshooting**: Diagnose print queue and spooler issues
- **Security**: Audit shared printers and print drivers
- **Fleet Management**: Track printer configurations across servers
- **Cost Tracking**: Monitor print job volumes and sizes

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

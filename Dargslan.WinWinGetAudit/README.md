# Dargslan.WinWinGetAudit — 2026 Edition

> **Windows Package Manager (winget) audit toolkit — installed apps, available updates, source configuration, and settings analysis**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinWinGetAudit-blue)](https://www.powershellgallery.com/packages/Dargslan.WinWinGetAudit)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![2026 Edition](https://img.shields.io/badge/Edition-2026-green.svg)](https://dargslan.com)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — 80 professional PowerShell modules for Windows sysadmins.

## Installation

```powershell
Install-Module -Name Dargslan.WinWinGetAudit -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinWinGetAudit
Get-WinGetAudit
Get-WinGetAudit -Json
```

## Functions

### \`Get-WinGetAudit\`

Reports winget version, installed applications, available upgrades, configured sources, and settings.

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

## License

MIT License — (c) 2026 Dargslan — [dargslan.com](https://dargslan.com)

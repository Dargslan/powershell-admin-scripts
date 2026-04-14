# Dargslan.WinVSSAdmin — 2026 Edition

> **Volume Shadow Copy Service administration toolkit — VSS writers audit, provider inventory, shadow storage analysis, and writer failure detection**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinVSSAdmin-blue)](https://www.powershellgallery.com/packages/Dargslan.WinVSSAdmin)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![2026 Edition](https://img.shields.io/badge/Edition-2026-green.svg)](https://dargslan.com)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — 80 professional PowerShell modules for Windows sysadmins.

## Installation

```powershell
Install-Module -Name Dargslan.WinVSSAdmin -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinVSSAdmin
Get-VSSAdminReport
Get-VSSAdminReport -Json
```

## Functions

### \`Get-VSSAdminReport\`

Reports VSS writers status, providers, shadow storage allocation, shadow copies, and writer failures.

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

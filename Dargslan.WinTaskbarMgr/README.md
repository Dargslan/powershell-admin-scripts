# Dargslan.WinTaskbarMgr

> **Windows startup program and scheduled task optimization toolkit — autostart analysis, startup impact scoring, task trigger review, and boot optimization**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinTaskbarMgr-blue)](https://www.powershellgallery.com/packages/Dargslan.WinTaskbarMgr)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com).

## Installation

\`\`\`powershell
Install-Module -Name Dargslan.WinTaskbarMgr -Scope CurrentUser
\`\`\`

## Quick Start

\`\`\`powershell
Import-Module Dargslan.WinTaskbarMgr
Get-StartupOptimization
Get-StartupOptimization -Json
\`\`\`

## Functions

### \`Get-StartupOptimization\`

Reviews autostart programs, logon tasks, and auto-start services to identify boot time optimization opportunities.

## Use Cases

- **Boot Optimization**: Identify unnecessary startup programs
- **Security Review**: Audit programs that run at login
- **Performance**: Reduce boot time by disabling unnecessary autostart items
- **Fleet Management**: Standardize startup configurations

## Requirements

- **PowerShell 5.1+** or **PowerShell 7+**
- **Windows 10/11** or **Windows Server 2016+**

## More Dargslan Tools

| Resource | Link |
|----------|------|
| Homepage | [dargslan.com](https://dargslan.com) |
| Free Cheat Sheets | [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets) |
| PowerShell Gallery | [powershellgallery.com/profiles/Dargslan](https://www.powershellgallery.com/profiles/Dargslan) |

## License

MIT License — (c) 2025 Dargslan — [dargslan.com](https://dargslan.com)

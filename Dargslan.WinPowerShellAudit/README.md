# Dargslan.WinPowerShellAudit — 2026 Edition

> **PowerShell security audit toolkit — execution policy, script block logging, module integrity, constrained language mode, and JEA configuration (2026 Edition)**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinPowerShellAudit-blue)](https://www.powershellgallery.com/packages/Dargslan.WinPowerShellAudit)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![2026 Edition](https://img.shields.io/badge/Edition-2026-green.svg)](https://dargslan.com)

## Installation

```powershell
Install-Module -Name Dargslan.WinPowerShellAudit -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinPowerShellAudit
Get-PowerShellAudit
Get-PowerShellAudit -Json
```

## Functions

### \`Get-PowerShellAudit\`

Reports execution policies, script block logging, module logging, constrained language mode, JEA endpoints, and transcription settings.

## Use Cases

- **Security Hardening**: Verify PowerShell logging and restrictions
- **Compliance**: Document execution policy and logging settings
- **Threat Detection**: Ensure script block logging captures threats
- **JEA Management**: Audit Just Enough Administration endpoints
- **Forensics**: Verify PowerShell transcription is active

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

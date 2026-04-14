# Dargslan.WinAutopilot — 2026 Edition

> **Windows Autopilot diagnostics toolkit — hardware hash collection, deployment profile status, OOBE configuration, and provisioning log analysis (2026 Edition)**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinAutopilot-blue)](https://www.powershellgallery.com/packages/Dargslan.WinAutopilot)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)
[![2026 Edition](https://img.shields.io/badge/Edition-2026-green.svg)](https://dargslan.com)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
Install-Module -Name Dargslan.WinAutopilot -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinAutopilot
Get-AutopilotInfo
Get-AutopilotInfo -Json
```

## Functions

### `Get-AutopilotInfo`

Reports hardware hash, serial number, Autopilot profile status, and deployment readiness.

```powershell
Get-AutopilotInfo
Get-AutopilotInfo -Json
```



## Use Cases

- **Device Registration**: Collect hardware hash for Autopilot registration
- **Deployment Verification**: Check Autopilot profile assignment
- **Troubleshooting**: Debug Autopilot provisioning failures
- **Fleet Onboarding**: Bulk collect hardware hashes for import
- **OOBE Configuration**: Verify out-of-box experience settings

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

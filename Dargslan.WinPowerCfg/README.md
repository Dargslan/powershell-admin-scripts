# Dargslan.WinPowerCfg

> **Windows power configuration toolkit — power plan management, sleep/hibernate settings, battery health, and energy efficiency analysis**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinPowerCfg-blue)](https://www.powershellgallery.com/packages/Dargslan.WinPowerCfg)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
Install-Module -Name Dargslan.WinPowerCfg -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinPowerCfg
Get-PowerReport
Get-PowerReport -Json
```

## Functions

### `Get-PowerReport`

Reports current power plan, sleep settings, battery health, and provides energy efficiency recommendations.

```powershell
Get-PowerReport
Get-PowerReport -Json
Get-PowerReport -Json | Out-File report.json
```



## Use Cases

- **Server Configuration**: Ensure servers use High Performance power plan
- **Laptop Management**: Monitor battery health across fleet
- **Energy Savings**: Audit power settings for efficiency
- **Troubleshooting**: Debug unexpected sleep/wake issues
- **Compliance**: Document power configurations for server standards

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

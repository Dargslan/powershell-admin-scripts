# Dargslan.WinHyperV

> **Hyper-V management toolkit — VM inventory, resource monitoring, checkpoint management, network switch audit, and VM health reporting**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinHyperV-blue)](https://www.powershellgallery.com/packages/Dargslan.WinHyperV)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
Install-Module -Name Dargslan.WinHyperV -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinHyperV
Get-HyperVReport
Get-HyperVReport -Json
```

## Functions

### `Get-HyperVReport`

Lists all VMs, resource allocation, checkpoints, virtual switches, and identifies potential issues.

```powershell
Get-HyperVReport
Get-HyperVReport -Json
Get-HyperVReport -Json | Out-File report.json
```



## Use Cases

- **VM Management**: Inventory and monitor Hyper-V environments
- **Resource Planning**: Track VM resource allocation and usage
- **Checkpoint Management**: Identify old checkpoints consuming storage
- **Network Audit**: Review virtual switch configurations
- **Health Monitoring**: Detect VM issues before they impact services

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

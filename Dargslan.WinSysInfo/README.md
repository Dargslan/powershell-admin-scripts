# Dargslan.WinSysInfo

> **Comprehensive Windows system information collector — OS details, hardware inventory, CPU, memory, disk, network, GPU, and BIOS data with export capabilities**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinSysInfo-blue)](https://www.powershellgallery.com/packages/Dargslan.WinSysInfo)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
# Install from PowerShell Gallery
Install-Module -Name Dargslan.WinSysInfo -Scope CurrentUser

# Or install for all users (requires admin)
Install-Module -Name Dargslan.WinSysInfo -Scope AllUsers
```

## Quick Start

```powershell
# Import the module
Import-Module Dargslan.WinSysInfo

# Run the main function
Get-WinSystemReport

# Get JSON output
Get-WinSystemReport -Json
```

## Functions

### `Get-WinSystemReport`

Collects OS version, CPU, memory, disk, network adapter, GPU, and BIOS information. Supports JSON, CSV, and HTML export.

```powershell
# Basic usage
Get-WinSystemReport

# JSON output
Get-WinSystemReport -Json

# Export to file
Get-WinSystemReport -Json | Out-File report.json
```

### `Get-WinHardwareInventory`

Collects detailed hardware information suitable for asset management and inventory tracking.

```powershell
# Basic usage
Get-WinHardwareInventory

# JSON output
Get-WinHardwareInventory -Json

# Export to file
Get-WinHardwareInventory -Json | Out-File report.json
```



## Use Cases

- **IT Asset Management**: Generate hardware inventories for fleet tracking
- **Troubleshooting**: Quick system overview when diagnosing issues
- **Capacity Planning**: Monitor resource usage across servers
- **Compliance**: Document system configurations for audits
- **Onboarding**: Quickly assess new machines joining the network

## Requirements

- **PowerShell 5.1+** (Windows PowerShell) or **PowerShell 7+** (PowerShell Core)
- **Windows 10/11** or **Windows Server 2016+**
- Some functions require **Administrator** privileges for full data access

## More Dargslan Tools

| Resource | Link |
|----------|------|
| Homepage | [dargslan.com](https://dargslan.com) |
| Free Cheat Sheets | [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets) |
| eBooks | [dargslan.com/books](https://dargslan.com/books) |
| PyPI Tools (Linux) | [pypi.org/search/?q=dargslan](https://pypi.org/search/?q=dargslan) |
| PyPI Tools (Windows) | [pypi.org/search/?q=dargslan-win](https://pypi.org/search/?q=dargslan-win) |
| PowerShell Gallery | [powershellgallery.com/profiles/Dargslan](https://www.powershellgallery.com/profiles/Dargslan) |
| GitHub | [github.com/Dargslan](https://github.com/Dargslan) |

## License

MIT License — (c) 2025 Dargslan — [dargslan.com](https://dargslan.com)

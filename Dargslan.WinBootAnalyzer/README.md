# Dargslan.WinBootAnalyzer

> **Windows boot performance analyzer — boot time measurement, startup impact analysis, boot event review, and optimization recommendations**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinBootAnalyzer-blue)](https://www.powershellgallery.com/packages/Dargslan.WinBootAnalyzer)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
# Install from PowerShell Gallery
Install-Module -Name Dargslan.WinBootAnalyzer -Scope CurrentUser

# Or install for all users (requires admin)
Install-Module -Name Dargslan.WinBootAnalyzer -Scope AllUsers
```

## Quick Start

```powershell
# Import the module
Import-Module Dargslan.WinBootAnalyzer

# Run the main function
Get-BootAnalysis

# Get JSON output
Get-BootAnalysis -Json
```

## Functions

### `Get-BootAnalysis`

Measures boot time, identifies slow-starting services and applications, and provides optimization recommendations.

```powershell
# Basic usage
Get-BootAnalysis

# JSON output
Get-BootAnalysis -Json

# Export to file
Get-BootAnalysis -Json | Out-File report.json
```



## Use Cases

- **Performance Optimization**: Identify and remove slow startup items
- **Troubleshooting**: Investigate unexpected reboots and BSODs
- **Capacity Planning**: Track boot times for performance SLAs
- **Documentation**: Record startup configuration for change management
- **Automation**: Script startup optimization tasks

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

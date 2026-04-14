# Dargslan.WinPerfMon

> **Windows performance monitoring toolkit — CPU, memory, disk I/O, process analysis, bottleneck detection, and performance baselining**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinPerfMon-blue)](https://www.powershellgallery.com/packages/Dargslan.WinPerfMon)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
# Install from PowerShell Gallery
Install-Module -Name Dargslan.WinPerfMon -Scope CurrentUser

# Or install for all users (requires admin)
Install-Module -Name Dargslan.WinPerfMon -Scope AllUsers
```

## Quick Start

```powershell
# Import the module
Import-Module Dargslan.WinPerfMon

# Run the main function
Get-PerformanceReport

# Get JSON output
Get-PerformanceReport -Json
```

## Functions

### `Get-PerformanceReport`

Captures current CPU, memory, disk, and network performance metrics with bottleneck analysis.

```powershell
# Basic usage
Get-PerformanceReport

# JSON output
Get-PerformanceReport -Json

# Export to file
Get-PerformanceReport -Json | Out-File report.json
```



## Use Cases

- **Performance Monitoring**: Real-time system performance dashboards
- **Bottleneck Detection**: Identify CPU, memory, or I/O constraints
- **Capacity Planning**: Track resource trends for scaling decisions
- **Troubleshooting**: Find resource-hogging processes during incidents
- **Baseline Creation**: Establish normal performance metrics for comparison

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

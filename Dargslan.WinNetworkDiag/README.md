# Dargslan.WinNetworkDiag

> **Windows network diagnostics toolkit — connectivity testing, DNS analysis, port scanning, latency measurement, and network adapter monitoring**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinNetworkDiag-blue)](https://www.powershellgallery.com/packages/Dargslan.WinNetworkDiag)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
# Install from PowerShell Gallery
Install-Module -Name Dargslan.WinNetworkDiag -Scope CurrentUser

# Or install for all users (requires admin)
Install-Module -Name Dargslan.WinNetworkDiag -Scope AllUsers
```

## Quick Start

```powershell
# Import the module
Import-Module Dargslan.WinNetworkDiag

# Run the main function
Test-NetworkHealth

# Get JSON output
Test-NetworkHealth -Json
```

## Functions

### `Test-NetworkHealth`

Tests internet connectivity, DNS resolution, gateway reachability, and measures latency to common endpoints.

```powershell
# Basic usage
Test-NetworkHealth

# JSON output
Test-NetworkHealth -Json

# Export to file
Test-NetworkHealth -Json | Out-File report.json
```

### `Test-PortScan`

Tests TCP port connectivity to a target host. Useful for verifying firewall rules and service availability.

```powershell
# Basic usage
Test-PortScan

# JSON output
Test-PortScan -Json

# Export to file
Test-PortScan -Json | Out-File report.json
```



## Use Cases

- **Troubleshooting**: Diagnose network connectivity issues
- **Security**: Verify open ports match expected configuration
- **Monitoring**: Regular network health checks
- **Migration**: Verify connectivity after infrastructure changes
- **DNS Debugging**: Test DNS resolution and response times

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

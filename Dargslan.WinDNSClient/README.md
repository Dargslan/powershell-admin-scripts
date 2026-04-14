# Dargslan.WinDNSClient

> **Windows DNS client diagnostics toolkit — DNS configuration, resolution testing, cache analysis, NRPT rules, and DNS performance monitoring**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinDNSClient-blue)](https://www.powershellgallery.com/packages/Dargslan.WinDNSClient)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
# Install from PowerShell Gallery
Install-Module -Name Dargslan.WinDNSClient -Scope CurrentUser

# Or install for all users (requires admin)
Install-Module -Name Dargslan.WinDNSClient -Scope AllUsers
```

## Quick Start

```powershell
# Import the module
Import-Module Dargslan.WinDNSClient

# Run the main function
Get-DNSReport

# Get JSON output
Get-DNSReport -Json
```

## Functions

### `Get-DNSReport`

Analyzes DNS server configuration, tests resolution, checks cache health, and measures DNS response times.

```powershell
# Basic usage
Get-DNSReport

# JSON output
Get-DNSReport -Json

# Export to file
Get-DNSReport -Json | Out-File report.json
```



## Use Cases

- **DNS Troubleshooting**: Diagnose resolution failures and slow lookups
- **Configuration Audit**: Verify DNS server assignments
- **Performance**: Measure DNS response times
- **Cache Management**: Inspect and flush DNS cache
- **NRPT Review**: Check Name Resolution Policy Table rules

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

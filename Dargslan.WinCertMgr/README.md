# Dargslan.WinCertMgr

> **Windows certificate management toolkit — certificate inventory, expiry monitoring, chain validation, and certificate store auditing**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinCertMgr-blue)](https://www.powershellgallery.com/packages/Dargslan.WinCertMgr)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
# Install from PowerShell Gallery
Install-Module -Name Dargslan.WinCertMgr -Scope CurrentUser

# Or install for all users (requires admin)
Install-Module -Name Dargslan.WinCertMgr -Scope AllUsers
```

## Quick Start

```powershell
# Import the module
Import-Module Dargslan.WinCertMgr

# Run the main function
Get-CertificateReport

# Get JSON output
Get-CertificateReport -Json
```

## Functions

### `Get-CertificateReport`

Lists all certificates with expiry tracking, identifies expiring certificates, and validates certificate chains.

```powershell
# Basic usage
Get-CertificateReport

# JSON output
Get-CertificateReport -Json

# Export to file
Get-CertificateReport -Json | Out-File report.json
```



## Use Cases

- **Certificate Monitoring**: Prevent outages from expired certificates
- **PKI Management**: Inventory certificates across all stores
- **Security Audits**: Identify weak or untrusted certificates
- **Compliance**: Document certificate configurations
- **Automation**: Alert on certificates expiring within N days

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

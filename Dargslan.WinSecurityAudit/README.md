# Dargslan.WinSecurityAudit

> **Windows security hardening audit toolkit — CIS benchmark checks, UAC status, BitLocker, Windows Defender, audit policy, and security scoring**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinSecurityAudit-blue)](https://www.powershellgallery.com/packages/Dargslan.WinSecurityAudit)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
# Install from PowerShell Gallery
Install-Module -Name Dargslan.WinSecurityAudit -Scope CurrentUser

# Or install for all users (requires admin)
Install-Module -Name Dargslan.WinSecurityAudit -Scope AllUsers
```

## Quick Start

```powershell
# Import the module
Import-Module Dargslan.WinSecurityAudit

# Run the main function
Get-SecurityAudit

# Get JSON output
Get-SecurityAudit -Json
```

## Functions

### `Get-SecurityAudit`

Checks UAC, BitLocker, Defender, firewall, password policy, audit policy, and provides a security score based on CIS benchmarks.

```powershell
# Basic usage
Get-SecurityAudit

# JSON output
Get-SecurityAudit -Json

# Export to file
Get-SecurityAudit -Json | Out-File report.json
```



## Use Cases

- **CIS Benchmark Compliance**: Verify against CIS Windows Server benchmarks
- **Hardening Verification**: Confirm security settings after deployment
- **Risk Assessment**: Identify security gaps with scoring
- **Audit Preparation**: Generate reports for SOC2, ISO 27001, HIPAA
- **Baseline Comparison**: Track security posture changes over time

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

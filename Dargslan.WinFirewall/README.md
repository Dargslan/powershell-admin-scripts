# Dargslan.WinFirewall

> **Windows Firewall management and auditing toolkit — rule analysis, profile management, security assessment, logging, and rule export/import**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinFirewall-blue)](https://www.powershellgallery.com/packages/Dargslan.WinFirewall)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
# Install from PowerShell Gallery
Install-Module -Name Dargslan.WinFirewall -Scope CurrentUser

# Or install for all users (requires admin)
Install-Module -Name Dargslan.WinFirewall -Scope AllUsers
```

## Quick Start

```powershell
# Import the module
Import-Module Dargslan.WinFirewall

# Run the main function
Get-FirewallAudit

# Get JSON output
Get-FirewallAudit -Json
```

## Functions

### `Get-FirewallAudit`

Analyzes firewall profiles, rules, logging configuration, and identifies potential security issues. Provides a security score.

```powershell
# Basic usage
Get-FirewallAudit

# JSON output
Get-FirewallAudit -Json

# Export to file
Get-FirewallAudit -Json | Out-File report.json
```

### `Export-FirewallRules`

Exports all Windows Firewall rules to a file for backup, migration, or documentation purposes.

```powershell
# Basic usage
Export-FirewallRules

# JSON output
Export-FirewallRules -Json

# Export to file
Export-FirewallRules -Json | Out-File report.json
```



## Use Cases

- **Security Audits**: Assess firewall configuration against best practices
- **Compliance**: Document firewall rules for SOC2, ISO 27001, HIPAA audits
- **Migration**: Export/import rules when rebuilding servers
- **Incident Response**: Quickly review what network access is allowed
- **Hardening**: Identify overly permissive rules and fix them

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

# Dargslan.WinUserMgmt

> **Windows local user and group management toolkit — user audit, password policy, admin group check, account lockout, stale account detection**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinUserMgmt-blue)](https://www.powershellgallery.com/packages/Dargslan.WinUserMgmt)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
# Install from PowerShell Gallery
Install-Module -Name Dargslan.WinUserMgmt -Scope CurrentUser

# Or install for all users (requires admin)
Install-Module -Name Dargslan.WinUserMgmt -Scope AllUsers
```

## Quick Start

```powershell
# Import the module
Import-Module Dargslan.WinUserMgmt

# Run the main function
Get-UserSecurityAudit

# Get JSON output
Get-UserSecurityAudit -Json
```

## Functions

### `Get-UserSecurityAudit`

Audits all local user accounts for security issues: admin membership, password policy, disabled accounts, never-expiring passwords, and stale accounts.

```powershell
# Basic usage
Get-UserSecurityAudit

# JSON output
Get-UserSecurityAudit -Json

# Export to file
Get-UserSecurityAudit -Json | Out-File report.json
```

### `Get-PasswordPolicy`

Retrieves password complexity, length, history, and lockout policy settings.

```powershell
# Basic usage
Get-PasswordPolicy

# JSON output
Get-PasswordPolicy -Json

# Export to file
Get-PasswordPolicy -Json | Out-File report.json
```



## Use Cases

- **Security Audits**: Identify risky user configurations
- **Compliance**: Verify password policies meet standards (NIST, CIS)
- **Stale Account Cleanup**: Find and disable inactive accounts
- **Privilege Review**: Audit local admin group membership
- **Onboarding/Offboarding**: Track user account lifecycle

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

# Dargslan.WinEnvAudit

> **Windows environment variable audit toolkit — system/user variable inventory, PATH analysis, duplicate detection, and security review**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinEnvAudit-blue)](https://www.powershellgallery.com/packages/Dargslan.WinEnvAudit)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
Install-Module -Name Dargslan.WinEnvAudit -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinEnvAudit
Get-EnvAudit
Get-EnvAudit -Json
```

## Functions

### `Get-EnvAudit`

Lists all environment variables, analyzes PATH for issues, detects duplicates, and identifies security concerns.

```powershell
Get-EnvAudit
Get-EnvAudit -Json
Get-EnvAudit -Json | Out-File report.json
```



## Use Cases

- **PATH Cleanup**: Find and remove invalid or duplicate PATH entries
- **Security Review**: Detect sensitive data in environment variables
- **Troubleshooting**: Debug application startup issues caused by missing paths
- **Documentation**: Export environment configuration for reference
- **Migration**: Compare environment variables between systems

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

# Dargslan.WinGPOAudit

> **Windows Group Policy audit toolkit — applied GPO listing, policy result analysis, security policy verification, and GPO export**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinGPOAudit-blue)](https://www.powershellgallery.com/packages/Dargslan.WinGPOAudit)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
Install-Module -Name Dargslan.WinGPOAudit -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinGPOAudit
Get-GPOStatus
Get-GPOStatus -Json
```

## Functions

### `Get-GPOStatus`

Lists applied GPOs, checks policy results, and identifies security-relevant settings.

```powershell
Get-GPOStatus
Get-GPOStatus -Json
Get-GPOStatus -Json | Out-File report.json
```



## Use Cases

- **GPO Compliance**: Verify Group Policy is applied correctly
- **Security Baseline**: Check audit policies match security standards
- **Troubleshooting**: Debug GPO application issues
- **Documentation**: Export applied policies for change management
- **AD Administration**: Review policy inheritance and conflicts

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

# Dargslan.WinADTools

> **Active Directory query toolkit — user search, group membership, OU browser, password expiry reporting, and stale object detection**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinADTools-blue)](https://www.powershellgallery.com/packages/Dargslan.WinADTools)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
Install-Module -Name Dargslan.WinADTools -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinADTools
Get-ADHealthReport
Get-ADHealthReport -Json
```

## Functions

### `Get-ADHealthReport`

Reports domain controller status, replication health, user statistics, and identifies stale objects.

```powershell
Get-ADHealthReport
Get-ADHealthReport -Json
Get-ADHealthReport -Json | Out-File report.json
```



## Use Cases

- **AD Health Monitoring**: Track domain controller and replication status
- **User Management**: Find stale, locked, and expired accounts
- **Security Audits**: Identify users with passwords that never expire
- **Compliance**: Document AD configuration for audits
- **Cleanup**: Find empty groups and disabled accounts for removal

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

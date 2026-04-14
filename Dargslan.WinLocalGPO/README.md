# Dargslan.WinLocalGPO — 2026 Edition

> **Windows Local Group Policy editor toolkit — security options audit, user rights assignment, audit policy configuration, and local policy export (2026 Edition)**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinLocalGPO-blue)](https://www.powershellgallery.com/packages/Dargslan.WinLocalGPO)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)
[![2026 Edition](https://img.shields.io/badge/Edition-2026-green.svg)](https://dargslan.com)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
Install-Module -Name Dargslan.WinLocalGPO -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinLocalGPO
Get-LocalPolicyAudit
Get-LocalPolicyAudit -Json
```

## Functions

### `Get-LocalPolicyAudit`

Reports local security options, user rights assignments, audit policies, and security settings.

```powershell
Get-LocalPolicyAudit
Get-LocalPolicyAudit -Json
```



## Use Cases

- **Security Baseline**: Verify local policies match CIS/STIG benchmarks
- **Hardening**: Audit security options and user rights
- **Compliance**: Export policies for documentation
- **Troubleshooting**: Debug policy-related access issues
- **Change Management**: Compare policy configurations before and after changes

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

## License

MIT License — (c) 2026 Dargslan — [dargslan.com](https://dargslan.com)

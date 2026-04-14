# Dargslan.WinDefenderFW2 — 2026 Edition

> **Advanced Windows Defender Firewall toolkit v2 — rule optimization, connection security rules, IPsec audit, and firewall log parsing (2026 Edition)**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinDefenderFW2-blue)](https://www.powershellgallery.com/packages/Dargslan.WinDefenderFW2)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)
[![2026 Edition](https://img.shields.io/badge/Edition-2026-green.svg)](https://dargslan.com)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
Install-Module -Name Dargslan.WinDefenderFW2 -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinDefenderFW2
Get-FirewallAdvancedAudit
Get-FirewallAdvancedAudit -Json
```

## Functions

### `Get-FirewallAdvancedAudit`

Performs deep firewall audit including connection security rules, IPsec policies, firewall logs, and rule optimization.

```powershell
Get-FirewallAdvancedAudit
Get-FirewallAdvancedAudit -Json
```



## Use Cases

- **Advanced Firewall**: Deep analysis beyond basic rule listing
- **IPsec Management**: Audit connection security rules
- **Log Analysis**: Parse and analyze firewall logs
- **Rule Optimization**: Identify redundant or conflicting rules
- **Compliance**: Detailed firewall documentation for audits

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

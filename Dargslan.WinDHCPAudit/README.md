# Dargslan.WinDHCPAudit

> **Windows DHCP server audit toolkit — scope inventory, lease monitoring, IP utilization analysis, and reservation management**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinDHCPAudit-blue)](https://www.powershellgallery.com/packages/Dargslan.WinDHCPAudit)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
Install-Module -Name Dargslan.WinDHCPAudit -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinDHCPAudit
Get-DHCPReport
Get-DHCPReport -Json
```

## Functions

### `Get-DHCPReport`

Reports DHCP scope utilization, active leases, reservations, and identifies capacity issues.

```powershell
Get-DHCPReport
Get-DHCPReport -Json
Get-DHCPReport -Json | Out-File report.json
```



## Use Cases

- **IP Management**: Monitor DHCP scope utilization
- **Capacity Planning**: Identify scopes nearing exhaustion
- **Troubleshooting**: Debug DHCP lease and conflict issues
- **Documentation**: Export DHCP configuration for audits
- **Security**: Review DHCP reservations and authorized servers

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

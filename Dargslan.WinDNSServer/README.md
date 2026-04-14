# Dargslan.WinDNSServer

> **Windows DNS Server management toolkit — zone inventory, record audit, forwarder configuration, DNS analytics, and zone health monitoring**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinDNSServer-blue)](https://www.powershellgallery.com/packages/Dargslan.WinDNSServer)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
Install-Module -Name Dargslan.WinDNSServer -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinDNSServer
Get-DNSServerReport
Get-DNSServerReport -Json
```

## Functions

### `Get-DNSServerReport`

Lists DNS zones, record counts, forwarders, and server configuration for health assessment.

```powershell
Get-DNSServerReport
Get-DNSServerReport -Json
Get-DNSServerReport -Json | Out-File report.json
```



## Use Cases

- **DNS Management**: Inventory zones and record counts
- **Security Audit**: Review forwarder and recursion settings
- **Troubleshooting**: Debug DNS resolution issues server-side
- **Capacity Planning**: Track DNS query statistics
- **Migration**: Document DNS configuration before changes

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

# Dargslan.WinClusterMgr

> **Windows Failover Cluster management toolkit — cluster health, node status, resource group monitoring, quorum, and shared volume audit**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinClusterMgr-blue)](https://www.powershellgallery.com/packages/Dargslan.WinClusterMgr)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
Install-Module -Name Dargslan.WinClusterMgr -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinClusterMgr
Get-ClusterReport
Get-ClusterReport -Json
```

## Functions

### `Get-ClusterReport`

Reports cluster status, node health, resource groups, quorum configuration, and CSV status.

```powershell
Get-ClusterReport
Get-ClusterReport -Json
Get-ClusterReport -Json | Out-File report.json
```



## Use Cases

- **HA Monitoring**: Ensure cluster nodes are healthy and online
- **Resource Tracking**: Monitor resource group ownership and state
- **Quorum Validation**: Verify quorum configuration is correct
- **CSV Management**: Track shared volume capacity and health
- **Failover Testing**: Assess cluster readiness for planned maintenance

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

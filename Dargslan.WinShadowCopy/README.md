# Dargslan.WinShadowCopy

> **Windows Volume Shadow Copy (VSS) management toolkit — shadow copy inventory, storage analysis, schedule verification, and restore point tracking**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinShadowCopy-blue)](https://www.powershellgallery.com/packages/Dargslan.WinShadowCopy)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
Install-Module -Name Dargslan.WinShadowCopy -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinShadowCopy
Get-ShadowCopyReport
Get-ShadowCopyReport -Json
```

## Functions

### `Get-ShadowCopyReport`

Reports VSS shadow copies, storage allocation, scheduled tasks, and system restore points.

```powershell
Get-ShadowCopyReport
Get-ShadowCopyReport -Json
Get-ShadowCopyReport -Json | Out-File report.json
```



## Use Cases

- **Backup Verification**: Ensure shadow copies are being created
- **Storage Management**: Monitor VSS storage allocation
- **Disaster Recovery**: Track available restore points
- **Troubleshooting**: Debug VSS writer failures
- **Compliance**: Document backup and recovery capabilities

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

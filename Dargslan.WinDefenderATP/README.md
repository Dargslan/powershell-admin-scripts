# Dargslan.WinDefenderATP — 2026 Edition

> **Microsoft Defender for Endpoint status toolkit — advanced threat protection monitoring, attack surface reduction rules, controlled folder access, and exploit protection (2026 Edition)**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinDefenderATP-blue)](https://www.powershellgallery.com/packages/Dargslan.WinDefenderATP)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)
[![2026 Edition](https://img.shields.io/badge/Edition-2026-green.svg)](https://dargslan.com)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
Install-Module -Name Dargslan.WinDefenderATP -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinDefenderATP
Get-ATPStatus
Get-ATPStatus -Json
```

## Functions

### `Get-ATPStatus`

Reports Defender ATP onboarding, ASR rules, exploit protection, controlled folder access, and network protection.

```powershell
Get-ATPStatus
Get-ATPStatus -Json
```



## Use Cases

- **EDR Monitoring**: Verify Defender for Endpoint is fully active
- **ASR Management**: Audit Attack Surface Reduction rules
- **Compliance**: Document advanced security feature status
- **Threat Hunting**: Check exploit protection and controlled folder access
- **Exclusion Audit**: Review Defender exclusions for security gaps

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

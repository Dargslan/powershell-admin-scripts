# Dargslan.WinRegistryAudit

> **Windows Registry auditing toolkit — registry key analysis, security assessment, startup entries, autorun detection, and registry backup**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinRegistryAudit-blue)](https://www.powershellgallery.com/packages/Dargslan.WinRegistryAudit)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
Install-Module -Name Dargslan.WinRegistryAudit -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinRegistryAudit
Get-RegistryAudit
Get-RegistryAudit -Json
```

## Functions

### `Get-RegistryAudit`

Scans autorun locations, startup entries, security policies, and identifies suspicious registry modifications.

```powershell
Get-RegistryAudit
Get-RegistryAudit -Json
Get-RegistryAudit -Json | Out-File report.json
```

### `Export-RegistryBackup`

Exports important registry branches to .reg files for backup and disaster recovery.

```powershell
Export-RegistryBackup
Export-RegistryBackup -Json
Export-RegistryBackup -Json | Out-File report.json
```



## Use Cases

- **Security Audits**: Identify risky registry configurations
- **Malware Detection**: Find suspicious autorun entries
- **Compliance**: Verify UAC, RDP, and policy settings
- **Disaster Recovery**: Backup critical registry branches
- **Forensics**: Investigate registry-based persistence mechanisms

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

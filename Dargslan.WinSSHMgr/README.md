# Dargslan.WinSSHMgr — 2026 Edition

> **Windows OpenSSH server and client management toolkit — SSH config audit, key management, session monitoring, and security hardening (2026 Edition)**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinSSHMgr-blue)](https://www.powershellgallery.com/packages/Dargslan.WinSSHMgr)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)
[![2026 Edition](https://img.shields.io/badge/Edition-2026-green.svg)](https://dargslan.com)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
Install-Module -Name Dargslan.WinSSHMgr -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinSSHMgr
Get-SSHReport
Get-SSHReport -Json
```

## Functions

### `Get-SSHReport`

Reports SSH service status, sshd_config analysis, authorized keys, host keys, and security assessment.

```powershell
Get-SSHReport
Get-SSHReport -Json
```



## Use Cases

- **SSH Hardening**: Audit and improve SSH server security
- **Key Management**: Inventory and validate SSH keys
- **Compliance**: Verify SSH configuration meets security standards
- **Remote Access Audit**: Monitor SSH sessions and access patterns
- **Migration**: Document SSH configuration before server changes

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

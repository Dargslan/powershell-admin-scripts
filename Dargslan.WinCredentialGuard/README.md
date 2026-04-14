# Dargslan.WinCredentialGuard — 2026 Edition

> **Windows Credential Guard and virtualization-based security audit toolkit — VBS status, HVCI, Secure Boot, and credential isolation verification (2026 Edition)**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinCredentialGuard-blue)](https://www.powershellgallery.com/packages/Dargslan.WinCredentialGuard)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)
[![2026 Edition](https://img.shields.io/badge/Edition-2026-green.svg)](https://dargslan.com)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
Install-Module -Name Dargslan.WinCredentialGuard -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinCredentialGuard
Get-CredentialGuardStatus
Get-CredentialGuardStatus -Json
```

## Functions

### `Get-CredentialGuardStatus`

Reports virtualization-based security, Credential Guard, HVCI, Secure Boot, and Device Guard status.

```powershell
Get-CredentialGuardStatus
Get-CredentialGuardStatus -Json
```



## Use Cases

- **Security Hardening**: Verify VBS and Credential Guard are active
- **Zero Trust**: Validate hardware-based credential isolation
- **Compliance**: Document advanced security feature deployment
- **Risk Assessment**: Score systems against modern security standards
- **Fleet Audit**: Check Credential Guard status across endpoints

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

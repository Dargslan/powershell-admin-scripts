# Dargslan.WinTLSAudit — 2026 Edition

> **Windows TLS/SSL protocol audit toolkit — cipher suite analysis, protocol version checking, Schannel configuration, and HTTPS endpoint testing (2026 Edition)**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinTLSAudit-blue)](https://www.powershellgallery.com/packages/Dargslan.WinTLSAudit)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)
[![2026 Edition](https://img.shields.io/badge/Edition-2026-green.svg)](https://dargslan.com)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
Install-Module -Name Dargslan.WinTLSAudit -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinTLSAudit
Get-TLSAudit
Get-TLSAudit -Json
```

## Functions

### `Get-TLSAudit`

Analyzes Schannel protocols, cipher suites, certificate bindings, and tests HTTPS endpoint security.

```powershell
Get-TLSAudit
Get-TLSAudit -Json
```



## Use Cases

- **TLS Hardening**: Disable legacy SSL/TLS versions
- **Compliance**: Verify PCI-DSS, HIPAA TLS requirements
- **Endpoint Testing**: Verify HTTPS configurations remotely
- **Cipher Audit**: Review and optimize cipher suite order
- **Security Assessment**: Score TLS configuration against best practices

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

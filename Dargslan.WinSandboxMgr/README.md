# Dargslan.WinSandboxMgr — 2026 Edition

> **Windows Sandbox configuration toolkit — sandbox availability check, configuration builder, security assessment, and usage monitoring (2026 Edition)**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinSandboxMgr-blue)](https://www.powershellgallery.com/packages/Dargslan.WinSandboxMgr)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)
[![2026 Edition](https://img.shields.io/badge/Edition-2026-green.svg)](https://dargslan.com)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
Install-Module -Name Dargslan.WinSandboxMgr -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinSandboxMgr
Get-SandboxStatus
Get-SandboxStatus -Json
```

## Functions

### `Get-SandboxStatus`

Reports Windows Sandbox feature status, virtualization support, and Hyper-V requirements.

```powershell
Get-SandboxStatus
Get-SandboxStatus -Json
```



## Use Cases

- **Security Testing**: Verify Sandbox is available for malware analysis
- **Developer Tools**: Check Sandbox support for testing environments
- **Policy Compliance**: Audit Sandbox deployment across endpoints
- **Prerequisites**: Validate system meets Sandbox requirements
- **Configuration**: Generate and manage Sandbox configuration files

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

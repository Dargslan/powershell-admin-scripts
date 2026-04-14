# Dargslan.WinMemDiag — 2026 Edition

> **Windows memory diagnostics toolkit — RAM health check, memory pressure analysis, page file monitoring, and memory leak detection (2026 Edition)**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinMemDiag-blue)](https://www.powershellgallery.com/packages/Dargslan.WinMemDiag)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)
[![2026 Edition](https://img.shields.io/badge/Edition-2026-green.svg)](https://dargslan.com)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
Install-Module -Name Dargslan.WinMemDiag -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinMemDiag
Get-MemoryReport
Get-MemoryReport -Json
```

## Functions

### `Get-MemoryReport`

Reports physical memory status, memory pressure, page file usage, per-process memory, and leak detection.

```powershell
Get-MemoryReport
Get-MemoryReport -Json
```



## Use Cases

- **Memory Monitoring**: Track RAM usage and pressure
- **Leak Detection**: Identify processes consuming excessive memory
- **Capacity Planning**: Assess memory needs for scaling
- **Troubleshooting**: Diagnose out-of-memory and performance issues
- **Hardware Audit**: Inventory physical memory modules

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

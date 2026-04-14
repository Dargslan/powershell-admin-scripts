# Dargslan.WinGPUMon — 2026 Edition

> **Windows GPU monitoring toolkit — GPU utilization, VRAM usage, driver versions, multi-GPU management, and compute workload tracking (2026 Edition)**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinGPUMon-blue)](https://www.powershellgallery.com/packages/Dargslan.WinGPUMon)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)
[![2026 Edition](https://img.shields.io/badge/Edition-2026-green.svg)](https://dargslan.com)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
Install-Module -Name Dargslan.WinGPUMon -Scope CurrentUser
```

## Quick Start

```powershell
Import-Module Dargslan.WinGPUMon
Get-GPUReport
Get-GPUReport -Json
```

## Functions

### `Get-GPUReport`

Reports GPU hardware, driver versions, VRAM usage, display outputs, and compute capabilities.

```powershell
Get-GPUReport
Get-GPUReport -Json
```



## Use Cases

- **GPU Monitoring**: Track GPU status and driver versions
- **Display Management**: Inventory monitors and resolutions
- **Driver Management**: Identify outdated GPU drivers
- **Performance**: Monitor GPU-intensive processes
- **AI/ML Workloads**: Verify GPU compute capabilities

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

# Dargslan.WinDefender

> **Windows Defender antivirus management toolkit — protection status, scan management, threat history, exclusion audit, and definition updates**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinDefender-blue)](https://www.powershellgallery.com/packages/Dargslan.WinDefender)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
# Install from PowerShell Gallery
Install-Module -Name Dargslan.WinDefender -Scope CurrentUser

# Or install for all users (requires admin)
Install-Module -Name Dargslan.WinDefender -Scope AllUsers
```

## Quick Start

```powershell
# Import the module
Import-Module Dargslan.WinDefender

# Run the main function
Get-DefenderStatus

# Get JSON output
Get-DefenderStatus -Json
```

## Functions

### `Get-DefenderStatus`

Reports real-time protection, signature dates, scan history, and threat detection status.

```powershell
# Basic usage
Get-DefenderStatus

# JSON output
Get-DefenderStatus -Json

# Export to file
Get-DefenderStatus -Json | Out-File report.json
```

### `Get-DefenderThreats`

Lists recent malware and threat detections with severity, action taken, and file paths.

```powershell
# Basic usage
Get-DefenderThreats

# JSON output
Get-DefenderThreats -Json

# Export to file
Get-DefenderThreats -Json | Out-File report.json
```

### `Start-DefenderScan`

Initiates a Quick, Full, or Custom scan with optional path targeting.

```powershell
# Basic usage
Start-DefenderScan

# JSON output
Start-DefenderScan -Json

# Export to file
Start-DefenderScan -Json | Out-File report.json
```



## Use Cases

- **Security Monitoring**: Continuous Defender health monitoring
- **Incident Response**: Review threat detection history
- **Compliance**: Verify antivirus is active and definitions are current
- **Automation**: Schedule scans and signature updates via scripts
- **Fleet Management**: Check Defender status across multiple servers

## Requirements

- **PowerShell 5.1+** (Windows PowerShell) or **PowerShell 7+** (PowerShell Core)
- **Windows 10/11** or **Windows Server 2016+**
- Some functions require **Administrator** privileges for full data access

## More Dargslan Tools

| Resource | Link |
|----------|------|
| Homepage | [dargslan.com](https://dargslan.com) |
| Free Cheat Sheets | [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets) |
| eBooks | [dargslan.com/books](https://dargslan.com/books) |
| PyPI Tools (Linux) | [pypi.org/search/?q=dargslan](https://pypi.org/search/?q=dargslan) |
| PyPI Tools (Windows) | [pypi.org/search/?q=dargslan-win](https://pypi.org/search/?q=dargslan-win) |
| PowerShell Gallery | [powershellgallery.com/profiles/Dargslan](https://www.powershellgallery.com/profiles/Dargslan) |
| GitHub | [github.com/Dargslan](https://github.com/Dargslan) |

## License

MIT License — (c) 2025 Dargslan — [dargslan.com](https://dargslan.com)

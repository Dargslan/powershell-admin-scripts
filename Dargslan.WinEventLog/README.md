# Dargslan.WinEventLog

> **Windows Event Log analyzer toolkit — error detection, security event monitoring, log statistics, export, and real-time filtering**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan.WinEventLog-blue)](https://www.powershellgallery.com/packages/Dargslan.WinEventLog)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PowerShell 5.1+](https://img.shields.io/badge/PowerShell-5.1+-blue.svg)](https://docs.microsoft.com/en-us/powershell/)

Part of the [Dargslan Windows Admin Toolkit](https://dargslan.com) — professional tools for Windows system administrators.

## Installation

```powershell
# Install from PowerShell Gallery
Install-Module -Name Dargslan.WinEventLog -Scope CurrentUser

# Or install for all users (requires admin)
Install-Module -Name Dargslan.WinEventLog -Scope AllUsers
```

## Quick Start

```powershell
# Import the module
Import-Module Dargslan.WinEventLog

# Run the main function
Get-EventLogSummary

# Get JSON output
Get-EventLogSummary -Json
```

## Functions

### `Get-EventLogSummary`

Analyzes event logs for error counts, warning trends, and critical events in a specified time period.

```powershell
# Basic usage
Get-EventLogSummary

# JSON output
Get-EventLogSummary -Json

# Export to file
Get-EventLogSummary -Json | Out-File report.json
```

### `Get-CriticalEvents`

Retrieves the most recent critical and error events across System, Application, and Security logs.

```powershell
# Basic usage
Get-CriticalEvents

# JSON output
Get-CriticalEvents -Json

# Export to file
Get-CriticalEvents -Json | Out-File report.json
```



## Use Cases

- **SIEM Integration**: Pre-filter events before forwarding to SIEM
- **Incident Response**: Quickly find error patterns during outages
- **Daily Health Checks**: Automated morning log review
- **Compliance**: Monitor security events for audit requirements
- **Troubleshooting**: Correlate errors across application and system logs

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

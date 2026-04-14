# Dargslan Windows Admin Scripts

> Professional Windows administration tools by [Dargslan](https://dargslan.com) — PowerShell modules, Python CLI tools, cheat sheets, and eBooks for sysadmins.

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan-blue)](https://www.powershellgallery.com/profiles/Dargslan)
[![PyPI](https://img.shields.io/badge/PyPI-dargslan--win-orange)](https://pypi.org/search/?q=dargslan-win)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## 📦 Windows Admin Toolkit (PowerShell)

Professional PowerShell modules for Windows system administration. Each module is independently installable from the [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan).

| Module | Description | Install |
|--------|-------------|---------|
| [Dargslan.WinSysInfo](Dargslan.WinSysInfo/) | System information collector — OS, CPU, memory, disk, network, GPU, BIOS | `Install-Module Dargslan.WinSysInfo` |
| [Dargslan.WinFirewall](Dargslan.WinFirewall/) | Firewall management & auditing — rules, profiles, security scoring | `Install-Module Dargslan.WinFirewall` |
| [Dargslan.WinDefender](Dargslan.WinDefender/) | Windows Defender management — protection, scans, threat history | `Install-Module Dargslan.WinDefender` |
| [Dargslan.WinUserMgmt](Dargslan.WinUserMgmt/) | User & group management — audit, password policy, admin check | `Install-Module Dargslan.WinUserMgmt` |
| [Dargslan.WinServiceMgr](Dargslan.WinServiceMgr/) | Service management — health monitoring, failed detection, restart | `Install-Module Dargslan.WinServiceMgr` |
| [Dargslan.WinDiskMgr](Dargslan.WinDiskMgr/) | Disk management — health, SMART, cleanup, space analysis | `Install-Module Dargslan.WinDiskMgr` |
| [Dargslan.WinNetworkDiag](Dargslan.WinNetworkDiag/) | Network diagnostics — connectivity, DNS, port scan, latency | `Install-Module Dargslan.WinNetworkDiag` |
| [Dargslan.WinEventLog](Dargslan.WinEventLog/) | Event log analyzer — errors, security events, statistics | `Install-Module Dargslan.WinEventLog` |
| [Dargslan.WinUpdateMgr](Dargslan.WinUpdateMgr/) | Windows Update management — patches, hotfix history, compliance | `Install-Module Dargslan.WinUpdateMgr` |
| [Dargslan.WinPerfMon](Dargslan.WinPerfMon/) | Performance monitoring — CPU, memory, bottleneck detection | `Install-Module Dargslan.WinPerfMon` |
| [Dargslan.WinBackupAudit](Dargslan.WinBackupAudit/) | Backup auditing — VSS snapshots, backup verification | `Install-Module Dargslan.WinBackupAudit` |
| [Dargslan.WinSecurityAudit](Dargslan.WinSecurityAudit/) | Security hardening audit — CIS benchmarks, UAC, BitLocker | `Install-Module Dargslan.WinSecurityAudit` |
| [Dargslan.WinCertMgr](Dargslan.WinCertMgr/) | Certificate management — inventory, expiry, chain validation | `Install-Module Dargslan.WinCertMgr` |
| [Dargslan.WinScheduler](Dargslan.WinScheduler/) | Task Scheduler management — task audit, failed detection | `Install-Module Dargslan.WinScheduler` |
| [Dargslan.WinProcessMgr](Dargslan.WinProcessMgr/) | Process management — resource analysis, hung detection | `Install-Module Dargslan.WinProcessMgr` |
| [Dargslan.WinRDPMgr](Dargslan.WinRDPMgr/) | RDP management — session monitoring, security audit | `Install-Module Dargslan.WinRDPMgr` |
| [Dargslan.WinSMBMgr](Dargslan.WinSMBMgr/) | SMB share management — inventory, sessions, security | `Install-Module Dargslan.WinSMBMgr` |
| [Dargslan.WinDNSClient](Dargslan.WinDNSClient/) | DNS client diagnostics — configuration, resolution, cache | `Install-Module Dargslan.WinDNSClient` |
| [Dargslan.WinTimeMgr](Dargslan.WinTimeMgr/) | Time sync management — NTP, W32Time, timezone | `Install-Module Dargslan.WinTimeMgr` |
| [Dargslan.WinBootAnalyzer](Dargslan.WinBootAnalyzer/) | Boot performance analyzer — boot time, startup impact | `Install-Module Dargslan.WinBootAnalyzer` |

### Quick Start

```powershell
# Install a single module
Install-Module Dargslan.WinSysInfo -Scope CurrentUser

# Import and use
Import-Module Dargslan.WinSysInfo
Get-WinSystemReport

# Get JSON output
Get-WinSystemReport -Json

# Security audit with scoring
Install-Module Dargslan.WinSecurityAudit -Scope CurrentUser
Import-Module Dargslan.WinSecurityAudit
Get-SecurityAudit
```

## 🐍 Windows Python CLI Tools

119 Windows Python CLI packages in [`python-windows-tools/`](python-windows-tools/). Install via pip:

```bash
pip install dargslan-win-sysinfo
dargslan-win-sysinfo
```

See the [python-windows-tools](python-windows-tools/) directory for all available packages.

## 📚 More from Dargslan

| Resource | Link |
|----------|------|
| 🏠 Homepage | [dargslan.com](https://dargslan.com) |
| 📄 Free Cheat Sheets | [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets) |
| 📖 DevOps & Security eBooks | [dargslan.com/books](https://dargslan.com/books) |
| 🐧 Linux PyPI Tools (120+) | [pypi.org/search/?q=dargslan](https://pypi.org/search/?q=dargslan) |
| 🪟 Windows PyPI Tools (119) | [pypi.org/search/?q=dargslan-win](https://pypi.org/search/?q=dargslan-win) |
| ⚡ PowerShell Gallery | [powershellgallery.com/profiles/Dargslan](https://www.powershellgallery.com/profiles/Dargslan) |

## License

MIT License — (c) 2025 Dargslan — [dargslan.com](https://dargslan.com)

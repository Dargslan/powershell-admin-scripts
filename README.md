# Dargslan Windows Admin Scripts

> Professional Windows administration tools by [Dargslan](https://dargslan.com) — 40 PowerShell modules, 119 Python CLI tools, cheat sheets, and eBooks for sysadmins.

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan-blue)](https://www.powershellgallery.com/profiles/Dargslan)
[![PyPI](https://img.shields.io/badge/PyPI-dargslan--win-orange)](https://pypi.org/search/?q=dargslan-win)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## 📦 Windows Admin Toolkit — 40 PowerShell Modules

Professional PowerShell modules for Windows system administration. Each module is independently installable from the [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan).

### Core System Administration

| Module | Description | Install |
|--------|-------------|---------|
| [Dargslan.WinSysInfo](Dargslan.WinSysInfo/) | System information — OS, CPU, memory, disk, network, GPU, BIOS | `Install-Module Dargslan.WinSysInfo` |
| [Dargslan.WinPerfMon](Dargslan.WinPerfMon/) | Performance monitoring — CPU, memory, bottleneck detection | `Install-Module Dargslan.WinPerfMon` |
| [Dargslan.WinProcessMgr](Dargslan.WinProcessMgr/) | Process management — resource analysis, hung process detection | `Install-Module Dargslan.WinProcessMgr` |
| [Dargslan.WinServiceMgr](Dargslan.WinServiceMgr/) | Service management — health monitoring, failed detection, restart | `Install-Module Dargslan.WinServiceMgr` |
| [Dargslan.WinEventLog](Dargslan.WinEventLog/) | Event log analyzer — errors, security events, statistics | `Install-Module Dargslan.WinEventLog` |
| [Dargslan.WinScheduler](Dargslan.WinScheduler/) | Task Scheduler management — task audit, failed detection | `Install-Module Dargslan.WinScheduler` |
| [Dargslan.WinBootAnalyzer](Dargslan.WinBootAnalyzer/) | Boot performance analyzer — boot time, startup impact | `Install-Module Dargslan.WinBootAnalyzer` |
| [Dargslan.WinTaskbarMgr](Dargslan.WinTaskbarMgr/) | Startup optimization — autostart analysis, boot optimization | `Install-Module Dargslan.WinTaskbarMgr` |
| [Dargslan.WinWMIQuery](Dargslan.WinWMIQuery/) | WMI system inventory — hardware, software, configuration | `Install-Module Dargslan.WinWMIQuery` |
| [Dargslan.WinPowerCfg](Dargslan.WinPowerCfg/) | Power configuration — power plans, battery, sleep/hibernate | `Install-Module Dargslan.WinPowerCfg` |
| [Dargslan.WinDriverMgr](Dargslan.WinDriverMgr/) | Driver management — inventory, unsigned detection, problem devices | `Install-Module Dargslan.WinDriverMgr` |
| [Dargslan.WinEnvAudit](Dargslan.WinEnvAudit/) | Environment variable audit — PATH analysis, duplicate detection | `Install-Module Dargslan.WinEnvAudit` |

### Security & Compliance

| Module | Description | Install |
|--------|-------------|---------|
| [Dargslan.WinSecurityAudit](Dargslan.WinSecurityAudit/) | Security hardening audit — CIS benchmarks, UAC, BitLocker scoring | `Install-Module Dargslan.WinSecurityAudit` |
| [Dargslan.WinFirewall](Dargslan.WinFirewall/) | Firewall management & auditing — rules, profiles, security scoring | `Install-Module Dargslan.WinFirewall` |
| [Dargslan.WinDefender](Dargslan.WinDefender/) | Windows Defender — protection status, scans, threat history | `Install-Module Dargslan.WinDefender` |
| [Dargslan.WinUserMgmt](Dargslan.WinUserMgmt/) | User & group management — audit, password policy, admin check | `Install-Module Dargslan.WinUserMgmt` |
| [Dargslan.WinBitLocker](Dargslan.WinBitLocker/) | BitLocker encryption — status, TPM, recovery keys, compliance | `Install-Module Dargslan.WinBitLocker` |
| [Dargslan.WinRegistryAudit](Dargslan.WinRegistryAudit/) | Registry auditing — autorun, security policies, suspicious keys | `Install-Module Dargslan.WinRegistryAudit` |
| [Dargslan.WinGPOAudit](Dargslan.WinGPOAudit/) | Group Policy audit — applied GPOs, audit policies, security | `Install-Module Dargslan.WinGPOAudit` |
| [Dargslan.WinCertMgr](Dargslan.WinCertMgr/) | Certificate management — inventory, expiry, chain validation | `Install-Module Dargslan.WinCertMgr` |

### Networking

| Module | Description | Install |
|--------|-------------|---------|
| [Dargslan.WinNetworkDiag](Dargslan.WinNetworkDiag/) | Network diagnostics — connectivity, DNS, port scan, latency | `Install-Module Dargslan.WinNetworkDiag` |
| [Dargslan.WinNetStat](Dargslan.WinNetStat/) | Network statistics — TCP/UDP connections, listening ports | `Install-Module Dargslan.WinNetStat` |
| [Dargslan.WinDNSClient](Dargslan.WinDNSClient/) | DNS client diagnostics — configuration, resolution, cache | `Install-Module Dargslan.WinDNSClient` |
| [Dargslan.WinSMBMgr](Dargslan.WinSMBMgr/) | SMB share management — inventory, sessions, SMB1 detection | `Install-Module Dargslan.WinSMBMgr` |
| [Dargslan.WinRDPMgr](Dargslan.WinRDPMgr/) | RDP management — session monitoring, security audit, NLA | `Install-Module Dargslan.WinRDPMgr` |

### Storage & Backup

| Module | Description | Install |
|--------|-------------|---------|
| [Dargslan.WinDiskMgr](Dargslan.WinDiskMgr/) | Disk management — health, SMART, cleanup, space analysis | `Install-Module Dargslan.WinDiskMgr` |
| [Dargslan.WinStorageMgr](Dargslan.WinStorageMgr/) | Storage Spaces — pool monitoring, virtual disk health, capacity | `Install-Module Dargslan.WinStorageMgr` |
| [Dargslan.WinBackupAudit](Dargslan.WinBackupAudit/) | Backup auditing — VSS snapshots, backup verification | `Install-Module Dargslan.WinBackupAudit` |
| [Dargslan.WinShadowCopy](Dargslan.WinShadowCopy/) | Volume Shadow Copy — VSS inventory, restore points, storage | `Install-Module Dargslan.WinShadowCopy` |

### Server Roles & Infrastructure

| Module | Description | Install |
|--------|-------------|---------|
| [Dargslan.WinADTools](Dargslan.WinADTools/) | Active Directory — user search, group membership, replication | `Install-Module Dargslan.WinADTools` |
| [Dargslan.WinDHCPAudit](Dargslan.WinDHCPAudit/) | DHCP server audit — scope utilization, leases, reservations | `Install-Module Dargslan.WinDHCPAudit` |
| [Dargslan.WinDNSServer](Dargslan.WinDNSServer/) | DNS Server management — zones, records, forwarders | `Install-Module Dargslan.WinDNSServer` |
| [Dargslan.WinIISMgr](Dargslan.WinIISMgr/) | IIS web server — sites, app pools, SSL bindings, health | `Install-Module Dargslan.WinIISMgr` |
| [Dargslan.WinHyperV](Dargslan.WinHyperV/) | Hyper-V management — VM inventory, checkpoints, virtual switches | `Install-Module Dargslan.WinHyperV` |
| [Dargslan.WinClusterMgr](Dargslan.WinClusterMgr/) | Failover Cluster — node status, resource groups, CSV, quorum | `Install-Module Dargslan.WinClusterMgr` |
| [Dargslan.WinWSUSMgr](Dargslan.WinWSUSMgr/) | WSUS management — update compliance, client reporting, sync | `Install-Module Dargslan.WinWSUSMgr` |
| [Dargslan.WinSQLHealth](Dargslan.WinSQLHealth/) | SQL Server health — databases, backups, agent jobs, performance | `Install-Module Dargslan.WinSQLHealth` |

### Updates & Time

| Module | Description | Install |
|--------|-------------|---------|
| [Dargslan.WinUpdateMgr](Dargslan.WinUpdateMgr/) | Windows Update — patches, hotfix history, compliance | `Install-Module Dargslan.WinUpdateMgr` |
| [Dargslan.WinTimeMgr](Dargslan.WinTimeMgr/) | Time sync management — NTP, W32Time, timezone | `Install-Module Dargslan.WinTimeMgr` |
| [Dargslan.WinPrintMgr](Dargslan.WinPrintMgr/) | Print management — printers, queues, spooler, drivers | `Install-Module Dargslan.WinPrintMgr` |

### Quick Start

```powershell
# Install any module
Install-Module Dargslan.WinSysInfo -Scope CurrentUser

# Import and use
Import-Module Dargslan.WinSysInfo
Get-WinSystemReport

# JSON output for automation
Get-WinSystemReport -Json

# Security audit with scoring
Install-Module Dargslan.WinSecurityAudit -Scope CurrentUser
Import-Module Dargslan.WinSecurityAudit
Get-SecurityAudit

# Full network diagnostics
Install-Module Dargslan.WinNetworkDiag -Scope CurrentUser
Import-Module Dargslan.WinNetworkDiag
Test-NetworkHealth
Test-PortScan -Target 192.168.1.1

# BitLocker compliance check
Install-Module Dargslan.WinBitLocker -Scope CurrentUser
Import-Module Dargslan.WinBitLocker
Get-BitLockerReport
```

### Install All Modules

```powershell
# Install all 40 Dargslan Windows Admin modules at once
$modules = @(
    'Dargslan.WinSysInfo', 'Dargslan.WinFirewall', 'Dargslan.WinDefender',
    'Dargslan.WinUserMgmt', 'Dargslan.WinServiceMgr', 'Dargslan.WinDiskMgr',
    'Dargslan.WinNetworkDiag', 'Dargslan.WinEventLog', 'Dargslan.WinUpdateMgr',
    'Dargslan.WinPerfMon', 'Dargslan.WinBackupAudit', 'Dargslan.WinSecurityAudit',
    'Dargslan.WinCertMgr', 'Dargslan.WinScheduler', 'Dargslan.WinProcessMgr',
    'Dargslan.WinRDPMgr', 'Dargslan.WinSMBMgr', 'Dargslan.WinDNSClient',
    'Dargslan.WinTimeMgr', 'Dargslan.WinBootAnalyzer', 'Dargslan.WinRegistryAudit',
    'Dargslan.WinGPOAudit', 'Dargslan.WinPowerCfg', 'Dargslan.WinPrintMgr',
    'Dargslan.WinHyperV', 'Dargslan.WinIISMgr', 'Dargslan.WinWMIQuery',
    'Dargslan.WinStorageMgr', 'Dargslan.WinClusterMgr', 'Dargslan.WinADTools',
    'Dargslan.WinDHCPAudit', 'Dargslan.WinDNSServer', 'Dargslan.WinWSUSMgr',
    'Dargslan.WinSQLHealth', 'Dargslan.WinBitLocker', 'Dargslan.WinNetStat',
    'Dargslan.WinEnvAudit', 'Dargslan.WinDriverMgr', 'Dargslan.WinShadowCopy',
    'Dargslan.WinTaskbarMgr'
)
$modules | ForEach-Object { Install-Module $_ -Scope CurrentUser -Force }
```

## 🐍 Windows Python CLI Tools (119 packages)

119 Windows Python CLI packages in [`python-windows-tools/`](python-windows-tools/). Each provides a command-line tool for Windows system administration tasks using PowerShell, WMI, and Win32 APIs.

```bash
# Install any tool
pip install dargslan-win-sysinfo
dargslan-win-sysinfo

pip install dargslan-win-firewall-audit
dargslan-win-firewall-audit

pip install dargslan-win-security-scan
dargslan-win-security-scan
```

See the [python-windows-tools/](python-windows-tools/) directory for all 119 available packages.

## 📚 More from Dargslan

| Resource | Description |
|----------|-------------|
| [dargslan.com](https://dargslan.com) | Homepage — eBooks, tools, and resources |
| [Free Cheat Sheets](https://dargslan.com/cheat-sheets) | 380+ downloadable PDF cheat sheets |
| [DevOps & Security eBooks](https://dargslan.com/books) | 210+ professional eBooks |
| [Linux PyPI Tools (120+)](https://pypi.org/search/?q=dargslan) | Linux system admin CLI tools |
| [Windows PyPI Tools (119)](https://pypi.org/search/?q=dargslan-win) | Windows system admin CLI tools |
| [PowerShell Gallery (40)](https://www.powershellgallery.com/profiles/Dargslan) | Windows Admin Toolkit modules |
| [Blog](https://dargslan.com/blog) | 430+ SEO-optimized IT articles |

## Requirements

- **PowerShell 5.1+** (Windows PowerShell) or **PowerShell 7+** (PowerShell Core)
- **Windows 10/11** or **Windows Server 2016+**
- Some modules require **Administrator** privileges for full data access
- Server role modules (AD, DHCP, DNS, IIS, Hyper-V, WSUS, SQL) require the corresponding role/feature installed

## License

MIT License — (c) 2025 Dargslan — [dargslan.com](https://dargslan.com)

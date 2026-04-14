# Dargslan Windows Admin Scripts

> Professional Windows administration tools by [Dargslan](https://dargslan.com) — 80 PowerShell modules, 119 Python CLI tools, cheat sheets, and eBooks for sysadmins.

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-60%20Modules-blue)](https://www.powershellgallery.com/profiles/Dargslan)
[![PyPI](https://img.shields.io/badge/PyPI-dargslan--win-orange)](https://pypi.org/search/?q=dargslan-win)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![2026 Edition](https://img.shields.io/badge/Edition-2026-green.svg)](https://dargslan.com)

## 📦 Windows Admin Toolkit — 60 PowerShell Modules

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

### 🆕 Advanced Security — 2026 Edition

| Module | Description | Install |
|--------|-------------|---------|
| [Dargslan.WinDefenderATP](Dargslan.WinDefenderATP/) | Defender for Endpoint — ASR rules, exploit protection, EDR status | `Install-Module Dargslan.WinDefenderATP` |
| [Dargslan.WinDefenderFW2](Dargslan.WinDefenderFW2/) | Advanced Firewall v2 — IPsec, connection security rules, log parsing | `Install-Module Dargslan.WinDefenderFW2` |
| [Dargslan.WinAppLocker](Dargslan.WinAppLocker/) | AppLocker policy audit — rule inventory, enforcement, event analysis | `Install-Module Dargslan.WinAppLocker` |
| [Dargslan.WinWDAC](Dargslan.WinWDAC/) | WDAC policy audit — code integrity, Smart App Control, reputation | `Install-Module Dargslan.WinWDAC` |
| [Dargslan.WinCredentialGuard](Dargslan.WinCredentialGuard/) | Credential Guard — VBS, HVCI, Secure Boot, TPM verification | `Install-Module Dargslan.WinCredentialGuard` |
| [Dargslan.WinTLSAudit](Dargslan.WinTLSAudit/) | TLS/SSL audit — cipher suites, Schannel, HTTPS endpoint testing | `Install-Module Dargslan.WinTLSAudit` |
| [Dargslan.WinSSHMgr](Dargslan.WinSSHMgr/) | OpenSSH management — sshd config, key audit, security scoring | `Install-Module Dargslan.WinSSHMgr` |
| [Dargslan.WinWinRMMgr](Dargslan.WinWinRMMgr/) | WinRM audit — listeners, trusted hosts, authentication, security | `Install-Module Dargslan.WinWinRMMgr` |
| [Dargslan.WinUSBGuard](Dargslan.WinUSBGuard/) | USB device security — device control, removable storage, DLP | `Install-Module Dargslan.WinUSBGuard` |
| [Dargslan.WinLocalGPO](Dargslan.WinLocalGPO/) | Local Group Policy — security options, user rights, audit policy | `Install-Module Dargslan.WinLocalGPO` |
| [Dargslan.WinPowerShellAudit](Dargslan.WinPowerShellAudit/) | PowerShell security — execution policy, logging, CLM, JEA audit | `Install-Module Dargslan.WinPowerShellAudit` |

### Networking

| Module | Description | Install |
|--------|-------------|---------|
| [Dargslan.WinNetworkDiag](Dargslan.WinNetworkDiag/) | Network diagnostics — connectivity, DNS, port scan, latency | `Install-Module Dargslan.WinNetworkDiag` |
| [Dargslan.WinNetStat](Dargslan.WinNetStat/) | Network statistics — TCP/UDP connections, listening ports | `Install-Module Dargslan.WinNetStat` |
| [Dargslan.WinDNSClient](Dargslan.WinDNSClient/) | DNS client diagnostics — configuration, resolution, cache | `Install-Module Dargslan.WinDNSClient` |
| [Dargslan.WinSMBMgr](Dargslan.WinSMBMgr/) | SMB share management — inventory, sessions, SMB1 detection | `Install-Module Dargslan.WinSMBMgr` |
| [Dargslan.WinRDPMgr](Dargslan.WinRDPMgr/) | RDP management — session monitoring, security audit, NLA | `Install-Module Dargslan.WinRDPMgr` |
| [Dargslan.WinNetworkProfiler](Dargslan.WinNetworkProfiler/) | Network profiling — adapter analysis, WiFi audit, NIC teaming 🆕 | `Install-Module Dargslan.WinNetworkProfiler` |

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

### 🆕 Modern Platform — 2026 Edition

| Module | Description | Install |
|--------|-------------|---------|
| [Dargslan.WinContainerMgr](Dargslan.WinContainerMgr/) | Docker/Container management — inventory, images, cleanup, monitoring | `Install-Module Dargslan.WinContainerMgr` |
| [Dargslan.WinWSLMgr](Dargslan.WinWSLMgr/) | WSL management — distro inventory, config, resource monitoring | `Install-Module Dargslan.WinWSLMgr` |
| [Dargslan.WinSandboxMgr](Dargslan.WinSandboxMgr/) | Windows Sandbox — availability, config builder, prerequisites | `Install-Module Dargslan.WinSandboxMgr` |
| [Dargslan.WinIntuneMgr](Dargslan.WinIntuneMgr/) | Intune/MDM — enrollment status, compliance, AAD join verification | `Install-Module Dargslan.WinIntuneMgr` |
| [Dargslan.WinAutopilot](Dargslan.WinAutopilot/) | Autopilot diagnostics — hardware hash, profile, provisioning logs | `Install-Module Dargslan.WinAutopilot` |
| [Dargslan.WinEdgeMgr](Dargslan.WinEdgeMgr/) | Edge browser management — policies, extensions, profiles, security | `Install-Module Dargslan.WinEdgeMgr` |

### Performance & Hardware

| Module | Description | Install |
|--------|-------------|---------|
| [Dargslan.WinMemDiag](Dargslan.WinMemDiag/) | Memory diagnostics — RAM health, page file, leak detection 🆕 | `Install-Module Dargslan.WinMemDiag` |
| [Dargslan.WinGPUMon](Dargslan.WinGPUMon/) | GPU monitoring — utilization, VRAM, drivers, multi-GPU 🆕 | `Install-Module Dargslan.WinGPUMon` |

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

# 2026 Edition — Advanced security audit
Install-Module Dargslan.WinCredentialGuard -Scope CurrentUser
Import-Module Dargslan.WinCredentialGuard
Get-CredentialGuardStatus

# TLS/SSL security check
Install-Module Dargslan.WinTLSAudit -Scope CurrentUser
Import-Module Dargslan.WinTLSAudit
Get-TLSAudit -TestEndpoint "example.com"

# Container management
Install-Module Dargslan.WinContainerMgr -Scope CurrentUser
Import-Module Dargslan.WinContainerMgr
Get-ContainerReport

# PowerShell security audit
Install-Module Dargslan.WinPowerShellAudit -Scope CurrentUser
Import-Module Dargslan.WinPowerShellAudit
Get-PowerShellAudit
```

### Install All 80 Modules

```powershell
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
    'Dargslan.WinTaskbarMgr',
    # 2026 Edition
    'Dargslan.WinContainerMgr', 'Dargslan.WinSSHMgr', 'Dargslan.WinTLSAudit',
    'Dargslan.WinWinRMMgr', 'Dargslan.WinDefenderATP', 'Dargslan.WinAppLocker',
    'Dargslan.WinCredentialGuard', 'Dargslan.WinWSLMgr', 'Dargslan.WinSandboxMgr',
    'Dargslan.WinWDAC', 'Dargslan.WinLocalGPO', 'Dargslan.WinMemDiag',
    'Dargslan.WinGPUMon', 'Dargslan.WinUSBGuard', 'Dargslan.WinIntuneMgr',
    'Dargslan.WinAutopilot', 'Dargslan.WinDefenderFW2', 'Dargslan.WinNetworkProfiler',
    'Dargslan.WinEdgeMgr', 'Dargslan.WinPowerShellAudit',
    # Batch 4 — 2026 Edition
    'Dargslan.WinNuGetAudit', 'Dargslan.WinChocolateyAudit', 'Dargslan.WinWinGetAudit',
    'Dargslan.WinVSSAdmin', 'Dargslan.WinSMARTHealth', 'Dargslan.WinWindowsFeatures',
    'Dargslan.WinDotNetRuntime', 'Dargslan.WinJavaAudit', 'Dargslan.WinPythonAudit',
    'Dargslan.WinNodeJSAudit', 'Dargslan.WinGitAudit', 'Dargslan.WinVSCodeAudit',
    'Dargslan.WinIISCryptoAudit', 'Dargslan.WinSecureBootAudit', 'Dargslan.WinLogonAudit',
    'Dargslan.WinSMTPRelay', 'Dargslan.WinSNMPAudit', 'Dargslan.WinSharedFolders',
    'Dargslan.WinRecoveryEnv', 'Dargslan.WinBrowserSec'
)
$modules | ForEach-Object { Install-Module $_ -Scope CurrentUser -Force }
```

### 🆕 Developer Tools & Runtimes — 2026 Edition

| Module | Description | Install |
|--------|-------------|----------|
| [Dargslan.WinNuGetAudit](Dargslan.WinNuGetAudit/) | NuGet/.NET package audit, SDK versions, vulnerability scan | `Install-Module Dargslan.WinNuGetAudit` |
| [Dargslan.WinChocolateyAudit](Dargslan.WinChocolateyAudit/) | Chocolatey package manager — packages, sources, features | `Install-Module Dargslan.WinChocolateyAudit` |
| [Dargslan.WinWinGetAudit](Dargslan.WinWinGetAudit/) | Windows Package Manager (winget) — apps, updates, sources | `Install-Module Dargslan.WinWinGetAudit` |
| [Dargslan.WinDotNetRuntime](Dargslan.WinDotNetRuntime/) | .NET Framework/Runtime audit — versions, CLR, assemblies | `Install-Module Dargslan.WinDotNetRuntime` |
| [Dargslan.WinJavaAudit](Dargslan.WinJavaAudit/) | Java JDK/JRE audit — versions, JAVA_HOME, installations | `Install-Module Dargslan.WinJavaAudit` |
| [Dargslan.WinPythonAudit](Dargslan.WinPythonAudit/) | Python installation audit — versions, pip, PATH validation | `Install-Module Dargslan.WinPythonAudit` |
| [Dargslan.WinNodeJSAudit](Dargslan.WinNodeJSAudit/) | Node.js/npm audit — versions, global packages, nvm, config | `Install-Module Dargslan.WinNodeJSAudit` |
| [Dargslan.WinGitAudit](Dargslan.WinGitAudit/) | Git audit — config, SSH keys, credential helpers, aliases | `Install-Module Dargslan.WinGitAudit` |
| [Dargslan.WinVSCodeAudit](Dargslan.WinVSCodeAudit/) | VS Code audit — extensions, settings, workspace trust | `Install-Module Dargslan.WinVSCodeAudit` |

### 🆕 System Diagnostics — 2026 Edition

| Module | Description | Install |
|--------|-------------|----------|
| [Dargslan.WinSMARTHealth](Dargslan.WinSMARTHealth/) | Disk SMART health — temperature, wear, failure prediction | `Install-Module Dargslan.WinSMARTHealth` |
| [Dargslan.WinVSSAdmin](Dargslan.WinVSSAdmin/) | VSS administration — writers, providers, shadow storage | `Install-Module Dargslan.WinVSSAdmin` |
| [Dargslan.WinWindowsFeatures](Dargslan.WinWindowsFeatures/) | Windows Features/Roles — installed, available, capabilities | `Install-Module Dargslan.WinWindowsFeatures` |
| [Dargslan.WinSecureBootAudit](Dargslan.WinSecureBootAudit/) | Secure Boot/UEFI — boot chain, DBX, firmware security | `Install-Module Dargslan.WinSecureBootAudit` |
| [Dargslan.WinLogonAudit](Dargslan.WinLogonAudit/) | Logon security — history, failed attempts, lockouts | `Install-Module Dargslan.WinLogonAudit` |
| [Dargslan.WinRecoveryEnv](Dargslan.WinRecoveryEnv/) | Recovery Environment — WinRE, restore points, reset | `Install-Module Dargslan.WinRecoveryEnv` |
| [Dargslan.WinBrowserSec](Dargslan.WinBrowserSec/) | Browser security — Chrome/Edge/Firefox versions, policies | `Install-Module Dargslan.WinBrowserSec` |
| [Dargslan.WinIISCryptoAudit](Dargslan.WinIISCryptoAudit/) | IIS Crypto — cipher suites, protocol compliance, best practices | `Install-Module Dargslan.WinIISCryptoAudit` |
| [Dargslan.WinSMTPRelay](Dargslan.WinSMTPRelay/) | SMTP relay audit — service, queue, relay restrictions | `Install-Module Dargslan.WinSMTPRelay` |
| [Dargslan.WinSNMPAudit](Dargslan.WinSNMPAudit/) | SNMP audit — community strings, traps, permitted managers | `Install-Module Dargslan.WinSNMPAudit` |
| [Dargslan.WinSharedFolders](Dargslan.WinSharedFolders/) | Shared folders — permissions, open files, sessions, hidden | `Install-Module Dargslan.WinSharedFolders` |

## 🐍 Windows Python CLI Tools (119 packages)

119 Windows Python CLI packages in [`python-windows-tools/`](python-windows-tools/). Each provides a command-line tool for Windows system administration tasks using PowerShell, WMI, and Win32 APIs.

```bash
pip install dargslan-win-sysinfo
dargslan-win-sysinfo
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
| [PowerShell Gallery (80)](https://www.powershellgallery.com/profiles/Dargslan) | Windows Admin Toolkit modules |
| [Blog](https://dargslan.com/blog) | 430+ SEO-optimized IT articles |

## Requirements

- **PowerShell 5.1+** (Windows PowerShell) or **PowerShell 7+** (PowerShell Core)
- **Windows 10/11** or **Windows Server 2016+**
- Some modules require **Administrator** privileges for full data access
- Server role modules (AD, DHCP, DNS, IIS, Hyper-V, WSUS, SQL) require the corresponding role/feature
- 2026 Edition modules may require Windows 11 23H2+ for full feature support

## License

MIT License — (c) 2025-2026 Dargslan — [dargslan.com](https://dargslan.com)

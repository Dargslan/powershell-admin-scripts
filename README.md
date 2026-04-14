# 🛡️ Dargslan Windows Admin Toolkit — 140 PowerShell Modules

> **The most comprehensive Windows administration toolkit on PowerShell Gallery — 140 professional modules for system administrators, security engineers, and DevOps professionals.**

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-140%20Modules-blue)](https://www.powershellgallery.com/profiles/Dargslan)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![2026 Edition](https://img.shields.io/badge/Edition-2026-green.svg)](https://dargslan.com)
[![Windows](https://img.shields.io/badge/Platform-Windows-0078D6.svg)](https://dargslan.com)

## 🚀 Quick Install — All 140 Modules

```powershell
@(
    # Batch 1 — Core System Administration
    'Dargslan.WinSysInfo', 'Dargslan.WinFirewall', 'Dargslan.WinDefender',
    'Dargslan.WinUserMgmt', 'Dargslan.WinServiceMgr', 'Dargslan.WinDiskMgr',
    'Dargslan.WinNetworkDiag', 'Dargslan.WinEventLog', 'Dargslan.WinUpdateMgr',
    'Dargslan.WinPerfMon', 'Dargslan.WinBackupAudit', 'Dargslan.WinSecurityAudit',
    'Dargslan.WinCertMgr', 'Dargslan.WinScheduler', 'Dargslan.WinProcessMgr',
    'Dargslan.WinRDPMgr', 'Dargslan.WinSMBMgr', 'Dargslan.WinDNSClient',
    'Dargslan.WinTimeMgr', 'Dargslan.WinBootAnalyzer',
    # Batch 2 — Infrastructure & Server
    'Dargslan.WinRegistryAudit', 'Dargslan.WinGPOAudit', 'Dargslan.WinPowerCfg',
    'Dargslan.WinPrintMgr', 'Dargslan.WinHyperV', 'Dargslan.WinIISMgr',
    'Dargslan.WinWMIQuery', 'Dargslan.WinStorageMgr', 'Dargslan.WinClusterMgr',
    'Dargslan.WinADTools', 'Dargslan.WinDHCPAudit', 'Dargslan.WinDNSServer',
    'Dargslan.WinWSUSMgr', 'Dargslan.WinSQLHealth', 'Dargslan.WinBitLocker',
    'Dargslan.WinNetStat', 'Dargslan.WinEnvAudit', 'Dargslan.WinDriverMgr',
    'Dargslan.WinShadowCopy', 'Dargslan.WinTaskbarMgr',
    # Batch 3 — 2026 Edition: Security & Cloud
    'Dargslan.WinContainerMgr', 'Dargslan.WinSSHMgr', 'Dargslan.WinTLSAudit',
    'Dargslan.WinWinRMMgr', 'Dargslan.WinDefenderATP', 'Dargslan.WinAppLocker',
    'Dargslan.WinCredentialGuard', 'Dargslan.WinWSLMgr', 'Dargslan.WinSandboxMgr',
    'Dargslan.WinWDAC', 'Dargslan.WinLocalGPO', 'Dargslan.WinMemDiag',
    'Dargslan.WinGPUMon', 'Dargslan.WinUSBGuard', 'Dargslan.WinIntuneMgr',
    'Dargslan.WinAutopilot', 'Dargslan.WinDefenderFW2', 'Dargslan.WinNetworkProfiler',
    'Dargslan.WinEdgeMgr', 'Dargslan.WinPowerShellAudit',
    # Batch 4 — 2026 Edition: Developer Tools & Diagnostics
    'Dargslan.WinNuGetAudit', 'Dargslan.WinChocolateyAudit', 'Dargslan.WinWinGetAudit',
    'Dargslan.WinVSSAdmin', 'Dargslan.WinSMARTHealth', 'Dargslan.WinWindowsFeatures',
    'Dargslan.WinDotNetRuntime', 'Dargslan.WinJavaAudit', 'Dargslan.WinPythonAudit',
    'Dargslan.WinNodeJSAudit', 'Dargslan.WinGitAudit', 'Dargslan.WinVSCodeAudit',
    'Dargslan.WinIISCryptoAudit', 'Dargslan.WinSecureBootAudit', 'Dargslan.WinLogonAudit',
    'Dargslan.WinSMTPRelay', 'Dargslan.WinSNMPAudit', 'Dargslan.WinSharedFolders',
    'Dargslan.WinRecoveryEnv', 'Dargslan.WinBrowserSec',
    # Batch 5 — 2026 Edition: Advanced Security & Compliance
    'Dargslan.WinKerberos', 'Dargslan.WinLSAProtection', 'Dargslan.WinPowerPlan',
    'Dargslan.WinLocaleAudit', 'Dargslan.WinTokenPriv', 'Dargslan.WinDCOM',
    'Dargslan.WinASRRules', 'Dargslan.WinNTFS', 'Dargslan.WinWSB',
    'Dargslan.WinRSAT', 'Dargslan.WinNLAStatus', 'Dargslan.WinAuditLogConfig',
    'Dargslan.WinRemediation', 'Dargslan.WinOSHarden', 'Dargslan.WinProxyConfig',
    'Dargslan.WinIPSec', 'Dargslan.WinVPNConfig', 'Dargslan.WinDeviceEncryption',
    'Dargslan.WinClipboardAudit', 'Dargslan.WinEventForward',
    # Batch 6 — 2026 Edition: Threat Hunting & Forensics
    'Dargslan.WinWiFiSec', 'Dargslan.WinBluetooth', 'Dargslan.WinPrintNightmare',
    'Dargslan.WinDNSSec', 'Dargslan.WinSysmonConfig', 'Dargslan.WinWMIPersis',
    'Dargslan.WinAutorunAudit', 'Dargslan.WinCredentialMgr', 'Dargslan.WinThreatHunt',
    'Dargslan.WinAMSI', 'Dargslan.WinETW', 'Dargslan.WinNetworkShare',
    'Dargslan.WinCOMHijack', 'Dargslan.WinPatchTuesday', 'Dargslan.WinRansomGuard',
    'Dargslan.WinSMBSigning', 'Dargslan.WinHotfixDelta', 'Dargslan.WinMemoryForensic',
    'Dargslan.WinTPM', 'Dargslan.WinDLPAudit',
    # Batch 7 — 2026 Edition: Infrastructure Monitoring & Services
    'Dargslan.WinNPSAudit', 'Dargslan.WinStorageSpaces', 'Dargslan.WinDedup',
    'Dargslan.WinFSRM', 'Dargslan.WinReFS', 'Dargslan.WinTimeSync',
    'Dargslan.WinPKI', 'Dargslan.WinBGPRoute', 'Dargslan.WinSNMP',
    'Dargslan.WinWINS', 'Dargslan.WinRDPSecurity', 'Dargslan.WinPowerBI',
    'Dargslan.WinSCCM', 'Dargslan.WinWDS', 'Dargslan.WinADFS',
    'Dargslan.WinNFS', 'Dargslan.WinRemoteAccess', 'Dargslan.WinSMTP',
    'Dargslan.WinBranchCache', 'Dargslan.WinDFSR'
) | ForEach-Object { Install-Module -Name $_ -Scope CurrentUser -Force }
```

---

## 📋 Complete Module Catalog (140 Modules)

### 🖥️ Core System Administration (Batch 1)

| # | Module | Description | Install |
|---|--------|-------------|---------|
| 1 | [Dargslan.WinSysInfo](Dargslan.WinSysInfo/) | System information — hardware, OS, BIOS, memory | `Install-Module Dargslan.WinSysInfo` |
| 2 | [Dargslan.WinFirewall](Dargslan.WinFirewall/) | Windows Firewall — rules, profiles, blocked connections | `Install-Module Dargslan.WinFirewall` |
| 3 | [Dargslan.WinDefender](Dargslan.WinDefender/) | Windows Defender — status, signatures, scan results | `Install-Module Dargslan.WinDefender` |
| 4 | [Dargslan.WinUserMgmt](Dargslan.WinUserMgmt/) | Local user management — accounts, groups, passwords | `Install-Module Dargslan.WinUserMgmt` |
| 5 | [Dargslan.WinServiceMgr](Dargslan.WinServiceMgr/) | Service management — status, startup, dependencies | `Install-Module Dargslan.WinServiceMgr` |
| 6 | [Dargslan.WinDiskMgr](Dargslan.WinDiskMgr/) | Disk management — partitions, volumes, health | `Install-Module Dargslan.WinDiskMgr` |
| 7 | [Dargslan.WinNetworkDiag](Dargslan.WinNetworkDiag/) | Network diagnostics — adapters, routing, DNS, speed | `Install-Module Dargslan.WinNetworkDiag` |
| 8 | [Dargslan.WinEventLog](Dargslan.WinEventLog/) | Event log analysis — security, system, application | `Install-Module Dargslan.WinEventLog` |
| 9 | [Dargslan.WinUpdateMgr](Dargslan.WinUpdateMgr/) | Windows Update — installed, pending, WSUS config | `Install-Module Dargslan.WinUpdateMgr` |
| 10 | [Dargslan.WinPerfMon](Dargslan.WinPerfMon/) | Performance monitoring — CPU, RAM, I/O, top processes | `Install-Module Dargslan.WinPerfMon` |
| 11 | [Dargslan.WinBackupAudit](Dargslan.WinBackupAudit/) | Backup audit — VSS, restore points, backup status | `Install-Module Dargslan.WinBackupAudit` |
| 12 | [Dargslan.WinSecurityAudit](Dargslan.WinSecurityAudit/) | Security audit — policies, vulnerabilities, compliance | `Install-Module Dargslan.WinSecurityAudit` |
| 13 | [Dargslan.WinCertMgr](Dargslan.WinCertMgr/) | Certificate management — expiry, chain, trust | `Install-Module Dargslan.WinCertMgr` |
| 14 | [Dargslan.WinScheduler](Dargslan.WinScheduler/) | Task Scheduler — tasks, triggers, actions, history | `Install-Module Dargslan.WinScheduler` |
| 15 | [Dargslan.WinProcessMgr](Dargslan.WinProcessMgr/) | Process management — running, CPU/RAM usage, handles | `Install-Module Dargslan.WinProcessMgr` |
| 16 | [Dargslan.WinRDPMgr](Dargslan.WinRDPMgr/) | Remote Desktop — sessions, settings, NLA config | `Install-Module Dargslan.WinRDPMgr` |
| 17 | [Dargslan.WinSMBMgr](Dargslan.WinSMBMgr/) | SMB management — shares, sessions, protocols | `Install-Module Dargslan.WinSMBMgr` |
| 18 | [Dargslan.WinDNSClient](Dargslan.WinDNSClient/) | DNS client — cache, resolver, server config | `Install-Module Dargslan.WinDNSClient` |
| 19 | [Dargslan.WinTimeMgr](Dargslan.WinTimeMgr/) | Time management — NTP sync, clock drift, W32Time | `Install-Module Dargslan.WinTimeMgr` |
| 20 | [Dargslan.WinBootAnalyzer](Dargslan.WinBootAnalyzer/) | Boot analysis — boot time, startup programs, BCD | `Install-Module Dargslan.WinBootAnalyzer` |

### 🏗️ Infrastructure & Server (Batch 2)

| # | Module | Description | Install |
|---|--------|-------------|---------|
| 21 | [Dargslan.WinRegistryAudit](Dargslan.WinRegistryAudit/) | Registry audit — security keys, startup entries, policies | `Install-Module Dargslan.WinRegistryAudit` |
| 22 | [Dargslan.WinGPOAudit](Dargslan.WinGPOAudit/) | Group Policy — applied GPOs, RSoP, compliance | `Install-Module Dargslan.WinGPOAudit` |
| 23 | [Dargslan.WinPowerCfg](Dargslan.WinPowerCfg/) | Power configuration — plans, sleep, hibernate, battery | `Install-Module Dargslan.WinPowerCfg` |
| 24 | [Dargslan.WinPrintMgr](Dargslan.WinPrintMgr/) | Print management — printers, queues, drivers, spooler | `Install-Module Dargslan.WinPrintMgr` |
| 25 | [Dargslan.WinHyperV](Dargslan.WinHyperV/) | Hyper-V management — VMs, switches, snapshots, replication | `Install-Module Dargslan.WinHyperV` |
| 26 | [Dargslan.WinIISMgr](Dargslan.WinIISMgr/) | IIS management — sites, app pools, bindings, SSL | `Install-Module Dargslan.WinIISMgr` |
| 27 | [Dargslan.WinWMIQuery](Dargslan.WinWMIQuery/) | WMI query toolkit — namespaces, classes, diagnostics | `Install-Module Dargslan.WinWMIQuery` |
| 28 | [Dargslan.WinStorageMgr](Dargslan.WinStorageMgr/) | Storage management — pools, spaces, tiering, iSCSI | `Install-Module Dargslan.WinStorageMgr` |
| 29 | [Dargslan.WinClusterMgr](Dargslan.WinClusterMgr/) | Cluster management — nodes, resources, quorum, CSV | `Install-Module Dargslan.WinClusterMgr` |
| 30 | [Dargslan.WinADTools](Dargslan.WinADTools/) | Active Directory — users, OUs, groups, replication | `Install-Module Dargslan.WinADTools` |
| 31 | [Dargslan.WinDHCPAudit](Dargslan.WinDHCPAudit/) | DHCP audit — scopes, leases, reservations, failover | `Install-Module Dargslan.WinDHCPAudit` |
| 32 | [Dargslan.WinDNSServer](Dargslan.WinDNSServer/) | DNS Server — zones, records, forwarders, analytics | `Install-Module Dargslan.WinDNSServer` |
| 33 | [Dargslan.WinWSUSMgr](Dargslan.WinWSUSMgr/) | WSUS management — updates, groups, sync, cleanup | `Install-Module Dargslan.WinWSUSMgr` |
| 34 | [Dargslan.WinSQLHealth](Dargslan.WinSQLHealth/) | SQL Server health — instances, databases, backups, perf | `Install-Module Dargslan.WinSQLHealth` |
| 35 | [Dargslan.WinBitLocker](Dargslan.WinBitLocker/) | BitLocker management — encryption, recovery, TPM | `Install-Module Dargslan.WinBitLocker` |
| 36 | [Dargslan.WinNetStat](Dargslan.WinNetStat/) | Network statistics — connections, ports, bandwidth | `Install-Module Dargslan.WinNetStat` |
| 37 | [Dargslan.WinEnvAudit](Dargslan.WinEnvAudit/) | Environment audit — variables, PATH, system config | `Install-Module Dargslan.WinEnvAudit` |
| 38 | [Dargslan.WinDriverMgr](Dargslan.WinDriverMgr/) | Driver management — installed, unsigned, outdated | `Install-Module Dargslan.WinDriverMgr` |
| 39 | [Dargslan.WinShadowCopy](Dargslan.WinShadowCopy/) | Shadow Copy — VSS writers, snapshots, storage | `Install-Module Dargslan.WinShadowCopy` |
| 40 | [Dargslan.WinTaskbarMgr](Dargslan.WinTaskbarMgr/) | Taskbar management — pinned apps, system tray, layout | `Install-Module Dargslan.WinTaskbarMgr` |

### 🔒 Security & Cloud — 2026 Edition (Batch 3)

| # | Module | Description | Install |
|---|--------|-------------|---------|
| 41 | [Dargslan.WinContainerMgr](Dargslan.WinContainerMgr/) | Container management — Docker, images, networks, volumes | `Install-Module Dargslan.WinContainerMgr` |
| 42 | [Dargslan.WinSSHMgr](Dargslan.WinSSHMgr/) | SSH management — OpenSSH, keys, config, sshd service | `Install-Module Dargslan.WinSSHMgr` |
| 43 | [Dargslan.WinTLSAudit](Dargslan.WinTLSAudit/) | TLS/SSL audit — protocols, cipher suites, certificates | `Install-Module Dargslan.WinTLSAudit` |
| 44 | [Dargslan.WinWinRMMgr](Dargslan.WinWinRMMgr/) | WinRM management — config, listeners, trusted hosts | `Install-Module Dargslan.WinWinRMMgr` |
| 45 | [Dargslan.WinDefenderATP](Dargslan.WinDefenderATP/) | Defender ATP — EDR status, threat history, response | `Install-Module Dargslan.WinDefenderATP` |
| 46 | [Dargslan.WinAppLocker](Dargslan.WinAppLocker/) | AppLocker — policies, rules, enforcement, events | `Install-Module Dargslan.WinAppLocker` |
| 47 | [Dargslan.WinCredentialGuard](Dargslan.WinCredentialGuard/) | Credential Guard — VBS status, HVCI, isolation config | `Install-Module Dargslan.WinCredentialGuard` |
| 48 | [Dargslan.WinWSLMgr](Dargslan.WinWSLMgr/) | WSL management — distros, versions, config, networking | `Install-Module Dargslan.WinWSLMgr` |
| 49 | [Dargslan.WinSandboxMgr](Dargslan.WinSandboxMgr/) | Windows Sandbox — config, networking, shared folders | `Install-Module Dargslan.WinSandboxMgr` |
| 50 | [Dargslan.WinWDAC](Dargslan.WinWDAC/) | WDAC policies — code integrity, CI policies, enforcement | `Install-Module Dargslan.WinWDAC` |
| 51 | [Dargslan.WinLocalGPO](Dargslan.WinLocalGPO/) | Local GPO — security policy, audit policy, rights | `Install-Module Dargslan.WinLocalGPO` |
| 52 | [Dargslan.WinMemDiag](Dargslan.WinMemDiag/) | Memory diagnostics — RAM health, page file, leaks | `Install-Module Dargslan.WinMemDiag` |
| 53 | [Dargslan.WinGPUMon](Dargslan.WinGPUMon/) | GPU monitoring — adapters, memory, temperature, drivers | `Install-Module Dargslan.WinGPUMon` |
| 54 | [Dargslan.WinUSBGuard](Dargslan.WinUSBGuard/) | USB security — device policy, history, whitelisting | `Install-Module Dargslan.WinUSBGuard` |
| 55 | [Dargslan.WinIntuneMgr](Dargslan.WinIntuneMgr/) | Intune management — enrollment, compliance, policies | `Install-Module Dargslan.WinIntuneMgr` |
| 56 | [Dargslan.WinAutopilot](Dargslan.WinAutopilot/) | Autopilot — device identity, provisioning, profile | `Install-Module Dargslan.WinAutopilot` |
| 57 | [Dargslan.WinDefenderFW2](Dargslan.WinDefenderFW2/) | Defender Firewall advanced — logging, IPsec, profiles | `Install-Module Dargslan.WinDefenderFW2` |
| 58 | [Dargslan.WinNetworkProfiler](Dargslan.WinNetworkProfiler/) | Network profiler — Wi-Fi profiles, saved networks, security | `Install-Module Dargslan.WinNetworkProfiler` |
| 59 | [Dargslan.WinEdgeMgr](Dargslan.WinEdgeMgr/) | Edge browser — policies, extensions, update channel | `Install-Module Dargslan.WinEdgeMgr` |
| 60 | [Dargslan.WinPowerShellAudit](Dargslan.WinPowerShellAudit/) | PowerShell audit — execution policy, logging, modules | `Install-Module Dargslan.WinPowerShellAudit` |

### 🛠️ Developer Tools & Diagnostics — 2026 Edition (Batch 4)

| # | Module | Description | Install |
|---|--------|-------------|---------|
| 61 | [Dargslan.WinNuGetAudit](Dargslan.WinNuGetAudit/) | NuGet/.NET package audit, SDK versions, vulnerability scan | `Install-Module Dargslan.WinNuGetAudit` |
| 62 | [Dargslan.WinChocolateyAudit](Dargslan.WinChocolateyAudit/) | Chocolatey package manager — packages, sources, features | `Install-Module Dargslan.WinChocolateyAudit` |
| 63 | [Dargslan.WinWinGetAudit](Dargslan.WinWinGetAudit/) | Windows Package Manager (winget) — apps, updates, sources | `Install-Module Dargslan.WinWinGetAudit` |
| 64 | [Dargslan.WinVSSAdmin](Dargslan.WinVSSAdmin/) | VSS administration — writers, providers, shadow storage | `Install-Module Dargslan.WinVSSAdmin` |
| 65 | [Dargslan.WinSMARTHealth](Dargslan.WinSMARTHealth/) | Disk SMART health — temperature, wear, failure prediction | `Install-Module Dargslan.WinSMARTHealth` |
| 66 | [Dargslan.WinWindowsFeatures](Dargslan.WinWindowsFeatures/) | Windows Features/Roles — installed, available, capabilities | `Install-Module Dargslan.WinWindowsFeatures` |
| 67 | [Dargslan.WinDotNetRuntime](Dargslan.WinDotNetRuntime/) | .NET Framework/Runtime audit — versions, CLR, assemblies | `Install-Module Dargslan.WinDotNetRuntime` |
| 68 | [Dargslan.WinJavaAudit](Dargslan.WinJavaAudit/) | Java JDK/JRE audit — versions, JAVA_HOME, installations | `Install-Module Dargslan.WinJavaAudit` |
| 69 | [Dargslan.WinPythonAudit](Dargslan.WinPythonAudit/) | Python installation audit — versions, pip, PATH validation | `Install-Module Dargslan.WinPythonAudit` |
| 70 | [Dargslan.WinNodeJSAudit](Dargslan.WinNodeJSAudit/) | Node.js/npm audit — versions, global packages, nvm, config | `Install-Module Dargslan.WinNodeJSAudit` |
| 71 | [Dargslan.WinGitAudit](Dargslan.WinGitAudit/) | Git audit — config, SSH keys, credential helpers, aliases | `Install-Module Dargslan.WinGitAudit` |
| 72 | [Dargslan.WinVSCodeAudit](Dargslan.WinVSCodeAudit/) | VS Code audit — extensions, settings, workspace trust | `Install-Module Dargslan.WinVSCodeAudit` |
| 73 | [Dargslan.WinIISCryptoAudit](Dargslan.WinIISCryptoAudit/) | IIS Crypto — cipher suites, protocol compliance, best practices | `Install-Module Dargslan.WinIISCryptoAudit` |
| 74 | [Dargslan.WinSecureBootAudit](Dargslan.WinSecureBootAudit/) | Secure Boot/UEFI — boot chain, DBX, firmware security | `Install-Module Dargslan.WinSecureBootAudit` |
| 75 | [Dargslan.WinLogonAudit](Dargslan.WinLogonAudit/) | Logon security — history, failed attempts, lockouts | `Install-Module Dargslan.WinLogonAudit` |
| 76 | [Dargslan.WinSMTPRelay](Dargslan.WinSMTPRelay/) | SMTP relay audit — service, queue, relay restrictions | `Install-Module Dargslan.WinSMTPRelay` |
| 77 | [Dargslan.WinSNMPAudit](Dargslan.WinSNMPAudit/) | SNMP audit — community strings, traps, permitted managers | `Install-Module Dargslan.WinSNMPAudit` |
| 78 | [Dargslan.WinSharedFolders](Dargslan.WinSharedFolders/) | Shared folders — permissions, open files, sessions, hidden | `Install-Module Dargslan.WinSharedFolders` |
| 79 | [Dargslan.WinRecoveryEnv](Dargslan.WinRecoveryEnv/) | Recovery Environment — WinRE, restore points, reset | `Install-Module Dargslan.WinRecoveryEnv` |
| 80 | [Dargslan.WinBrowserSec](Dargslan.WinBrowserSec/) | Browser security — Chrome/Edge/Firefox versions, policies | `Install-Module Dargslan.WinBrowserSec` |

### 🔐 Advanced Security & Compliance — 2026 Edition (Batch 5)

| # | Module | Description | Install |
|---|--------|-------------|---------|
| 81 | [Dargslan.WinKerberos](Dargslan.WinKerberos/) | Kerberos authentication — ticket cache, SPN, delegation | `Install-Module Dargslan.WinKerberos` |
| 82 | [Dargslan.WinLSAProtection](Dargslan.WinLSAProtection/) | LSA Protection — RunAsPPL, LSASS hardening, credential defense | `Install-Module Dargslan.WinLSAProtection` |
| 83 | [Dargslan.WinPowerPlan](Dargslan.WinPowerPlan/) | Power plan optimization — plans, battery, thermal, efficiency | `Install-Module Dargslan.WinPowerPlan` |
| 84 | [Dargslan.WinLocaleAudit](Dargslan.WinLocaleAudit/) | Locale & language — system locale, timezone, Unicode, input | `Install-Module Dargslan.WinLocaleAudit` |
| 85 | [Dargslan.WinTokenPriv](Dargslan.WinTokenPriv/) | Token privilege audit — privileges, UAC, integrity, elevation | `Install-Module Dargslan.WinTokenPriv` |
| 86 | [Dargslan.WinDCOM](Dargslan.WinDCOM/) | DCOM audit — applications, launch permissions, RPC security | `Install-Module Dargslan.WinDCOM` |
| 87 | [Dargslan.WinASRRules](Dargslan.WinASRRules/) | ASR rules — Attack Surface Reduction, block events, compliance | `Install-Module Dargslan.WinASRRules` |
| 88 | [Dargslan.WinNTFS](Dargslan.WinNTFS/) | NTFS security — permissions, ADS, junction points, integrity | `Install-Module Dargslan.WinNTFS` |
| 89 | [Dargslan.WinWSB](Dargslan.WinWSB/) | Windows Server Backup — schedule, history, recovery catalog | `Install-Module Dargslan.WinWSB` |
| 90 | [Dargslan.WinRSAT](Dargslan.WinRSAT/) | RSAT tools — installed features, MMC snap-ins, admin tools | `Install-Module Dargslan.WinRSAT` |
| 91 | [Dargslan.WinNLAStatus](Dargslan.WinNLAStatus/) | NLA — network profiles, connectivity, firewall mapping | `Install-Module Dargslan.WinNLAStatus` |
| 92 | [Dargslan.WinAuditLogConfig](Dargslan.WinAuditLogConfig/) | Audit log config — event log sizes, retention, audit policy | `Install-Module Dargslan.WinAuditLogConfig` |
| 93 | [Dargslan.WinRemediation](Dargslan.WinRemediation/) | Security remediation — hardening fixes, baseline enforcement | `Install-Module Dargslan.WinRemediation` |
| 94 | [Dargslan.WinOSHarden](Dargslan.WinOSHarden/) | OS hardening — CIS benchmarks, STIG compliance, scoring | `Install-Module Dargslan.WinOSHarden` |
| 95 | [Dargslan.WinProxyConfig](Dargslan.WinProxyConfig/) | Proxy audit — system proxy, PAC, WinHTTP, bypass lists | `Install-Module Dargslan.WinProxyConfig` |
| 96 | [Dargslan.WinIPSec](Dargslan.WinIPSec/) | IPsec policies — SAs, connection security, encryption | `Install-Module Dargslan.WinIPSec` |
| 97 | [Dargslan.WinVPNConfig](Dargslan.WinVPNConfig/) | VPN audit — connections, protocols, split tunneling, always-on | `Install-Module Dargslan.WinVPNConfig` |
| 98 | [Dargslan.WinDeviceEncryption](Dargslan.WinDeviceEncryption/) | Device encryption — BitLocker status, recovery keys, compliance | `Install-Module Dargslan.WinDeviceEncryption` |
| 99 | [Dargslan.WinClipboardAudit](Dargslan.WinClipboardAudit/) | Clipboard security — history, cloud sync, data leakage | `Install-Module Dargslan.WinClipboardAudit` |
| 100 | [Dargslan.WinEventForward](Dargslan.WinEventForward/) | Event Forwarding — WEF subscriptions, collector, WinRM | `Install-Module Dargslan.WinEventForward` |

### 🔍 Threat Hunting & Forensics — 2026 Edition (Batch 6)

| # | Module | Description | Install |
|---|--------|-------------|---------|
| 101 | [Dargslan.WinWiFiSec](Dargslan.WinWiFiSec/) | Wi-Fi security — profiles, encryption, open networks, WPA | `Install-Module Dargslan.WinWiFiSec` |
| 102 | [Dargslan.WinBluetooth](Dargslan.WinBluetooth/) | Bluetooth audit — paired devices, drivers, service, policy | `Install-Module Dargslan.WinBluetooth` |
| 103 | [Dargslan.WinPrintNightmare](Dargslan.WinPrintNightmare/) | Print Spooler security — PrintNightmare mitigations, Point&Print | `Install-Module Dargslan.WinPrintNightmare` |
| 104 | [Dargslan.WinDNSSec](Dargslan.WinDNSSec/) | DNS security — DNSSEC, DNS-over-HTTPS, cache defense | `Install-Module Dargslan.WinDNSSec` |
| 105 | [Dargslan.WinSysmonConfig](Dargslan.WinSysmonConfig/) | Sysmon audit — config, version, rules, event coverage | `Install-Module Dargslan.WinSysmonConfig` |
| 106 | [Dargslan.WinWMIPersis](Dargslan.WinWMIPersis/) | WMI persistence — event subscriptions, backdoor hunting | `Install-Module Dargslan.WinWMIPersis` |
| 107 | [Dargslan.WinAutorunAudit](Dargslan.WinAutorunAudit/) | Autorun audit — Run keys, startup, scheduled tasks, shell | `Install-Module Dargslan.WinAutorunAudit` |
| 108 | [Dargslan.WinCredentialMgr](Dargslan.WinCredentialMgr/) | Credential Manager — stored creds, Vault, DPAPI keys | `Install-Module Dargslan.WinCredentialMgr` |
| 109 | [Dargslan.WinThreatHunt](Dargslan.WinThreatHunt/) | Threat hunting — suspicious processes, IOCs, unsigned DLLs | `Install-Module Dargslan.WinThreatHunt` |
| 110 | [Dargslan.WinAMSI](Dargslan.WinAMSI/) | AMSI audit — providers, bypass detection, script scanning | `Install-Module Dargslan.WinAMSI` |
| 111 | [Dargslan.WinETW](Dargslan.WinETW/) | ETW audit — trace sessions, providers, tamper detection | `Install-Module Dargslan.WinETW` |
| 112 | [Dargslan.WinNetworkShare](Dargslan.WinNetworkShare/) | Network share security — null sessions, anonymous access | `Install-Module Dargslan.WinNetworkShare` |
| 113 | [Dargslan.WinCOMHijack](Dargslan.WinCOMHijack/) | COM hijack detection — orphaned CLSIDs, DLL side-loading | `Install-Module Dargslan.WinCOMHijack` |
| 114 | [Dargslan.WinPatchTuesday](Dargslan.WinPatchTuesday/) | Patch Tuesday — KB analysis, missing patches, compliance | `Install-Module Dargslan.WinPatchTuesday` |
| 115 | [Dargslan.WinRansomGuard](Dargslan.WinRansomGuard/) | Ransomware protection — Controlled Folder Access, defense | `Install-Module Dargslan.WinRansomGuard` |
| 116 | [Dargslan.WinSMBSigning](Dargslan.WinSMBSigning/) | SMB signing — encryption, relay defense, dialect audit | `Install-Module Dargslan.WinSMBSigning` |
| 117 | [Dargslan.WinHotfixDelta](Dargslan.WinHotfixDelta/) | Hotfix delta — patch gaps, superseded, servicing stack | `Install-Module Dargslan.WinHotfixDelta` |
| 118 | [Dargslan.WinMemoryForensic](Dargslan.WinMemoryForensic/) | Memory forensics — injected threads, hollow processes, DLLs | `Install-Module Dargslan.WinMemoryForensic` |
| 119 | [Dargslan.WinTPM](Dargslan.WinTPM/) | TPM audit — version, status, PCR, attestation, key storage | `Install-Module Dargslan.WinTPM` |
| 120 | [Dargslan.WinDLPAudit](Dargslan.WinDLPAudit/) | DLP audit — data loss prevention, classification, endpoint | `Install-Module Dargslan.WinDLPAudit` |

### 🏢 Infrastructure Monitoring & Services — 2026 Edition (Batch 7)

| # | Module | Description | Install |
|---|--------|-------------|---------|
| 121 | [Dargslan.WinNPSAudit](Dargslan.WinNPSAudit/) | NPS/RADIUS — policies, connection requests, NAS clients | `Install-Module Dargslan.WinNPSAudit` |
| 122 | [Dargslan.WinStorageSpaces](Dargslan.WinStorageSpaces/) | Storage Spaces — pools, virtual disks, resiliency, health | `Install-Module Dargslan.WinStorageSpaces` |
| 123 | [Dargslan.WinDedup](Dargslan.WinDedup/) | Data Deduplication — volumes, savings ratios, jobs, schedules | `Install-Module Dargslan.WinDedup` |
| 124 | [Dargslan.WinFSRM](Dargslan.WinFSRM/) | FSRM — quotas, file screens, classification, storage reports | `Install-Module Dargslan.WinFSRM` |
| 125 | [Dargslan.WinReFS](Dargslan.WinReFS/) | ReFS — volumes, integrity streams, block cloning, health | `Install-Module Dargslan.WinReFS` |
| 126 | [Dargslan.WinTimeSync](Dargslan.WinTimeSync/) | Time sync — NTP configuration, W32Time, stratum, drift | `Install-Module Dargslan.WinTimeSync` |
| 127 | [Dargslan.WinPKI](Dargslan.WinPKI/) | PKI — certificate authority, templates, CRL, OCSP, health | `Install-Module Dargslan.WinPKI` |
| 128 | [Dargslan.WinBGPRoute](Dargslan.WinBGPRoute/) | BGP/Routing — routing table, RRAS, BGP peers, interfaces | `Install-Module Dargslan.WinBGPRoute` |
| 129 | [Dargslan.WinSNMP](Dargslan.WinSNMP/) | SNMP — communities, trap destinations, permitted managers | `Install-Module Dargslan.WinSNMP` |
| 130 | [Dargslan.WinWINS](Dargslan.WinWINS/) | WINS — NetBIOS, name resolution, replication, legacy audit | `Install-Module Dargslan.WinWINS` |
| 131 | [Dargslan.WinRDPSecurity](Dargslan.WinRDPSecurity/) | RDP security — NLA, encryption, certificate, session limits | `Install-Module Dargslan.WinRDPSecurity` |
| 132 | [Dargslan.WinPowerBI](Dargslan.WinPowerBI/) | Power BI Gateway — service, data sources, capacity monitoring | `Install-Module Dargslan.WinPowerBI` |
| 133 | [Dargslan.WinSCCM](Dargslan.WinSCCM/) | SCCM/MECM — client health, cache, policy, software updates | `Install-Module Dargslan.WinSCCM` |
| 134 | [Dargslan.WinWDS](Dargslan.WinWDS/) | WDS — boot images, install images, PXE, multicast, drivers | `Install-Module Dargslan.WinWDS` |
| 135 | [Dargslan.WinADFS](Dargslan.WinADFS/) | AD FS — federation service, relying parties, claims, certs | `Install-Module Dargslan.WinADFS` |
| 136 | [Dargslan.WinNFS](Dargslan.WinNFS/) | NFS — server shares, client mounts, identity mapping, auth | `Install-Module Dargslan.WinNFS` |
| 137 | [Dargslan.WinRemoteAccess](Dargslan.WinRemoteAccess/) | Remote Access VPN — RRAS, SSTP, IKEv2, RADIUS, connections | `Install-Module Dargslan.WinRemoteAccess` |
| 138 | [Dargslan.WinSMTP](Dargslan.WinSMTP/) | SMTP — virtual servers, relay restrictions, queue, delivery | `Install-Module Dargslan.WinSMTP` |
| 139 | [Dargslan.WinBranchCache](Dargslan.WinBranchCache/) | BranchCache — hosted/distributed mode, bandwidth savings | `Install-Module Dargslan.WinBranchCache` |
| 140 | [Dargslan.WinDFSR](Dargslan.WinDFSR/) | DFS Replication — groups, folders, connections, backlog | `Install-Module Dargslan.WinDFSR` |

---

## 📊 Module Categories at a Glance

| Category | Count | Focus |
|----------|-------|-------|
| 🖥️ Core System | 20 | System info, firewall, defender, users, services, disk, network, events, updates, performance |
| 🏗️ Infrastructure | 20 | Registry, GPO, Hyper-V, IIS, AD, DHCP, DNS Server, WSUS, SQL, BitLocker, clusters |
| 🔒 Security & Cloud | 20 | Containers, SSH, TLS, WinRM, ATP, AppLocker, Credential Guard, WSL, WDAC, Intune |
| 🛠️ Developer Tools | 20 | NuGet, Chocolatey, WinGet, .NET, Java, Python, Node, Git, VS Code, IIS Crypto |
| 🔐 Advanced Security | 20 | Kerberos, LSA, ASR, NTFS, IPSec, VPN, Device Encryption, OS Hardening, Compliance |
| 🔍 Threat Hunting | 20 | Wi-Fi, Bluetooth, Sysmon, WMI persistence, AMSI, ETW, COM hijack, ransomware, TPM, DLP |
| 🏢 Infrastructure Services | 20 | NPS, Storage Spaces, Dedup, FSRM, ReFS, PKI, BGP, SNMP, RDP Security, AD FS, WDS, SCCM |

## 🐍 Windows Python CLI Tools

**119 Windows Python CLI packages** on PyPI:

```bash
pip install dargslan-win-sysinfo dargslan-win-firewall dargslan-win-defender
```

[Browse all 119 packages →](https://pypi.org/search/?q=dargslan-win)

## 🐧 Linux CLI Tools

**120 Linux CLI tools** on PyPI:

```bash
pip install dargslan-linux-sysinfo dargslan-linux-firewall dargslan-linux-selinux
```

[Browse all 120 packages →](https://pypi.org/search/?q=dargslan-linux)

## 📚 Learn More

| Resource | Link |
|----------|------|
| 🏠 Homepage | [dargslan.com](https://dargslan.com) |
| 📖 eBooks (210+) | [dargslan.com/books](https://dargslan.com/books) |
| 📋 Cheat Sheets | [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets) |
| 📝 Blog | [dargslan.com/blog](https://dargslan.com/blog) |
| 🔧 PSGallery | [powershellgallery.com/profiles/Dargslan](https://www.powershellgallery.com/profiles/Dargslan) |
| 🐍 PyPI | [pypi.org/user/dargslan](https://pypi.org/user/dargslan) |

## Requirements

- **PowerShell** 5.1+ or 7+ (Core)
- **Windows** 10/11 or Server 2016/2019/2022/2025
- Some modules require **Administrator** privileges
- Some modules require specific **Windows Server roles** (DHCP, DNS, AD DS, etc.)

## License

**MIT** — (c) 2026 Dargslan — [dargslan.com](https://dargslan.com)

*Part of the Dargslan IT Administration Ecosystem: 140 PowerShell modules + 120 Linux PyPI packages + 119 Windows Python tools*

# Dargslan PowerShell Admin Scripts

A comprehensive collection of **119 PowerShell modules** for Windows system administration, security auditing, and DevOps automation.

[![PowerShell Gallery](https://img.shields.io/badge/PowerShell%20Gallery-Dargslan-blue)](https://www.powershellgallery.com/profiles/Dargslan)
[![Website](https://img.shields.io/badge/Website-dargslan.com-green)](https://dargslan.com)

## Quick Install

```powershell
# Install any module
Install-Module -Name Dargslan.SysInfo -Scope CurrentUser

# Import and use
Import-Module Dargslan.SysInfo
Get-SystemReport
```

## All Modules

| Module | Description |
|--------|-------------|
| [Dargslan.AclCheck](/Dargslan.AclCheck) | Audit file and folder ACL permissions on Windows systems |
| [Dargslan.ApacheAnalyzer](/Dargslan.ApacheAnalyzer) | Analyze IIS/Apache web server configuration on Windows |
| [Dargslan.ApparmorCheck](/Dargslan.ApparmorCheck) | Check Windows Defender Application Control and AppLocker policies |
| [Dargslan.AptCheck](/Dargslan.AptCheck) | Check Windows Update and installed package health |
| [Dargslan.AptHistory](/Dargslan.AptHistory) | Review Windows Update and package installation history |
| [Dargslan.ArpMonitor](/Dargslan.ArpMonitor) | Monitor ARP table and detect suspicious network entries |
| [Dargslan.AtScheduler](/Dargslan.AtScheduler) | Manage Windows scheduled tasks and at-jobs |
| [Dargslan.AuditLog](/Dargslan.AuditLog) | Analyze Windows Security and Audit event logs |
| [Dargslan.BackupMonitor](/Dargslan.BackupMonitor) | Monitor Windows backup status and verify backup integrity |
| [Dargslan.BandwidthMonitor](/Dargslan.BandwidthMonitor) | Monitor network interface bandwidth and throughput statistics |
| [Dargslan.BashAlias](/Dargslan.BashAlias) | Manage PowerShell aliases and profile shortcuts |
| [Dargslan.BondingCheck](/Dargslan.BondingCheck) | Check NIC teaming and network adapter bonding configuration |
| [Dargslan.BridgeMonitor](/Dargslan.BridgeMonitor) | Monitor Hyper-V virtual switches and bridge configurations |
| [Dargslan.BtrfsCheck](/Dargslan.BtrfsCheck) | Check ReFS and storage pool health on Windows |
| [Dargslan.CertManager](/Dargslan.CertManager) | Manage and audit SSL/TLS certificates in Windows certificate store |
| [Dargslan.CgroupAudit](/Dargslan.CgroupAudit) | Audit Windows Job Objects and resource control groups |
| [Dargslan.CgroupMonitor](/Dargslan.CgroupMonitor) | Monitor process resource usage and limits |
| [Dargslan.ContainerAudit](/Dargslan.ContainerAudit) | Audit Docker and container security on Windows |
| [Dargslan.CoredumpCheck](/Dargslan.CoredumpCheck) | Check Windows crash dumps and minidump files |
| [Dargslan.CpuFreq](/Dargslan.CpuFreq) | Monitor CPU frequency, performance, and power states |
| [Dargslan.CronAudit](/Dargslan.CronAudit) | Audit Windows Task Scheduler tasks and scheduled jobs |
| [Dargslan.CronParser](/Dargslan.CronParser) | Parse and validate Windows scheduled task triggers |
| [Dargslan.CrontabBackup](/Dargslan.CrontabBackup) | Backup and export Windows scheduled task definitions |
| [Dargslan.CryptAudit](/Dargslan.CryptAudit) | Audit encryption settings, BitLocker status, and cipher suites |
| [Dargslan.DiskBenchmark](/Dargslan.DiskBenchmark) | Benchmark disk I/O read and write performance |
| [Dargslan.DiskCleaner](/Dargslan.DiskCleaner) | Clean temporary files and reclaim disk space |
| [Dargslan.DiskHealth](/Dargslan.DiskHealth) | Monitor disk health, SMART status, and storage performance |
| [Dargslan.DiskQuota](/Dargslan.DiskQuota) | Monitor disk quotas and usage limits |
| [Dargslan.DmesgAnalyzer](/Dargslan.DmesgAnalyzer) | Analyze Windows system and boot event logs |
| [Dargslan.DnsCheck](/Dargslan.DnsCheck) | Check DNS client configuration and resolver health |
| [Dargslan.DnsResolver](/Dargslan.DnsResolver) | Test DNS resolution, measure query times, and validate DNSSEC |
| [Dargslan.DockerHealth](/Dargslan.DockerHealth) | Check Docker Desktop and container engine health on Windows |
| [Dargslan.EntropyCheck](/Dargslan.EntropyCheck) | Check system randomness and cryptographic entropy sources |
| [Dargslan.EnvAudit](/Dargslan.EnvAudit) | Audit environment variables for sensitive data exposure |
| [Dargslan.EthtoolCheck](/Dargslan.EthtoolCheck) | Check network adapter hardware properties and driver info |
| [Dargslan.Fail2banAudit](/Dargslan.Fail2banAudit) | Audit Windows account lockout policies and blocked IPs |
| [Dargslan.FileIntegrity](/Dargslan.FileIntegrity) | Check file integrity using hashes and detect unauthorized changes |
| [Dargslan.FirewallAudit](/Dargslan.FirewallAudit) | Audit Windows Firewall rules and network security policies |
| [Dargslan.FstabCheck](/Dargslan.FstabCheck) | Check mounted volumes and drive mount configuration |
| [Dargslan.GitAudit](/Dargslan.GitAudit) | Audit Git repositories for secrets and security issues |
| [Dargslan.GrubCheck](/Dargslan.GrubCheck) | Check Windows boot configuration and BCD settings |
| [Dargslan.HostnameCheck](/Dargslan.HostnameCheck) | Verify hostname, domain membership, and DNS registration |
| [Dargslan.HostnameInfo](/Dargslan.HostnameInfo) | Display detailed hostname and system identity information |
| [Dargslan.InodeMonitor](/Dargslan.InodeMonitor) | Monitor NTFS MFT and file system metadata health |
| [Dargslan.InterfaceMonitor](/Dargslan.InterfaceMonitor) | Monitor network interface status and error counters |
| [Dargslan.IoMonitor](/Dargslan.IoMonitor) | Monitor disk I/O operations and throughput per process |
| [Dargslan.IpGeo](/Dargslan.IpGeo) | Look up IP geolocation and network information |
| [Dargslan.IptablesExport](/Dargslan.IptablesExport) | Export Windows Firewall rules to file for backup |
| [Dargslan.Ipv6Audit](/Dargslan.Ipv6Audit) | Audit IPv6 configuration and transition mechanisms |
| [Dargslan.JournalExport](/Dargslan.JournalExport) | Export Windows Event Log entries to various formats |
| [Dargslan.JournaldAnalyzer](/Dargslan.JournaldAnalyzer) | Analyze Windows Event Log patterns and anomalies |
| [Dargslan.KernelCheck](/Dargslan.KernelCheck) | Check Windows kernel version and installed hotfixes |
| [Dargslan.KernelModule](/Dargslan.KernelModule) | List loaded drivers and kernel modules on Windows |
| [Dargslan.LastlogAudit](/Dargslan.LastlogAudit) | Audit user last login times and login history |
| [Dargslan.LoadAverage](/Dargslan.LoadAverage) | Analyze system load, CPU queue length, and bottlenecks |
| [Dargslan.LocaleCheck](/Dargslan.LocaleCheck) | Check system locale, timezone, and regional settings |
| [Dargslan.LogParser](/Dargslan.LogParser) | Parse and analyze Windows event log files |
| [Dargslan.LogRotate](/Dargslan.LogRotate) | Manage log file rotation and cleanup on Windows |
| [Dargslan.LogStats](/Dargslan.LogStats) | Generate statistics from Windows event logs |
| [Dargslan.LoginHistory](/Dargslan.LoginHistory) | Track user login and logoff history from event logs |
| [Dargslan.LoginTracker](/Dargslan.LoginTracker) | Track and alert on suspicious login patterns |
| [Dargslan.LsofAudit](/Dargslan.LsofAudit) | Audit open files, handles, and network connections per process |
| [Dargslan.LvmCheck](/Dargslan.LvmCheck) | Check Windows Storage Spaces and dynamic disk configuration |
| [Dargslan.MemoryProfiler](/Dargslan.MemoryProfiler) | Profile memory usage and detect memory leaks |
| [Dargslan.ModprobeCheck](/Dargslan.ModprobeCheck) | Check Windows driver loading and device manager status |
| [Dargslan.MotdManager](/Dargslan.MotdManager) | Manage Windows login banner and legal notice messages |
| [Dargslan.MountMonitor](/Dargslan.MountMonitor) | Monitor volume mount points and drive mappings |
| [Dargslan.MysqlHealth](/Dargslan.MysqlHealth) | Check MySQL/MariaDB database server health on Windows |
| [Dargslan.NetScanner](/Dargslan.NetScanner) | Scan local network for active hosts and open ports |
| [Dargslan.NetfilterCheck](/Dargslan.NetfilterCheck) | Check Windows Filtering Platform and network filter status |
| [Dargslan.NetworkLatency](/Dargslan.NetworkLatency) | Measure network latency and packet loss to targets |
| [Dargslan.NfsHealth](/Dargslan.NfsHealth) | Check SMB/CIFS share health and NFS client status |
| [Dargslan.NginxAnalyzer](/Dargslan.NginxAnalyzer) | Analyze IIS web server configuration and performance |
| [Dargslan.NtpCheck](/Dargslan.NtpCheck) | Check time synchronization and NTP configuration |
| [Dargslan.NumaCheck](/Dargslan.NumaCheck) | Check NUMA topology and memory node configuration |
| [Dargslan.PackageAudit](/Dargslan.PackageAudit) | Audit installed software packages and versions |
| [Dargslan.PamAudit](/Dargslan.PamAudit) | Audit Windows authentication policies and credential providers |
| [Dargslan.PasswdAudit](/Dargslan.PasswdAudit) | Audit local user password policies and expiration |
| [Dargslan.PortMonitor](/Dargslan.PortMonitor) | Monitor open TCP/UDP ports and listening services |
| [Dargslan.PostgresHealth](/Dargslan.PostgresHealth) | Check PostgreSQL database server health on Windows |
| [Dargslan.ProcMonitor](/Dargslan.ProcMonitor) | Real-time process monitoring and resource tracking |
| [Dargslan.ProcessKiller](/Dargslan.ProcessKiller) | Find and terminate processes by name, PID, or resource usage |
| [Dargslan.ProcessMonitor](/Dargslan.ProcessMonitor) | Monitor system processes, CPU and memory usage |
| [Dargslan.RaidMonitor](/Dargslan.RaidMonitor) | Monitor Storage Spaces and RAID array health |
| [Dargslan.RedisHealth](/Dargslan.RedisHealth) | Check Redis server health and performance metrics |
| [Dargslan.ResolvCheck](/Dargslan.ResolvCheck) | Check DNS resolver configuration and connectivity |
| [Dargslan.RouteCheck](/Dargslan.RouteCheck) | Check routing table and network route configuration |
| [Dargslan.SecurityScan](/Dargslan.SecurityScan) | Comprehensive Windows security scanner and hardening checker |
| [Dargslan.SelinuxCheck](/Dargslan.SelinuxCheck) | Check Windows Mandatory Integrity Control and security levels |
| [Dargslan.ServiceMonitor](/Dargslan.ServiceMonitor) | Monitor Windows services status and dependencies |
| [Dargslan.ServiceRestart](/Dargslan.ServiceRestart) | Restart Windows services safely with dependency handling |
| [Dargslan.SnmpCheck](/Dargslan.SnmpCheck) | Check SNMP service configuration and community strings |
| [Dargslan.SocketStats](/Dargslan.SocketStats) | Display TCP/UDP socket statistics and connection states |
| [Dargslan.SshAudit](/Dargslan.SshAudit) | Audit OpenSSH server configuration and security settings on Windows |
| [Dargslan.SshHardening](/Dargslan.SshHardening) | Harden OpenSSH server configuration on Windows |
| [Dargslan.SshkeyAudit](/Dargslan.SshkeyAudit) | Audit SSH keys and authorized keys on Windows |
| [Dargslan.SslChecker](/Dargslan.SslChecker) | Check SSL/TLS certificate validity for remote hosts |
| [Dargslan.SudoersAudit](/Dargslan.SudoersAudit) | Audit local administrator group membership and privileges |
| [Dargslan.SwapAnalyzer](/Dargslan.SwapAnalyzer) | Analyze Windows page file configuration and usage |
| [Dargslan.SwapManager](/Dargslan.SwapManager) | Manage Windows virtual memory and page file settings |
| [Dargslan.SysctlAudit](/Dargslan.SysctlAudit) | Audit Windows registry-based system tuning parameters |
| [Dargslan.Sysinfo](/Dargslan.Sysinfo) | Comprehensive Windows system information |
| [Dargslan.SyslogMonitor](/Dargslan.SyslogMonitor) | Monitor Windows event log sources in real-time |
| [Dargslan.SystemdAnalyze](/Dargslan.SystemdAnalyze) | Analyze Windows boot time and startup performance |
| [Dargslan.SystemdTimer](/Dargslan.SystemdTimer) | Manage Windows scheduled task timers and triggers |
| [Dargslan.SystemdUnit](/Dargslan.SystemdUnit) | Manage Windows services configuration and dependencies |
| [Dargslan.TcpMonitor](/Dargslan.TcpMonitor) | Monitor TCP connections, states, and performance |
| [Dargslan.ThermalMonitor](/Dargslan.ThermalMonitor) | Monitor system temperature sensors and thermal status |
| [Dargslan.TimezoneInfo](/Dargslan.TimezoneInfo) | Display timezone information and UTC offset details |
| [Dargslan.TmpfileClean](/Dargslan.TmpfileClean) | Clean temporary files and cache directories |
| [Dargslan.TmpfileCleaner](/Dargslan.TmpfileCleaner) | Advanced temporary file cleanup with age-based filtering |
| [Dargslan.Toolkit](/Dargslan.Toolkit) | Complete Windows sysadmin toolkit |
| [Dargslan.UlimitCheck](/Dargslan.UlimitCheck) | Check Windows process resource limits and quotas |
| [Dargslan.UptimeReport](/Dargslan.UptimeReport) | Generate system uptime and availability report |
| [Dargslan.UserAudit](/Dargslan.UserAudit) | Audit local user accounts, detect inactive and risky accounts |
| [Dargslan.UserSessions](/Dargslan.UserSessions) | Monitor active user sessions and remote connections |
| [Dargslan.XfsCheck](/Dargslan.XfsCheck) | Check ReFS file system health and configuration |
| [Dargslan.YumHistory](/Dargslan.YumHistory) | Review Windows package installation and update history |
| [Dargslan.ZombieKill](/Dargslan.ZombieKill) | Find and terminate zombie, hung, and unresponsive processes |

## Also Available on PyPI

These tools are also available as Python CLI packages on [PyPI](https://pypi.org/search/?q=dargslan).

## Resources

- **Website**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Linux & DevOps Books**: [dargslan.com/books](https://dargslan.com/books)
- **Python Tools (PyPI)**: [github.com/Dargslan/python-admin-scripts](https://github.com/Dargslan/python-admin-scripts)

## License

MIT License - (c) 2025 Dargslan

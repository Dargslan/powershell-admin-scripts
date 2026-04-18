# Dargslan.WinDnsHealth

Audit Windows DNS Server health: zones, scavenging, recursion, root hints, forwarders. JSON / HTML report.

Part of the **Dargslan Windows Admin Tools** collection. Free cheat sheets and 210+ Linux / Windows / cybersecurity eBooks at [dargslan.com](https://dargslan.com).

## Install

```powershell
Install-Module Dargslan.WinDnsHealth -Scope CurrentUser
Import-Module Dargslan.WinDnsHealth
```

## Cmdlets

- **`Get-DargslanDnsZones`** — List all DNS zones with type, dynamic-update setting and scavenging.
- **`Get-DargslanDnsServerSettings`** — Return recursion, root hints and forwarder configuration.
- **`Get-DargslanDnsScavengingStatus`** — Server-level scavenging settings + per-zone aging.
- **`Get-DargslanDnsHealthReport`** — Combined DNS audit with PASS / WARN / FAIL verdict.
- **`Export-DargslanDnsHealthReport`** — Export the DNS audit to HTML and JSON.


## Quick start

```powershell
Import-Module Dargslan.WinDnsHealth
Get-Command -Module Dargslan.WinDnsHealth
```

## Resources

- 📖 Full guide: [https://dargslan.com/blog/windows-dns-server-health-powershell-2026](https://dargslan.com/blog/windows-dns-server-health-powershell-2026)
- 📄 Free PDF cheat sheet: [https://dargslan.com/cheat-sheets/windows-dns-server-health-2026](https://dargslan.com/cheat-sheets/windows-dns-server-health-2026)
- 🛒 210+ eBooks on Linux, Windows, cybersecurity: [dargslan.com](https://dargslan.com)
- 💻 GitHub: [Dargslan/powershell-admin-scripts](https://github.com/Dargslan/powershell-admin-scripts)



## License

MIT © 2026 Dargslan.

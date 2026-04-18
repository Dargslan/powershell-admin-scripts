# Dargslan.WinDhcpAudit

Audit Windows DHCP scopes, failover and exhaustion. JSON / HTML report.

Part of the **Dargslan Windows Admin Tools** collection. Free cheat sheets and 210+ Linux / Windows / cybersecurity eBooks at [dargslan.com](https://dargslan.com).

## Install

```powershell
Install-Module Dargslan.WinDhcpAudit -Scope CurrentUser
Import-Module Dargslan.WinDhcpAudit
```

## Cmdlets

- **`Get-DargslanDhcpScopes`** — List every DHCP scope with state, lease duration and reservations.
- **`Get-DargslanDhcpFailover`** — Return DHCP failover relationships.
- **`Get-DargslanDhcpScopeUsage`** — Return per-scope usage % (free vs in use vs reserved).
- **`Get-DargslanDhcpAuditReport`** — Combined DHCP audit with PASS / WARN / FAIL verdict.
- **`Export-DargslanDhcpAuditReport`** — Export the DHCP audit to HTML and JSON.


## Quick start

```powershell
Import-Module Dargslan.WinDhcpAudit
Get-Command -Module Dargslan.WinDhcpAudit
```

## Resources

- 📖 Full guide: [https://dargslan.com/blog/windows-dhcp-audit-powershell-2026](https://dargslan.com/blog/windows-dhcp-audit-powershell-2026)
- 📄 Free PDF cheat sheet: [https://dargslan.com/cheat-sheets/windows-dhcp-audit-2026](https://dargslan.com/cheat-sheets/windows-dhcp-audit-2026)
- 🛒 210+ eBooks on Linux, Windows, cybersecurity: [dargslan.com](https://dargslan.com)
- 💻 GitHub: [Dargslan/powershell-admin-scripts](https://github.com/Dargslan/powershell-admin-scripts)



## License

MIT © 2026 Dargslan.

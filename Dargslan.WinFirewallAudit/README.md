# Dargslan.WinFirewallAudit

Audit Windows Firewall profiles and rules. Detect risky Allow Any Any rules, disabled profiles and GPO overrides. JSON / HTML compliance report.

Part of the **Dargslan Windows Admin Tools** collection. Free cheat sheets and 210+ Linux / Windows / cybersecurity eBooks at [dargslan.com](https://dargslan.com).

## Install

```powershell
Install-Module Dargslan.WinFirewallAudit -Scope CurrentUser
Import-Module Dargslan.WinFirewallAudit
```

## Cmdlets

- **`Get-DargslanFirewallProfile`** — Return the state of all three firewall profiles (Domain / Private / Public).
- **`Get-DargslanFirewallRules`** — Return enabled inbound rules with the resolved port / protocol / address.
- **`Get-DargslanFirewallRiskyRules`** — Detect Allow rules that are too permissive (Any protocol, Any address, Any port).
- **`Get-DargslanFirewallAuditReport`** — Combined audit object with score and PASS / WARN / FAIL verdict.
- **`Export-DargslanFirewallAuditReport`** — Export the audit report to HTML and JSON.


## Quick start

```powershell
Import-Module Dargslan.WinFirewallAudit
Get-Command -Module Dargslan.WinFirewallAudit
```

## Resources

- 📖 Full guide: [https://dargslan.com/blog/windows-firewall-audit-powershell-2026](https://dargslan.com/blog/windows-firewall-audit-powershell-2026)
- 📄 Free PDF cheat sheet: [https://dargslan.com/cheat-sheets/windows-firewall-audit-2026](https://dargslan.com/cheat-sheets/windows-firewall-audit-2026)
- 🛒 210+ eBooks on Linux, Windows, cybersecurity: [dargslan.com](https://dargslan.com)
- 💻 GitHub: [Dargslan/powershell-admin-scripts](https://github.com/Dargslan/powershell-admin-scripts)



## License

MIT © 2026 Dargslan.

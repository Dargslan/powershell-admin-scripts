# Dargslan.WinServiceSecurity

Audit Windows services for unquoted paths, weak ACLs and risky service accounts. JSON / HTML report.

Part of the **Dargslan Windows Admin Tools** collection. Free cheat sheets and 210+ Linux / Windows / cybersecurity eBooks at [dargslan.com](https://dargslan.com).

## Install

```powershell
Install-Module Dargslan.WinServiceSecurity -Scope CurrentUser
Import-Module Dargslan.WinServiceSecurity
```

## Cmdlets

- **`Get-DargslanServiceInventory`** — Return every service with start mode, run-as account and binary path.
- **`Get-DargslanUnquotedServicePaths`** — Detect unquoted service paths that contain spaces (classic priv-esc vector).
- **`Get-DargslanRiskyServiceAccounts`** — Find services running as LocalSystem from a user-writable directory.
- **`Get-DargslanServiceAuditReport`** — Combined report with PASS / WARN / FAIL verdict.
- **`Export-DargslanServiceAuditReport`** — Export the service audit to HTML and JSON.


## Quick start

```powershell
Import-Module Dargslan.WinServiceSecurity
Get-Command -Module Dargslan.WinServiceSecurity
```

## Resources

- 📖 Full guide: [https://dargslan.com/blog/windows-service-security-audit-powershell-2026](https://dargslan.com/blog/windows-service-security-audit-powershell-2026)
- 📄 Free PDF cheat sheet: [https://dargslan.com/cheat-sheets/windows-service-security-audit-2026](https://dargslan.com/cheat-sheets/windows-service-security-audit-2026)
- 🛒 210+ eBooks on Linux, Windows, cybersecurity: [dargslan.com](https://dargslan.com)
- 💻 GitHub: [Dargslan/powershell-admin-scripts](https://github.com/Dargslan/powershell-admin-scripts)



## License

MIT © 2026 Dargslan.

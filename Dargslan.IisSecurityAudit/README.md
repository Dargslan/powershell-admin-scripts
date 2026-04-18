# Dargslan.IisSecurityAudit

Audit IIS bindings, SChannel TLS protocols, weak ciphers and app pool identities. JSON / HTML report.

Part of the **Dargslan Windows Admin Tools** collection. Free cheat sheets and 210+ Linux / Windows / cybersecurity eBooks at [dargslan.com](https://dargslan.com).

## Install

```powershell
Install-Module Dargslan.IisSecurityAudit -Scope CurrentUser
Import-Module Dargslan.IisSecurityAudit
```

## Cmdlets

- **`Get-DargslanIisBindings`** — Return every IIS site binding with protocol, port, host header and cert thumbprint.
- **`Get-DargslanIisTlsProtocols`** — Read SChannel registry to determine TLS 1.0 / 1.1 / 1.2 / 1.3 enabled state.
- **`Get-DargslanIisAppPoolIdentities`** — Return every app pool with its identity and managed pipeline mode.
- **`Get-DargslanIisSecurityAuditReport`** — Combined IIS audit with PASS / WARN / FAIL verdict.
- **`Export-DargslanIisSecurityAuditReport`** — Export the IIS audit to HTML and JSON.


## Quick start

```powershell
Import-Module Dargslan.IisSecurityAudit
Get-Command -Module Dargslan.IisSecurityAudit
```

## Resources

- 📖 Full guide: [https://dargslan.com/blog/iis-tls-security-audit-powershell-2026](https://dargslan.com/blog/iis-tls-security-audit-powershell-2026)
- 📄 Free PDF cheat sheet: [https://dargslan.com/cheat-sheets/iis-tls-security-audit-2026](https://dargslan.com/cheat-sheets/iis-tls-security-audit-2026)
- 🛒 210+ eBooks on Linux, Windows, cybersecurity: [dargslan.com](https://dargslan.com)
- 💻 GitHub: [Dargslan/powershell-admin-scripts](https://github.com/Dargslan/powershell-admin-scripts)



## License

MIT © 2026 Dargslan.

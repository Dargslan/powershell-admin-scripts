# Dargslan.WsusHealth

Audit WSUS server health: client compliance, missing critical updates, sync state. JSON / HTML report.

Part of the **Dargslan Windows Admin Tools** collection. Free cheat sheets and 210+ Linux / Windows / cybersecurity eBooks at [dargslan.com](https://dargslan.com).

## Install

```powershell
Install-Module Dargslan.WsusHealth -Scope CurrentUser
Import-Module Dargslan.WsusHealth
```

## Cmdlets

- **`Get-DargslanWsusServerStatus`** — Connect to WSUS and return basic server status + last sync.
- **`Get-DargslanWsusClientCompliance`** — Bucket clients by status (UpToDate, NeedingUpdates, Failed, Unknown).
- **`Get-DargslanWsusMissingCritical`** — Return needed critical / security updates per client.
- **`Get-DargslanWsusHealthReport`** — Combined WSUS health report with PASS / WARN / FAIL verdict.
- **`Export-DargslanWsusHealthReport`** — Export the WSUS audit to HTML and JSON.


## Quick start

```powershell
Import-Module Dargslan.WsusHealth
Get-Command -Module Dargslan.WsusHealth
```

## Resources

- 📖 Full guide: [https://dargslan.com/blog/wsus-server-health-audit-powershell-2026](https://dargslan.com/blog/wsus-server-health-audit-powershell-2026)
- 📄 Free PDF cheat sheet: [https://dargslan.com/cheat-sheets/wsus-server-health-audit-2026](https://dargslan.com/cheat-sheets/wsus-server-health-audit-2026)
- 🛒 210+ eBooks on Linux, Windows, cybersecurity: [dargslan.com](https://dargslan.com)
- 💻 GitHub: [Dargslan/powershell-admin-scripts](https://github.com/Dargslan/powershell-admin-scripts)



## License

MIT © 2026 Dargslan.

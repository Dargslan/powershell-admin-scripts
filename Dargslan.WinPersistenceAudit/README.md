# Dargslan.WinPersistenceAudit

Audit Windows persistence locations: registry Run keys, scheduled tasks and unsigned autorun binaries. JSON / HTML report.

Part of the **Dargslan Windows Admin Tools** collection. Free cheat sheets and 210+ Linux / Windows / cybersecurity eBooks at [dargslan.com](https://dargslan.com).

## Install

```powershell
Install-Module Dargslan.WinPersistenceAudit -Scope CurrentUser
Import-Module Dargslan.WinPersistenceAudit
```

## Cmdlets

- **`Get-DargslanRunKeys`** — Read every Run / RunOnce registry key for HKLM and HKCU.
- **`Get-DargslanScheduledTasks`** — Return every enabled scheduled task with author, run-as account and action.
- **`Get-DargslanUnsignedAutoruns`** — Classify Run-key + scheduled-task binaries by Authenticode signature.
- **`Get-DargslanPersistenceAuditReport`** — Combined persistence audit with PASS / WARN / FAIL verdict.
- **`Export-DargslanPersistenceAuditReport`** — Export the audit to HTML and JSON.


## Quick start

```powershell
Import-Module Dargslan.WinPersistenceAudit
Get-Command -Module Dargslan.WinPersistenceAudit
```

## Resources

- 📖 Full guide: [https://dargslan.com/blog/windows-persistence-audit-powershell-2026](https://dargslan.com/blog/windows-persistence-audit-powershell-2026)
- 📄 Free PDF cheat sheet: [https://dargslan.com/cheat-sheets/windows-persistence-audit-2026](https://dargslan.com/cheat-sheets/windows-persistence-audit-2026)
- 🛒 210+ eBooks on Linux, Windows, cybersecurity: [dargslan.com](https://dargslan.com)
- 💻 GitHub: [Dargslan/powershell-admin-scripts](https://github.com/Dargslan/powershell-admin-scripts)



## License

MIT © 2026 Dargslan.

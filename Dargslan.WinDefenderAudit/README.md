# Dargslan.WinDefenderAudit

Audit Microsoft Defender configuration, ASR rule state, exclusions and tamper protection. JSON / HTML compliance report.

Part of the **Dargslan Windows Admin Tools** collection. Free cheat sheets and 210+ Linux / Windows / cybersecurity eBooks at [dargslan.com](https://dargslan.com).

## Install

```powershell
Install-Module Dargslan.WinDefenderAudit -Scope CurrentUser
Import-Module Dargslan.WinDefenderAudit
```

## Cmdlets

- **`Get-DargslanDefenderStatus`** — Return real-time protection, signatures, tamper protection and engine state.
- **`Get-DargslanAsrRules`** — Return all ASR rule IDs with friendly name and current state (Disabled / Block / Audit / Warn).
- **`Get-DargslanDefenderExclusions`** — Return all configured Defender exclusions (paths, extensions, processes, IPs).
- **`Get-DargslanDefenderAuditReport`** — Combined Defender audit object with PASS / WARN / FAIL verdict.
- **`Export-DargslanDefenderAuditReport`** — Export the audit report to HTML and JSON.


## Quick start

```powershell
Import-Module Dargslan.WinDefenderAudit
Get-Command -Module Dargslan.WinDefenderAudit
```

## Resources

- 📖 Full guide: [https://dargslan.com/blog/windows-defender-asr-audit-powershell-2026](https://dargslan.com/blog/windows-defender-asr-audit-powershell-2026)
- 📄 Free PDF cheat sheet: [https://dargslan.com/cheat-sheets/windows-defender-asr-audit-2026](https://dargslan.com/cheat-sheets/windows-defender-asr-audit-2026)
- 🛒 210+ eBooks on Linux, Windows, cybersecurity: [dargslan.com](https://dargslan.com)
- 💻 GitHub: [Dargslan/powershell-admin-scripts](https://github.com/Dargslan/powershell-admin-scripts)



## License

MIT © 2026 Dargslan.

# Dargslan.PrintNightmareAudit

Audit Windows Print Spooler exposure (PrintNightmare): spooler state, Point-and-Print restrictions, unsigned drivers, package install policy.

Part of the **Dargslan Windows Admin Tools** collection. Free cheat sheets and 210+ Linux / Windows / cybersecurity eBooks at [dargslan.com](https://dargslan.com).

## Install

```powershell
Install-Module Dargslan.PrintNightmareAudit -Scope CurrentUser
Import-Module Dargslan.PrintNightmareAudit
```

## Cmdlets

- **`Get-DargslanPrintSpoolerStatus`** — Return spooler service state and shared printer count.
- **`Get-DargslanPrintNightmareConfig`** — Read PrintNightmare-relevant policy keys.
- **`Get-DargslanPrinterDrivers`** — List installed printer drivers and check vendor + signature.
- **`Get-DargslanPrintNightmareAuditReport`** — Combined report with PASS / WARN / FAIL verdict.
- **`Export-DargslanPrintNightmareAuditReport`** — Export the audit to HTML and JSON.


## Quick start

```powershell
Import-Module Dargslan.PrintNightmareAudit
Get-Command -Module Dargslan.PrintNightmareAudit
```

## Resources

- 📖 Full guide: [https://dargslan.com/blog/printnightmare-print-spooler-audit-powershell-2026](https://dargslan.com/blog/printnightmare-print-spooler-audit-powershell-2026)
- 📄 Free PDF cheat sheet: [https://dargslan.com/cheat-sheets/printnightmare-print-spooler-audit-2026](https://dargslan.com/cheat-sheets/printnightmare-print-spooler-audit-2026)
- 🛒 210+ eBooks on Linux, Windows, cybersecurity: [dargslan.com](https://dargslan.com)
- 💻 GitHub: [Dargslan/powershell-admin-scripts](https://github.com/Dargslan/powershell-admin-scripts)



## License

MIT © 2026 Dargslan.

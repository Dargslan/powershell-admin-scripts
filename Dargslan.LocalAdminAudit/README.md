# Dargslan.LocalAdminAudit

Audit Windows local users and the Administrators group: members, dormant accounts, Guest state, unknown SIDs.

Part of the **Dargslan Windows Admin Tools** collection. Free cheat sheets and 210+ Linux / Windows / cybersecurity eBooks at [dargslan.com](https://dargslan.com).

## Install

```powershell
Install-Module Dargslan.LocalAdminAudit -Scope CurrentUser
Import-Module Dargslan.LocalAdminAudit
```

## Cmdlets

- **`Get-DargslanLocalAdmins`** — Return the members of the local Administrators group with SID and source.
- **`Get-DargslanLocalUsers`** — Enumerate every local user with enabled state and last logon.
- **`Get-DargslanInactiveLocalAccounts`** — Find enabled local users with no logon for N days (default 90).
- **`Get-DargslanLocalAdminAuditReport`** — Combined report with PASS / WARN / FAIL verdict.
- **`Export-DargslanLocalAdminAuditReport`** — Export the report to HTML and JSON.


## Quick start

```powershell
Import-Module Dargslan.LocalAdminAudit
Get-Command -Module Dargslan.LocalAdminAudit
```

## Resources

- 📖 Full guide: [https://dargslan.com/blog/windows-local-admin-audit-powershell-2026](https://dargslan.com/blog/windows-local-admin-audit-powershell-2026)
- 📄 Free PDF cheat sheet: [https://dargslan.com/cheat-sheets/windows-local-admin-audit-2026](https://dargslan.com/cheat-sheets/windows-local-admin-audit-2026)
- 🛒 210+ eBooks on Linux, Windows, cybersecurity: [dargslan.com](https://dargslan.com)
- 💻 GitHub: [Dargslan/powershell-admin-scripts](https://github.com/Dargslan/powershell-admin-scripts)



## License

MIT © 2026 Dargslan.

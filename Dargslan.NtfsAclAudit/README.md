# Dargslan.NtfsAclAudit

Audit NTFS ACLs on a directory tree: Everyone / Authenticated Users excessive rights, broken inheritance, orphaned SIDs.

Part of the **Dargslan Windows Admin Tools** collection. Free cheat sheets and 210+ Linux / Windows / cybersecurity eBooks at [dargslan.com](https://dargslan.com).

## Install

```powershell
Install-Module Dargslan.NtfsAclAudit -Scope CurrentUser
Import-Module Dargslan.NtfsAclAudit
```

## Cmdlets

- **`Get-DargslanNtfsPermissions`** — Recursive ACL inventory of a path (top N levels).
- **`Get-DargslanEveryoneAcls`** — Find ACEs granting Everyone / Authenticated Users excessive rights.
- **`Get-DargslanBrokenAclInheritance`** — Find folders with inheritance disabled (likely a one-off override).
- **`Get-DargslanOrphanSidAcls`** — Find ACEs whose IdentityReference still resolves to a raw SID.
- **`Get-DargslanNtfsAclAuditReport`** — Combined NTFS audit with PASS / WARN / FAIL verdict.
- **`Export-DargslanNtfsAclAuditReport`** — Export the NTFS audit to HTML and JSON.


## Quick start

```powershell
Import-Module Dargslan.NtfsAclAudit
Get-Command -Module Dargslan.NtfsAclAudit
```

## Resources

- 📖 Full guide: [https://dargslan.com/blog/ntfs-acl-permission-audit-powershell-2026](https://dargslan.com/blog/ntfs-acl-permission-audit-powershell-2026)
- 📄 Free PDF cheat sheet: [https://dargslan.com/cheat-sheets/ntfs-acl-permission-audit-2026](https://dargslan.com/cheat-sheets/ntfs-acl-permission-audit-2026)
- 🛒 210+ eBooks on Linux, Windows, cybersecurity: [dargslan.com](https://dargslan.com)
- 💻 GitHub: [Dargslan/powershell-admin-scripts](https://github.com/Dargslan/powershell-admin-scripts)



## License

MIT © 2026 Dargslan.

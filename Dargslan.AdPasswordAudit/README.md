# Dargslan.AdPasswordAudit

Audit Active Directory password and lockout policy, Fine Grained Password Policy and stale / never-expire accounts. Requires the ActiveDirectory module.

Part of the **Dargslan Windows Admin Tools** collection. Free cheat sheets and 210+ Linux / Windows / cybersecurity eBooks at [dargslan.com](https://dargslan.com).

## Install

```powershell
Install-Module Dargslan.AdPasswordAudit -Scope CurrentUser
Import-Module Dargslan.AdPasswordAudit
```

## Cmdlets

- **`Get-DargslanAdPasswordPolicy`** — Return the default domain password and lockout policy.
- **`Get-DargslanAdFineGrainedPolicies`** — Return Fine Grained Password Policies (PSO) and the accounts they apply to.
- **`Get-DargslanAdStaleAccounts`** — Find enabled accounts with no logon for N days (default 90).
- **`Get-DargslanAdPasswordAuditReport`** — Combined report with PASS / WARN / FAIL verdict.
- **`Export-DargslanAdPasswordAuditReport`** — Export the AD password audit to HTML and JSON.


## Quick start

```powershell
Import-Module Dargslan.AdPasswordAudit
Get-Command -Module Dargslan.AdPasswordAudit
```

## Resources

- 📖 Full guide: [https://dargslan.com/blog/ad-password-policy-audit-powershell-2026](https://dargslan.com/blog/ad-password-policy-audit-powershell-2026)
- 📄 Free PDF cheat sheet: [https://dargslan.com/cheat-sheets/ad-password-policy-audit-2026](https://dargslan.com/cheat-sheets/ad-password-policy-audit-2026)
- 🛒 210+ eBooks on Linux, Windows, cybersecurity: [dargslan.com](https://dargslan.com)
- 💻 GitHub: [Dargslan/powershell-admin-scripts](https://github.com/Dargslan/powershell-admin-scripts)



## License

MIT © 2026 Dargslan.

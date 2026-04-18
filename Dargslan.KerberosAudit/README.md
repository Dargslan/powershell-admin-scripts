# Dargslan.KerberosAudit

Audit Kerberos posture in Active Directory: unconstrained delegation, duplicate SPNs and AS-REP roastable accounts.

Part of the **Dargslan Windows Admin Tools** collection. Free cheat sheets and 210+ Linux / Windows / cybersecurity eBooks at [dargslan.com](https://dargslan.com).

## Install

```powershell
Install-Module Dargslan.KerberosAudit -Scope CurrentUser
Import-Module Dargslan.KerberosAudit
```

## Cmdlets

- **`Get-DargslanUnconstrainedDelegation`** — Find user / computer accounts with TRUSTED_FOR_DELEGATION (unconstrained).
- **`Get-DargslanConstrainedDelegation`** — Find accounts with constrained / Resource-Based delegation.
- **`Get-DargslanDuplicateSpns`** — Find duplicate Service Principal Names across all accounts.
- **`Get-DargslanAsRepRoastable`** — Find accounts with DONT_REQ_PREAUTH (AS-REP roastable).
- **`Get-DargslanKerberosAuditReport`** — Combined Kerberos audit with PASS / WARN / FAIL verdict.
- **`Export-DargslanKerberosAuditReport`** — Export the Kerberos audit to HTML and JSON.


## Quick start

```powershell
Import-Module Dargslan.KerberosAudit
Get-Command -Module Dargslan.KerberosAudit
```

## Resources

- 📖 Full guide: [https://dargslan.com/blog/kerberos-delegation-audit-powershell-2026](https://dargslan.com/blog/kerberos-delegation-audit-powershell-2026)
- 📄 Free PDF cheat sheet: [https://dargslan.com/cheat-sheets/kerberos-delegation-audit-2026](https://dargslan.com/cheat-sheets/kerberos-delegation-audit-2026)
- 🛒 210+ eBooks on Linux, Windows, cybersecurity: [dargslan.com](https://dargslan.com)
- 💻 GitHub: [Dargslan/powershell-admin-scripts](https://github.com/Dargslan/powershell-admin-scripts)



## License

MIT © 2026 Dargslan.

# Dargslan.HyperVSecurityAudit

Audit Hyper-V VMs: Secure Boot, vTPM, Shielded VM, snapshot retention, integration components. JSON / HTML report.

Part of the **Dargslan Windows Admin Tools** collection. Free cheat sheets and 210+ Linux / Windows / cybersecurity eBooks at [dargslan.com](https://dargslan.com).

## Install

```powershell
Install-Module Dargslan.HyperVSecurityAudit -Scope CurrentUser
Import-Module Dargslan.HyperVSecurityAudit
```

## Cmdlets

- **`Get-DargslanVmSecurityState`** — Per-VM Secure Boot, vTPM, Shielded VM and Generation state.
- **`Get-DargslanVmSnapshots`** — Per-VM checkpoint count and oldest checkpoint age.
- **`Get-DargslanVmIntegrationServices`** — Integration components state per VM.
- **`Get-DargslanHyperVAuditReport`** — Combined Hyper-V audit with PASS / WARN / FAIL verdict.
- **`Export-DargslanHyperVAuditReport`** — Export the Hyper-V audit to HTML and JSON.


## Quick start

```powershell
Import-Module Dargslan.HyperVSecurityAudit
Get-Command -Module Dargslan.HyperVSecurityAudit
```

## Resources

- 📖 Full guide: [https://dargslan.com/blog/hyperv-vm-security-audit-powershell-2026](https://dargslan.com/blog/hyperv-vm-security-audit-powershell-2026)
- 📄 Free PDF cheat sheet: [https://dargslan.com/cheat-sheets/hyperv-vm-security-audit-2026](https://dargslan.com/cheat-sheets/hyperv-vm-security-audit-2026)
- 🛒 210+ eBooks on Linux, Windows, cybersecurity: [dargslan.com](https://dargslan.com)
- 💻 GitHub: [Dargslan/powershell-admin-scripts](https://github.com/Dargslan/powershell-admin-scripts)



## License

MIT © 2026 Dargslan.

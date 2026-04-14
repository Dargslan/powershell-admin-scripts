# dargslan-win-sysctl-audit

**Windows Windows registry security settings auditor — system hardening parameters**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-sysctl-audit
```

## Usage

### Command Line
```bash
dargslan-win-sysctl-audit
dargslan-win-sysctl-audit --json
```

### Python API
```python
from dargslan_win_sysctl_audit import RegistryAudit

tool = RegistryAudit()
report = tool.check()
print(report)
```

## Features

- `check_security_settings()` — Check security settings
- `check_network_hardening()` — Check network hardening
- `check_audit_policy()` — Check audit policy

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan

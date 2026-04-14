# dargslan-win-sudoers-audit

**Windows Windows local admin & privilege auditor — admin group, elevated processes**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-sudoers-audit
```

## Usage

### Command Line
```bash
dargslan-win-sudoers-audit
dargslan-win-sudoers-audit --json
```

### Python API
```python
from dargslan_win_sudoers_audit import AdminAudit

tool = AdminAudit()
report = tool.check()
print(report)
```

## Features

- `list_admins()` — List admins
- `check_elevated()` — Check elevated
- `check_runas()` — Check runas
- `audit_privileges()` — Audit privileges

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan

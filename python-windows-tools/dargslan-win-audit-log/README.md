# dargslan-win-audit-log

**Windows Security Event Log analyzer — logon events, policy changes, privilege use**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-audit-log
```

## Usage

### Command Line
```bash
dargslan-win-audit-log
dargslan-win-audit-log --json
```

### Python API
```python
from dargslan_win_audit_log import SecurityAuditLog

tool = SecurityAuditLog()
report = tool.full_audit()
print(report)
```

## Features

- `get_logon_events()` — Get logon events
- `get_failed_logons()` — Get failed logons
- `get_policy_changes()` — Get policy changes
- `get_privilege_use()` — Get privilege use
- `full_audit()` — Full audit

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan

# dargslan-win-lastlog-audit

**Windows Windows last logon auditor — user login history, stale accounts**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-lastlog-audit
```

## Usage

### Command Line
```bash
dargslan-win-lastlog-audit
dargslan-win-lastlog-audit --json
```

### Python API
```python
from dargslan_win_lastlog_audit import LastLogonAudit

tool = LastLogonAudit()
report = tool.check()
print(report)
```

## Features

- `get_last_logons()` — Get last logons
- `find_stale_accounts()` — Find stale accounts
- `check_service_accounts()` — Check service accounts

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan

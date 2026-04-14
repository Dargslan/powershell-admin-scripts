# dargslan-win-fail2ban-audit

**Windows Windows account lockout & brute-force protection auditor**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-fail2ban-audit
```

## Usage

### Command Line
```bash
dargslan-win-fail2ban-audit
dargslan-win-fail2ban-audit --json
```

### Python API
```python
from dargslan_win_fail2ban_audit import AccountLockoutAudit

tool = AccountLockoutAudit()
report = tool.check()
print(report)
```

## Features

- `check_lockout_policy()` — Check lockout policy
- `get_locked_accounts()` — Get locked accounts
- `get_failed_logons()` — Get failed logons

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan

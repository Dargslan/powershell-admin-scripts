# dargslan-win-passwd-audit

**Windows Windows local user password policy auditor — complexity, expiry, history**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-passwd-audit
```

## Usage

### Command Line
```bash
dargslan-win-passwd-audit
dargslan-win-passwd-audit --json
```

### Python API
```python
from dargslan_win_passwd_audit import PasswordAudit

tool = PasswordAudit()
report = tool.check()
print(report)
```

## Features

- `check_policy()` — Check policy
- `check_expiry()` — Check expiry
- `find_never_expire()` — Find never expire
- `check_accounts()` — Check accounts

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan

# dargslan-win-user-audit

**Windows Windows user account auditor — local users, admin check, password policy**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-user-audit
```

## Usage

### Command Line
```bash
dargslan-win-user-audit
dargslan-win-user-audit --json
```

### Python API
```python
from dargslan_win_user_audit import UserAudit

tool = UserAudit()
report = tool.full_audit()
print(report)
```

## Features

- `list_users()` — List users
- `check_admins()` — Check admins
- `check_passwords()` — Check passwords
- `find_disabled()` — Find disabled
- `full_audit()` — Full audit

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan

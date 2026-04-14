# dargslan-win-acl-check

**Windows NTFS ACL & permissions auditor — file/folder security, inheritance, owner checks**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-acl-check
```

## Usage

### Command Line
```bash
dargslan-win-acl-check
dargslan-win-acl-check --json
```

### Python API
```python
from dargslan_win_acl_check import AclCheck

tool = AclCheck()
report = tool.full_audit()
print(report)
```

## Features

- `check_folder_acl()` — Check folder acl
- `check_inheritance()` — Check inheritance
- `find_open_permissions()` — Find open permissions
- `audit_shares()` — Audit shares
- `full_audit()` — Full audit

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan

# dargslan-win-ssh-audit

**Windows Windows OpenSSH server auditor — config, keys, authentication settings**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-ssh-audit
```

## Usage

### Command Line
```bash
dargslan-win-ssh-audit
dargslan-win-ssh-audit --json
```

### Python API
```python
from dargslan_win_ssh_audit import SshAudit

tool = SshAudit()
report = tool.check()
print(report)
```

## Features

- `check_service()` — Check service
- `check_config()` — Check config
- `list_keys()` — List keys
- `check_auth_methods()` — Check auth methods

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan

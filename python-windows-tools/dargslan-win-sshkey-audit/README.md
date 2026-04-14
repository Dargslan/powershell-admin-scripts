# dargslan-win-sshkey-audit

**Windows Windows SSH key auditor — authorized keys, key strength, key management**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-sshkey-audit
```

## Usage

### Command Line
```bash
dargslan-win-sshkey-audit
dargslan-win-sshkey-audit --json
```

### Python API
```python
from dargslan_win_sshkey_audit import SshKeyAudit

tool = SshKeyAudit()
report = tool.check()
print(report)
```

## Features

- `list_keys()` — List keys
- `check_strength()` — Check strength
- `find_weak_keys()` — Find weak keys
- `check_authorized()` — Check authorized

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan

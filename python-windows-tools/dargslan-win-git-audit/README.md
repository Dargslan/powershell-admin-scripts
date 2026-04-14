# dargslan-win-git-audit

**Windows Windows Git installation & repository auditor**

Part of the [Dargslan Windows Admin Tools](https://dargslan.com) collection.

## Installation

```bash
pip install dargslan-win-git-audit
```

## Usage

### Command Line
```bash
dargslan-win-git-audit
dargslan-win-git-audit --json
```

### Python API
```python
from dargslan_win_git_audit import GitAudit

tool = GitAudit()
report = tool.check()
print(report)
```

## Features

- `check_installation()` — Check installation
- `list_repos()` — List repos
- `check_config()` — Check config
- `audit_hooks()` — Audit hooks

## More Dargslan Tools

- **Homepage**: [dargslan.com](https://dargslan.com)
- **Free Cheat Sheets**: [dargslan.com/cheat-sheets](https://dargslan.com/cheat-sheets)
- **Windows & DevOps eBooks**: [dargslan.com/books](https://dargslan.com/books)
- **All PyPI Packages**: [pypi.org/user/dargslan](https://pypi.org/user/dargslan/)
- **PowerShell Modules**: [PowerShell Gallery](https://www.powershellgallery.com/profiles/Dargslan)

## License

MIT — (c) 2025 Dargslan
